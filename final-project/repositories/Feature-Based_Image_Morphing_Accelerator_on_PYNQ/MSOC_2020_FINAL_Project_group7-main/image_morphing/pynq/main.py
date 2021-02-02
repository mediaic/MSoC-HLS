from __future__ import print_function

import sys
import numpy as np
from time import time
from pynq import Overlay
from pynq import allocate
import cv2
from matplotlib import pyplot as plt
import argparse
import numpy as np
#from tqdm import trange
import imageio
import time

sys.path.append('/home/xilinx')
W = 256
H = 256
MAX_LINE_NUM = 8
LINE_NUM = 7
ref_ptr = []
src_ptr = []
dst_ptr = []
src_flag = False

dst_list = [71,96,100,87,121,84,152,84,98,131,83,171,89,190,119,186,112,134,123,175,168,100,147,176,65,115,69,180,110,93,100,118]
src_list = [89,83,116,87,134,81,163,89,131,155,117,202,119,214,145,208,137,160,146,199,183,106,175,185,73,102,89,183,127,92,132,137]

dst_img = cv2.imread('./aaaaa.jpg')
src_img = cv2.imread('./puipui.jpg')
src_img = cv2.resize(src_img, (W, H))
dst_img = cv2.resize(dst_img, (W, H))
morphed_img = np.zeros(src_img.shape)

# Declare buffer
line_src_point_buffer = allocate(shape=(LINE_NUM,), dtype=np.uint32)
line_src_len_buffer = allocate(shape=(LINE_NUM,), dtype=np.float32)
line_dst_point_buffer = allocate(shape=(LINE_NUM,), dtype=np.uint32)
line_dst_len_buffer = allocate(shape=(LINE_NUM,), dtype=np.float32)
line_tar_point_buffer = allocate(shape=(LINE_NUM,), dtype=np.uint32)
line_tar_len_buffer = allocate(shape=(LINE_NUM,), dtype=np.float32)
answer_buffer = allocate(shape=(W * H,), dtype=np.uint32)
    
# Initialize buffer
for i in range(LINE_NUM):
    for j in range(4):
        src_point = np.uint8(src_list[4*(i+1)-j-1])
        dst_point = np.uint8(dst_list[4*(i+1)-j-1])
        line_src_point_buffer[i] = np.left_shift(line_src_point_buffer[i], 8)
        line_src_point_buffer[i] = np.bitwise_or(line_src_point_buffer[i], src_point)
        line_dst_point_buffer[i] = np.left_shift(line_dst_point_buffer[i], 8)
        line_dst_point_buffer[i] = np.bitwise_or(line_dst_point_buffer[i], dst_point)

# line's length
for i in range(LINE_NUM):
    x_src = src_list[4 * i + 0] - src_list[4 * i + 2]
    y_src = src_list[4 * i + 1] - src_list[4 * i + 3]
    len_src = np.float32((x_src ** 2 + y_src ** 2) ** 0.5)
    line_src_len_buffer[i] = len_src
    x_dst = dst_list[4 * i + 0] - dst_list[4 * i + 2]
    y_dst = dst_list[4 * i + 1] - dst_list[4 * i + 3]
    len_dst = np.float32((x_dst ** 2 + y_dst ** 2) ** 0.5)
    line_dst_len_buffer[i] = len_dst

# Initialize Zedboard and kernel
ol = Overlay("/home/xilinx/IPbitFile/morph_fixed.bit")
ip_morphing = ol.image_morph_0
ip_morphing.write(0x10, line_src_point_buffer.device_address)
ip_morphing.write(0x18, line_src_len_buffer.device_address)
ip_morphing.write(0x30, line_dst_point_buffer.device_address)
ip_morphing.write(0x38, line_dst_len_buffer.device_address)
ip_morphing.write(0x40, np.int(LINE_NUM))
ip_morphing.write(0x48, np.int(0))
ip_morphing.write(0x50, answer_buffer.device_address)
ip_morphing.write(0x20, line_tar_point_buffer.device_address)
ip_morphing.write(0x28, line_tar_len_buffer.device_address)

video = []
for i in range(10):
    video.append(np.flip(src_img, axis=2))
tic = time.time()
for k in range(11):
    ip_morphing.write(0x10, line_src_point_buffer.device_address)
    ip_morphing.write(0x18, line_src_len_buffer.device_address)
    ip_morphing.write(0x30, line_dst_point_buffer.device_address)
    ip_morphing.write(0x38, line_dst_len_buffer.device_address)
    ip_morphing.write(0x40, np.int(LINE_NUM))
    ip_morphing.write(0x50, answer_buffer.device_address)
    ip_morphing.write(0x20, line_tar_point_buffer.device_address)
    ip_morphing.write(0x28, line_tar_len_buffer.device_address)
    alpha = 0.1 * k
    tar_list = [(1-alpha) * src_list[x] + alpha * dst_list[x] for x in range(len(src_list))]
    
    # pack target point
    for i in range(LINE_NUM):
        line_tar_point_buffer[i] = np.uint32(0)
        for j in range(4):
            tar_point = np.uint8(tar_list[4*(i+1)-j-1])
            line_tar_point_buffer[i] = np.left_shift(line_tar_point_buffer[i], 8)
            line_tar_point_buffer[i] = np.bitwise_or(line_tar_point_buffer[i], tar_point)
    
    # compute length
    for i in range(LINE_NUM):
        x_tar = tar_list[4 * i + 0] - tar_list[4 * i + 2]
        y_tar = tar_list[4 * i + 1] - tar_list[4 * i + 3]
        len_tar = np.float32((x_tar ** 2 + y_tar ** 2) ** 0.5)
        line_tar_len_buffer[i] = len_tar
    
    # Start IP
    #tic = time.time()
    ip_morphing.write(0x00, 0x01)
    #print("IP working...")
    while (ip_morphing.read(0x00) & 0x4) == 0x0:
        continue
    #print("IP finsih!")
    #toc = time.time()
    #print("Total execution time of hardware: {0}".format(toc-tic))
    
    # Blending
    src_coord_x = np.zeros((H, W))
    dst_coord_x = np.zeros((H, W))
    src_coord_y = np.zeros((H, W))
    dst_coord_y = np.zeros((H, W))

    buffer = np.transpose(np.resize(answer_buffer, (H, W)))
    #tic = time.time()
    src_coord_x = np.bitwise_and(buffer, np.uint8(255))
    buffer = np.right_shift(buffer, 8)
    src_coord_y = np.bitwise_and(buffer, np.uint8(255))
    buffer = np.right_shift(buffer, 8)
    dst_coord_x = np.bitwise_and(buffer, np.uint8(255))
    buffer = np.right_shift(buffer, 8)
    dst_coord_y = np.bitwise_and(buffer, np.uint8(255))
    morphed_img = (1-alpha) * src_img[src_coord_y.astype('uint8'), src_coord_x.astype('uint8'), :] + alpha * dst_img[dst_coord_y.astype('uint8'), dst_coord_x.astype('uint8'), :]
    #toc = time.time()
    #print("Blending time: {0}".format(toc-tic))
    video.append(np.flip(morphed_img, axis=2).astype('uint8'))
    #cv2.imwrite("{0}.jpg".format(str(k)), morphed_img.astype('uint8'))
    ip_morphing.write(0x48, np.int(1))
toc = time.time()
print("Total execution time of hardware: {0}".format(toc-tic))

for i in range(10):
    video.append(np.flip(dst_img, axis=2))
imageio.mimsave('./Morphing.gif', video)