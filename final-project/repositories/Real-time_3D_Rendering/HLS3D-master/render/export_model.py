import numpy as np

from game_object import GameObject


def export_mesh(obj):
    export_array = []

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
            v0 = np.array([[*vertices[i+1*step-3:i+1*step]]]).T * obj.scale
            v1 = np.array([[*vertices[i+2*step-3:i+2*step]]]).T * obj.scale
            v2 = np.array([[*vertices[i+3*step-3:i+3*step]]]).T * obj.scale

            if 'N3F' in mesh_format:
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

            assert len([*t0, *n0, *v0, *t1, *n1, *v1, *t2, *n2, *v2]) == 24, len([*t0, *n0, *v0, *t1, *n1, *v1, *t2, *n2, *v2])
            export_array.extend([*t0, *n0, *v0, *t1, *n1, *v1, *t2, *n2, *v2])

    return np.array(export_array)


def export_txtr(obj):
    txtr_array = np.zeros((64, 64)).astype(np.uint32)
    texture = (obj.texture * 255).astype(np.uint32)
    texture = np.transpose(texture, (1, 0, 2))
    texture = texture[:, ::-1, :]
    txtr_array = texture[:, :, 2] + texture[:, :, 0]*256 + texture[:, :, 1]*256*256
    return txtr_array.flatten()


if __name__ == '__main__':
    obj = GameObject('0')
    obj.load_mesh('../data/deer.obj')
    obj.set_scale(1/30)
    mesh_array = export_mesh(obj)
    np.save('01_mesh.npy', mesh_array)
    obj.translate_x(10)
    obj.rotate_y(-35)
    np.save('01_trns.npy', obj.transform)

    obj = GameObject('1')
    obj.load_mesh('../data/cube.obj')
    obj.set_scale(100)
    mesh_array = export_mesh(obj)
    np.save('02_mesh.npy', mesh_array)
    obj.translate_x(-50)
    obj.translate_y(-100)
    obj.translate_z(-50)
    np.save('02_trns.npy', obj.transform)

    obj = GameObject('2')
    obj.load_mesh('../data/camero.obj')
    obj.load_texture('../data/camero.png', 64)
    obj.set_scale(10)
    mesh_array = export_mesh(obj)
    txtr_array = export_txtr(obj)
    np.save('03_mesh.npy', mesh_array)
    np.save('03_txtr.npy', txtr_array)
    obj.translate_x(-20)
    obj.translate_z(8)
    obj.rotate_y(-45)
    np.save('03_trns.npy', obj.transform)
