from time import time

import cv2
import numpy as np

from scene import Scene
from light import Light
from camera import Camera
from game_object import GameObject


def triangle_area(v0, v1, v2):
    """
    | v01[0] v01[1] |
    | v02[0] v02[1] | = v01[0]*v02[1] - v01[1]*v02[0]
    """
    return (v1[0]-v0[0])*(v2[1]-v0[1]) - (v1[1]-v0[1])*(v2[0]-v0[0])


def convert_map_for_vis(m, ignore=np.inf):
    m = np.array(m)
    m[m == ignore] = 1
    m_min = np.min(m[m != 1])
    m_max = np.max(m[m != 1])
    m[m != 1] = (m[m != 1] - m_min) / (m_max - m_min) * 0.8
    return m


def geometric_transform(scene):
    world_to_camera = scene.camera.world_to_camera
    world_to_light = scene.light.world_to_light

    near_clip = scene.camera.near_clip
    far_clip = scene.camera.far_clip

    # for light.shadow_map_param
    sxmin, sxmax = np.inf, -np.inf
    symin, symax = np.inf, -np.inf

    for obj in scene.objects:
        for name, mesh in obj.mesh.mesh.items():
            mesh_format = mesh['format']  # V: vertex, N: normal, T: texture
            if mesh_format == 'V3F':
                step = 3
            elif mesh_format == 'N3F_V3F':
                step = 6
            elif mesh_format == 'T2F_V3F':
                step = 5
            elif mesh_format == 'T2F_N3F_V3F':
                step = 8
            else:
                assert False, 'invalid mesh_format'

            vertices = mesh['vertices']

            for i in range(0, len(vertices), step*3):
                # triangle vertex coordinates and scaling
                v0 = np.array([[*vertices[i+1*step-3:i+1*step], 1]]).T * obj.scale
                v1 = np.array([[*vertices[i+2*step-3:i+2*step], 1]]).T * obj.scale
                v2 = np.array([[*vertices[i+3*step-3:i+3*step], 1]]).T * obj.scale
                v0[3, 0] = 1
                v1[3, 0] = 1
                v2[3, 0] = 1

                if False and 'N3F' in mesh_format:
                    # triangle vertex normal vectors
                    n0 = np.array([vertices[i+1*step-6:i+1*step-3]]).T
                    n1 = np.array([vertices[i+2*step-6:i+2*step-3]]).T
                    n2 = np.array([vertices[i+3*step-6:i+3*step-3]]).T
                else:
                    # if the model does not provide normal vectors, generate normal from triangle vertices
                    n = np.cross((v1-v0)[:3, 0], (v2-v0)[:3, 0])
                    n = np.expand_dims(n / np.linalg.norm(n), 1)
                    n0 = n
                    n1 = n
                    n2 = n

                if 'T2F' in mesh_format:
                    # triangle vertex texture coordinates
                    t0 = vertices[i+0*step:i+0*step+2]
                    t1 = vertices[i+1*step:i+1*step+2]
                    t2 = vertices[i+2*step:i+2*step+2]
                else:
                    t0 = np.array([0, 0])
                    t1 = np.array([0, 0])
                    t2 = np.array([0, 0])

                # cv: (vertex camera coordinate)
                #       = (world to camera) x (object transform) x (vertex object coordinate)
                cv0 = (world_to_camera @ obj.transform @ v0).squeeze()[:3]
                cv1 = (world_to_camera @ obj.transform @ v1).squeeze()[:3]
                cv2 = (world_to_camera @ obj.transform @ v2).squeeze()[:3]

                # cn: (normal camera coordinate)
                #       = (world to camera rotation) x (object transform rotation) x (normal object coordinate)
                cn0 = (world_to_camera[:3, :3] @ obj.transform[:3, :3] @ n0).squeeze()
                cn1 = (world_to_camera[:3, :3] @ obj.transform[:3, :3] @ n1).squeeze()
                cn2 = (world_to_camera[:3, :3] @ obj.transform[:3, :3] @ n2).squeeze()

                # lv: (vertex light coordinate)
                #       = (world to light) x (object transform) x (vertex object coordinate)
                lv0 = (world_to_light @ obj.transform @ v0).squeeze()[:3]
                lv1 = (world_to_light @ obj.transform @ v1).squeeze()[:3]
                lv2 = (world_to_light @ obj.transform @ v2).squeeze()[:3]

                # update shadow map min/max valud
                sxmin = min(sxmin, lv0[0], lv1[0], lv2[0])
                sxmax = max(sxmax, lv0[0], lv1[0], lv2[0])
                symin = min(symin, lv0[1], lv1[1], lv2[1])
                symax = max(symax, lv0[1], lv1[1], lv2[1])

                # if triangle faces light source, add it to light_vertices list
                if triangle_area(lv0, lv1, lv2) > 0:
                    mesh['light_vertices'].extend([*lv0, *lv1, *lv2])

                # near/far frustum clipping
                # if min(-cv0[2], -cv1[2], -cv2[2]) > far_clip or max(-cv0[2], -cv1[2], -cv2[2]) < near_clip:
                #     continue

                # camera coordinate backface culling
                # if triangle_area(cv0, cv1, cv2) > 0:
                #     mesh['cam_vertices'].extend([*t0, *cn0, *cv0, *t1, *cn1, *cv1, *t2, *cn2, *cv2])
                mesh['cam_vertices'].extend([*t0, *cn0, *cv0, *t1, *cn1, *cv1, *t2, *cn2, *cv2])

        mesh['cam_vertices'] = np.array(mesh['cam_vertices'])
        mesh['light_vertices'] = np.array(mesh['light_vertices'])

    # expand shadow map range by 10%
    sscale = scene.light.shadow_map_dim / (max(sxmax-sxmin, symax-symin) * 1.2)
    sxoff = sxmin - (sxmax-sxmin)*0.1
    syoff = symin - (symax-symin)*0.1
    scene.light.shadow_map_param = [sxoff, sscale, syoff, sscale]


def shadow_mapping(scene, shadow_map):
    light = scene.light

    shadow_map_dim = shadow_map.shape[0]
    assert shadow_map.shape[0] == shadow_map.shape[1] == light.shadow_map_dim

    for obj in scene.objects:
        for name, mesh in obj.mesh.mesh.items():
            light_vertices = mesh['light_vertices']

            for i in range(0, len(light_vertices), 9):
                # sv: (vertex shadow map coordinate)
                #       = (shadow map projection matrix) x (vertex light coordinate)
                sv0 = light.project(light_vertices[i+0:i+3])
                sv1 = light.project(light_vertices[i+3:i+6])
                sv2 = light.project(light_vertices[i+6:i+9])

                # shadow map coordinate backface culling
                area = triangle_area(sv0, sv1, sv2)
                if area <= 0:
                    continue

                # triangle bounding box
                symax = min(shadow_map_dim, int(max(sv0[1], sv1[1], sv2[1])))
                symin = max(0, int(min(sv0[1], sv1[1], sv2[1])))
                sxmax = min(shadow_map_dim, int(max(sv0[0], sv1[0], sv2[0])))
                sxmin = max(0, int(min(sv0[0], sv1[0], sv2[0])))

                # update shadow map
                for sy in range(symin, symax+1):
                    for sx in range(sxmin, sxmax+1):
                        w0 = triangle_area(sv1, sv2, (sx, sy))
                        w1 = triangle_area(sv2, sv0, (sx, sy))
                        w2 = triangle_area(sv0, sv1, (sx, sy))

                        if (w0 >= 0) and (w1 >= 0) and (w2 >= 0):
                            # interpolate and update shadow map z-value
                            sz = -(w0*sv0[2] + w1*sv1[2] + w2*sv2[2]) / area
                            shadow_map[sy, sx] = min(shadow_map[sy, sx], sz)


def rasterization(scene, depth_buffer, raster_buffer):
    camera = scene.camera
    light = scene.light
    height, width = depth_buffer.shape

    # normalized light direction vector
    lnorm = camera.world_to_camera[:3, :3] @ light.norm

    print('transformed lnorm:', lnorm)

    # ambient light (range: 0.0~1.0)
    lambt = light.ambient

    for obj_id, obj in enumerate(scene.objects):
        for name, mesh in obj.mesh.mesh.items():
            vertices = mesh['cam_vertices']
            step, ti0, ti1, ni0, ni1, vi0, vi1 = 8, 0, 2, 2, 5, 5, 8

            for i in range(0, len(vertices), step*3):
                # cv: vertex camera coordinate
                cv0 = vertices[i+0*step+vi0:i+0*step+vi1]
                cv1 = vertices[i+1*step+vi0:i+1*step+vi1]
                cv2 = vertices[i+2*step+vi0:i+2*step+vi1]

                # fv: (vertex frame coordinate)
                #       = (frame projection matrix) x (vertex camera coordinate)
                # NOTE: frame y is inverted
                fv0 = camera.project(cv0)
                fv1 = camera.project(cv1)
                fv2 = camera.project(cv2)

                # t: triangle vertex texture coordinates
                t0 = vertices[i+0*step+ti0:i+0*step+ti1]
                t1 = vertices[i+1*step+ti0:i+1*step+ti1]
                t2 = vertices[i+2*step+ti0:i+2*step+ti1]

                area = triangle_area(fv2, fv1, fv0)
                if area <= 0:
                    continue

                cn0 = vertices[i+0*step+ni0:i+0*step+ni1]
                cn1 = vertices[i+1*step+ni0:i+1*step+ni1]
                cn2 = vertices[i+2*step+ni0:i+2*step+ni1]

                fymax = int(np.round(min(height-1, max(fv0[1], fv1[1], fv2[1]))))
                fymin = int(np.round(max(0, min(fv0[1], fv1[1], fv2[1]))))
                fxmax = int(np.round(min(width-1, max(fv0[0], fv1[0], fv2[0]))))
                fxmin = int(np.round(max(0, min(fv0[0], fv1[0], fv2[0]))))

                l0 = lambt + np.dot(cn0, lnorm) * (1 - lambt)
                l1 = lambt + np.dot(cn1, lnorm) * (1 - lambt)
                l2 = lambt + np.dot(cn2, lnorm) * (1 - lambt)

                fz0_1 = 1 / fv0[2]
                fz1_1 = 1 / fv1[2]
                fz2_1 = 1 / fv2[2]

                for fy in range(fymin, fymax+1):
                    for fx in range(fxmin, fxmax+1):
                        w0 = triangle_area((fx, fy), fv2, fv1) / area
                        w1 = triangle_area((fx, fy), fv0, fv2) / area
                        w2 = triangle_area((fx, fy), fv1, fv0) / area

                        if (w0 >= 0) and (w1 >= 0) and (w2 >= 0):
                            fz_1 = w0*fz0_1 + w1*fz1_1 + w2*fz2_1
                            fz = 1 / fz_1

                            if fz < depth_buffer[fy, fx]:
                                tex = (w0*t0*fz0_1 + w1*t1*fz1_1 + w2*t2*fz2_1) * fz
                                lum = (w0*l0*fz0_1 + w1*l1*fz1_1 + w2*l2*fz2_1) * fz
                                raster_buffer[0, fy, fx] = obj_id
                                raster_buffer[1, fy, fx] = tex[0]
                                raster_buffer[2, fy, fx] = tex[1]
                                raster_buffer[3, fy, fx] = lum
                                depth_buffer[fy, fx] = fz


def shadow_raster(scene, shadow_buffer, depth_buffer, shadow_map):
    camera = scene.camera
    height, width = shadow_buffer.shape

    assert shadow_map.shape[0] == shadow_map.shape[1]
    shadow_map_dim = shadow_map.shape[0]

    light = scene.light
    lnorm = camera.world_to_camera[:3, :3] @ light.norm
    camera_to_light = light.world_to_light @ camera.camera_to_world
    shadow_map_bias = light.shadow_map_bias

    for obj in scene.objects:
        for name, mesh in obj.mesh.mesh.items():
            vertices = mesh['cam_vertices']
            step, ti0, ti1, ni0, ni1, vi0, vi1 = 8, 0, 2, 2, 5, 5, 8

            light_vertices = mesh['light_vertices']

            for i in range(0, len(vertices), step*3):
                cv0 = np.array([[*vertices[i+0*step+vi0:i+0*step+vi1], 1]]).T
                cv1 = np.array([[*vertices[i+1*step+vi0:i+1*step+vi1], 1]]).T
                cv2 = np.array([[*vertices[i+2*step+vi0:i+2*step+vi1], 1]]).T

                # lv0 = light_vertices[]
                # lv1 =
                # lv2 =

                cnorm = vertices[i+0*step+ni0:i+0*step+ni1]

                # frame vertices, y-coord is inverted
                fv0 = camera.project(cv0)
                fv1 = camera.project(cv1)
                fv2 = camera.project(cv2)

                area = -triangle_area(fv0, fv1, fv2)
                if area <= 0:
                    continue

                fz0_1 = 1 / fv0[2]
                fz1_1 = 1 / fv1[2]
                fz2_1 = 1 / fv2[2]

                fymax = int(np.round(min(height-1, max(fv0[1], fv1[1], fv2[1]))))
                fymin = int(np.round(max(0, min(fv0[1], fv1[1], fv2[1]))))
                fxmax = int(np.round(min(width-1, max(fv0[0], fv1[0], fv2[0]))))
                fxmin = int(np.round(max(0, min(fv0[0], fv1[0], fv2[0]))))

                sv0 = light.project((camera_to_light @ cv0).squeeze()[:3])
                sv1 = light.project((camera_to_light @ cv1).squeeze()[:3])
                sv2 = light.project((camera_to_light @ cv2).squeeze()[:3])

                bias = shadow_map_bias * np.tan(np.arccos(np.dot(cnorm, lnorm)))
                np.clip(bias, 0, shadow_map_bias)

                for fy in range(fymin, fymax+1):
                    for fx in range(fxmin, fxmax+1):
                        w0 = triangle_area((fx, fy), fv2, fv1) / area
                        w1 = triangle_area((fx, fy), fv0, fv2) / area
                        w2 = triangle_area((fx, fy), fv1, fv0) / area

                        if (w0 >= 0) and (w1 >= 0) and (w2 >= 0):
                            fz_1 = w0*fz0_1 + w1*fz1_1 + w2*fz2_1
                            fz = 1 / fz_1

                            if fz < depth_buffer[fy, fx] + 0.1:  # TODO: configurable threshold
                                sv = (w0*sv0*fz0_1 + w1*sv1*fz1_1 + w2*sv2*fz2_1) * fz

                                sx = int(np.round(sv[0]))
                                sy = int(np.round(sv[1]))
                                sz = -sv[2]

                                if (0 <= sx < shadow_map_dim) and (0 <= sy < shadow_map_dim) \
                                        and (sz < shadow_map[sy, sx] + bias < np.inf):
                                    shadow_buffer[fy, fx] = 1


def texture_mapping(scene, raster_buffer, frame_buffer):
    image_height = frame_buffer.shape[0]
    image_width = frame_buffer.shape[1]

    for y in range(image_height):
        for x in range(image_width):
            obj_id = int(raster_buffer[0, y, x])
            texture = scene.objects[obj_id].texture
            lum = raster_buffer[3, y, x]

            if lum > 0.0:
                tx = raster_buffer[1, y, x]
                ty = 1 - raster_buffer[2, y, x]
                ty = int(np.clip(np.round(ty * texture.shape[0]), 0, texture.shape[0] - 1))
                tx = int(np.clip(np.round(tx * texture.shape[1]), 0, texture.shape[1] - 1))
                frame_buffer[y, x, :] = (texture[ty, tx, :] * lum)


def render(scene):
    image_width = scene.camera.image_width
    image_height = scene.camera.image_height
    shadow_map_dim = scene.light.shadow_map_dim

    shadow_map = np.ones((shadow_map_dim, shadow_map_dim)) * np.inf
    depth_buffer = np.ones((image_height, image_width)) * scene.camera.far_clip
    shadow_buffer = np.zeros((image_height, image_width))
    raster_buffer = np.zeros((4, image_height, image_width))  # texY, texX, luminance
    frame_buffer = np.zeros((image_height, image_width, 3))

    # geometric (mesh transform, clipping, backface culling)
    t0 = time()
    geometric_transform(scene)
    print('{:25s}:'.format('geometric_transform()'), time() - t0)

    # shadow mapping
    t0 = time()
    shadow_mapping(scene, shadow_map)
    print('{:25s}:'.format('shadow_mapping()'), time() - t0)
    shadow_map_vis = convert_map_for_vis(shadow_map, ignore=np.inf)
    cv2.imshow('shadow map', cv2.resize(shadow_map_vis[::-1, :], (512, 512)))

    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>')
    hls_rasterization_testdata = []
    for obj in scene.objects:
        for name, mesh in obj.mesh.mesh.items():
            hls_rasterization_testdata.extend(mesh['cam_vertices'])
    print("num_faces: ", int(len(hls_rasterization_testdata)/24))
    print("lnorm:     ", scene.light.norm)
    print("cam_scale: ", scene.camera.scale)
    print("cam_offset:", scene.camera.offset)

    with open('scene.txt', "w") as f:
        for x in hls_rasterization_testdata:
            f.write("{:.6f}\n".format(x))
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>')

    # rasterization (z buffer)
    t0 = time()
    rasterization(scene, depth_buffer, raster_buffer)
    print('{:25s}:'.format('rasterization()'), time() - t0)

    # shadow rasterization
    t0 = time()
    shadow_raster(scene, shadow_buffer, depth_buffer, shadow_map)
    print('{:25s}:'.format('shadow_raster()'), time() - t0)
    cv2.imshow('shadow rasterization', shadow_buffer)

    # texture mapping
    t0 = time()
    texture_mapping(scene, raster_buffer, frame_buffer)
    print('{:25s}:'.format('texture_mapping()'), time() - t0)

    # cv2.imshow('blend', frame_buffer * (shadow_buffer[:, :, np.newaxis]*0.5+0.5))  # TODO: ambient
    cv2.imshow('blend', frame_buffer)  # TODO: ambient
    cv2.waitKey()


def scene1():
    scene = Scene()

    obj = GameObject('0')
    obj.load_mesh('../data/deer.obj')
    obj.set_scale(1/30)
    obj.translate_x(10)
    obj.rotate_y(-35)
    scene.objects += [obj]

    obj = GameObject('1')
    obj.load_mesh('../data/cube.obj')
    obj.set_scale(100)
    obj.translate_x(-50)
    obj.translate_y(-100)
    obj.translate_z(-50)
    scene.objects += [obj]

    obj = GameObject('2')
    obj.load_mesh('../data/camero.obj')
    obj.load_texture('../data/camero.png', 64)
    obj.set_scale(10)
    obj.translate_x(-20)
    obj.translate_z(8)
    obj.rotate_y(-45)
    scene.objects += [obj]

    scene.light = Light()
    scene.light.shadow_map_dim = 64
    scene.light.shadow_map_bias = 1
    scene.light.translate_z(1000)
    scene.light.translate_y(1500)
    scene.light.translate_x(2000)
    scene.light.rotate_y(100)
    scene.light.rotate_x(35)

    image_width = 320
    image_height = 240

    scene.camera = Camera(0.98, 0.735, image_width, image_height, 1, 10000, 20, np.eye(4))
    scene.camera.translate_y(60)
    scene.camera.translate_z(60)
    scene.camera.rotate_x(35)

    print(scene.camera.world_to_camera)

    return scene


def scene2():
    scene = Scene()

    obj = GameObject('0')
    obj.load_mesh('../data/camero.obj')
    obj.load_texture('../data/camero.png', 256)
    obj.set_scale(20)
    obj.rotate_y(-45)
    scene.objects += [obj]

    scene.light = Light()
    scene.light.shadow_map_dim = 512
    scene.light.shadow_map_bias = 1
    scene.light.translate_z(1000)
    scene.light.translate_y(1500)
    scene.light.translate_x(2000)
    scene.light.rotate_y(100)
    scene.light.rotate_x(45)

    image_width = 640
    image_height = 480

    scene.camera = Camera(0.98, 0.735, image_width, image_height, 1, 10000, 20, np.eye(4))
    scene.camera.translate_y(40)
    scene.camera.translate_z(60)
    scene.camera.rotate_x(35)

    return scene


if __name__ == '__main__':
    scene = scene1()

    render(scene)
