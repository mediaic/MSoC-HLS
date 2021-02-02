from pprint import pprint

import cv2
import numpy as np
import pywavefront


class Mesh:
    def __init__(self, obj_file=None):
        self.mesh = {}

        if obj_file is not None:
            self.load(obj_file)

    def load(self, obj_file):
        print('+ loading obj file: ', obj_file, '\n')
        obj = pywavefront.Wavefront(obj_file, create_materials=True)

        for name, material in obj.materials.items():
            print('>', name)
            print('   Format:  ', material.vertex_format)
            print('   Vertices:', len(material.vertices))

            self.mesh[name] = {
                'format': material.vertex_format,
                'vertices': np.array(material.vertices),
                'cam_vertices': [],
                'light_vertices': []
            }


if __name__ == '__main__':
    mesh = Mesh(obj_file='../data/cube.obj')
