import cv2
import numpy as np


if __name__ == '__main__':
    img = np.zeros((480, 640, 3))

    with open('result.txt') as f:
        for i in range(480):
            for j in range(640):
                line = f.readline()
                line = line.split()
                line = [float(x)/255 for x in line]
                img[i, j, :] = line

    cv2.imshow('', img)
    cv2.waitKey()
