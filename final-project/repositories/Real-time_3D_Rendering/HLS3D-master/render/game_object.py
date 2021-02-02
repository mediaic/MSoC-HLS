import cv2
import numpy as np

from mesh import Mesh
from transformable import Transformable


class GameObject(Transformable):
    def __init__(self, name):
        super().__init__(np.eye(4))
        self.name = name
        self.mesh = None
        self.texture = np.ones((1, 1, 3))
        self.rigid_body = None

    def load_mesh(self, obj_file):
        self.mesh = Mesh(obj_file)

    def load_texture(self, texture_file, size=64):
        self.texture = cv2.resize(cv2.imread(texture_file), (size, size)) / 255.0
