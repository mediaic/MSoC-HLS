import numpy as np
np.set_printoptions(precision=2, suppress=True)


class CameraBase:
    def __init__(self, world_to_camera):
        self.world_to_camera = world_to_camera

    @property
    def camera_to_world(self):
        return np.linalg.inv(self.world_to_camera)

    def translate_local_z(self, offset):
        pass

    def translate_local_y(self, offset):
        pass

    def translate_local_z(self, offset):
        pass

    def lookat(self, pos):
        pass

    def translate_x(self, offset):
        camera_to_world = self.camera_to_world
        camera_to_world[0, 3] += offset
        self.world_to_camera = np.linalg.inv(camera_to_world)

    def translate_y(self, offset):
        camera_to_world = self.camera_to_world
        camera_to_world[1, 3] += offset
        self.world_to_camera = np.linalg.inv(camera_to_world)

    def translate_z(self, offset):
        camera_to_world = self.camera_to_world
        camera_to_world[2, 3] += offset
        self.world_to_camera = np.linalg.inv(camera_to_world)

    # FIXME: incorrect rotation
    def rotate_x(self, degree):
        c = np.cos(degree * np.pi / 180)
        s = np.sin(degree * np.pi / 180)
        self.world_to_camera = np.array([
            [1.0, 0.0, 0.0, 0.0],
            [0.0, c, -s, 0.0],
            [0.0, s, c, 0.0],
            [0.0, 0.0, 0.0, 1.0]]) @ self.world_to_camera

    def rotate_y(self, degree):
        c = np.cos(-degree * np.pi / 180)
        s = np.sin(-degree * np.pi / 180)
        self.world_to_camera = np.array([
            [c, 0.0, s, 0.0],
            [0.0, 1.0, 0.0, 0.0],
            [-s, 0.0, c, 0.0],
            [0.0, 0.0, 0.0, 1.0]]) @ self.world_to_camera

    def rotate_z(self, degree):
        c = np.cos(-degree * np.pi / 180)
        s = np.sin(-degree * np.pi / 180)
        self.world_to_camera = np.array([
            [c, -s, 0.0, 0.0],
            [s, c, 0.0, 0.0],
            [0.0, 0.0, 1.0, 0.0],
            [0.0, 0.0, 0.0, 1.0]]) @ self.world_to_camera


class Camera(CameraBase):
    def __init__(self, film_width, film_height, image_width, image_height,
                 near_clip, far_clip, focal_length, world_to_camera):
        super().__init__(world_to_camera)

        self.film_width = film_width
        self.film_height = film_height
        self.image_width = image_width
        self.image_height = image_height
        self.near_clip = near_clip
        self.far_clip = far_clip
        self.focal_length = focal_length

        self.film_ratio = film_width / film_height
        self.image_ratio = image_width / image_height

        self.plane_width = (film_width * 25.4) * (near_clip / focal_length)
        self.plane_height = (film_height * 25.4) * (near_clip / focal_length)

        if self.film_ratio > self.image_ratio:
            self.plane_height *= self.film_ratio / self.image_ratio
        else:
            self.plane_width *= self.image_ratio / self.film_ratio

    @property
    def scale(self):
        return np.array([self.near_clip/self.plane_width*self.image_width,
                         self.near_clip/self.plane_height*self.image_height, -1.0])

    @property
    def offset(self):
        return np.array([0.5*self.image_width, 0.5*self.image_height, 0.0])

    def project(self, point):
        return point.squeeze()[:3] * self.scale / np.array([-point[2], point[2], 1]) + self.offset


if __name__ == '__main__':
    camera = Camera(0.98, 0.735, 640, 480, 1, 10000, 20,
                    np.array([
                        [1.0, 0.0, 0.0, 0.0],
                        [0.0, 1.0, 0.0, 0.0],
                        [0.0, 0.0, 1.0, -8.0],
                        [0.0, 0.0, 0.0, 1.0]
                    ]))
