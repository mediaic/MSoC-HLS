import numpy as np


class Transformable:
    def __init__(self, transform):
        self.transform = transform
        self.scale = 1

    def set_scale(self, scale):
        self.scale = scale

    def translate_local_z(self, offset):
        pass

    def translate_local_y(self, offset):
        pass

    def translate_local_z(self, offset):
        pass

    def lookat(self, pos):
        pass

    def translate_x(self, offset):
        self.transform[0, 3] += offset

    def translate_y(self, offset):
        self.transform[1, 3] += offset

    def translate_z(self, offset):
        self.transform[2, 3] += offset

    def rotate_x(self, degree):
        c = np.cos(degree * np.pi / 180)
        s = np.sin(degree * np.pi / 180)
        self.transform = self.transform @ np.array([
            [1.0, 0.0, 0.0, 0.0],
            [0.0,   c,  -s, 0.0],
            [0.0,   s,   c, 0.0],
            [0.0, 0.0, 0.0, 1.0],
        ])

    def rotate_y(self, degree):
        c = np.cos(degree * np.pi / 180)
        s = np.sin(degree * np.pi / 180)
        self.transform = self.transform @ np.array([
            [  c, 0.0,   s, 0.0],
            [0.0, 1.0, 0.0, 0.0],
            [ -s, 0.0,   c, 0.0],
            [0.0, 0.0, 0.0, 1.0],
        ])

    def rotate_z(self, degree):
        c = np.cos(degree * np.pi / 180)
        s = np.sin(degree * np.pi / 180)
        self.transform = self.transform @ np.array([
            [  c,  -s, 0.0, 0.0],
            [  s,   c, 0.0, 0.0],
            [0.0, 0.0, 1.0, 0.0],
            [0.0, 0.0, 0.0, 1.0],
        ])
