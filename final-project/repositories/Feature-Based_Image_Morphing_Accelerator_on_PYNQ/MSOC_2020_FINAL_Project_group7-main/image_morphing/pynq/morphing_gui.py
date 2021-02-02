import cv2
import argparse
import numpy as np
from tqdm import trange
import imageio
import time
W = 256
H = 256
ref_ptr = []
src_ptr = []
dst_ptr = []
src_flag = False

#src: [77,132;109,144;184,116;149,143;115,176;151,177]
#dst: [77,112;120,107;196,89;154,101;119,154;161,146]

def clickndraw(event, x, y, flags, param):
    global ref_ptr, src_flag, src_ptr, dst_ptr
    if event == cv2.EVENT_LBUTTONDOWN:
        ref_ptr.append((x, y))
        src_flag = not src_flag
        if src_flag:
            src_ptr.append((x, y))
        else:
            if x - W < 0:
                x = 0
            else:
                x = x - W
            dst_ptr.append((x, y))
    elif event == cv2.EVENT_LBUTTONUP:
        ref_ptr.append((x, y))
        if src_flag:
            src_ptr.append((x, y))
        else:
            if x - W < 0:
                x = 0
            else:
                x = x - W
            dst_ptr.append((x, y))

def hardware_beier_neely(src_out, dst_out, src_img, dst_img):
    src_coord = src_out.read().split('\n')
    dst_coord = dst_out.read().split('\n')
    morphed_img = np.zeros(src_img.shape)
    alpha = 1.0
    for i in range(len(src_coord)-1):
        src_point = eval(src_coord[i])
        dst_point = eval(dst_coord[i])
        #print(src_point)
        #print(dst_point)
        morphed_img[i % 256, i // 256, :] = alpha * src_img[src_point[1], src_point[0], :] + (1-alpha) * dst_img[dst_point[1], dst_point[0], :]
    return morphed_img

def beier_neely(input_line, target_line, img):
    h, w, c = img.shape
    point_num = input_line.shape[0]
    line_num = point_num // 2
    morphed_img = np.zeros(img.shape)
    for y in range(1, h+1):
        for x in range(1, w+1):
            X = np.array([y, x])
            X_source = np.zeros(2,)
            d_sum = np.zeros(2, )
            weighted_sum = 0.
            if line_num > 0:
                for i in range(1, line_num+1):
                    i_1 = (i-1) * 2 + 1
                    P_i =  np.array([target_line[i_1 - 1][0], target_line[i_1 - 1][1]])
                    Q_i =  np.array([target_line[i_1][0], target_line[i_1][1]])
                    QP_i = Q_i - P_i
                    P_i_src =  np.array([input_line[i_1 - 1][0], input_line[i_1 - 1][1]])
                    Q_i_src =  np.array([input_line[i_1][0], input_line[i_1][1]])
                    QP_i_src = Q_i_src - P_i_src
                    u = np.dot((X - P_i), QP_i) / (np.dot(QP_i, QP_i))
                    v = np.dot((X - P_i), np.array([-1 * QP_i[1], QP_i[0]])) / np.sqrt(np.dot(QP_i, QP_i))
                    X_i_src = P_i_src + u * QP_i_src + (v * np.array([-1 * QP_i_src[1], QP_i_src[0]]) / np.sqrt(np.dot(QP_i_src, QP_i_src)))
                    D_i = X_i_src - X
                    if u < 0:
                        dist = np.sqrt(np.dot(X - P_i, X - P_i))
                    elif u > 1:
                        dist = np.sqrt(np.dot(X - Q_i, X - Q_i))
                    else:
                        dist = np.abs(v)
                    length = np.sqrt(np.dot(QP_i, QP_i))
                    p = 0.5
                    a = 0.1
                    b = 1
                    weight = (length ** p) / ((a + dist) ** int(b))
                    d_sum = d_sum + (D_i * weight)
                    weighted_sum = weighted_sum + weight
                X_source = X + d_sum / weighted_sum
                nullCol = False

                if int(X_source[1]) <= 0:
                    X_source[1] = 1
                    nullCol = True
                elif int(X_source[1]) > w:
                    X_source[1] = w
                    nullCol = True
                if int(X_source[0]) <= 0:
                    X_source[0] = 1
                    nullCol = True
                elif int(X_source[0]) > h:
                    X_source[0] = h
                    nullCol = True
            else:
                X_source = X
            morphed_img[X[1]-1, X[0]-1, :] = img[int(X_source[1]-1), int(X_source[0]-1), :]
    return morphed_img


def start_beier_neely(src_ptr, dst_ptr, src_img, dst_img):
    video = []
    for t in trange(11):
        alpha = 0.1 * t
        src_line = np.array(src_ptr)
        dst_line = np.array(dst_ptr)
        target_line = alpha * src_line + (1 - alpha) * dst_line
        morphed_src = beier_neely(src_line, target_line, src_img)
        morphed_dst = beier_neely(dst_line, target_line, dst_img)
        morphed_img = alpha * morphed_src + (1-alpha) * morphed_dst
        video.append(np.flip(morphed_img, axis=2).astype('uint8'))
    return video




def main():
    global ref_ptr, src_ptr, dst_ptr
    parser = argparse.ArgumentParser(description='Image Morphing')
    parser.add_argument('--src_img', type=str, default='./cat.jpg')
    parser.add_argument('--dst_img', type=str, default='./face.jpg')
    # parser.add_argument('--port', type=str, default='COM1')
    args = parser.parse_args()
    # create image
    src_img = cv2.imread(args.src_img, flags=cv2.IMREAD_COLOR)
    dst_img = cv2.imread(args.dst_img, flags=cv2.IMREAD_COLOR)
    src_img = cv2.resize(src_img, (W, H))
    dst_img = cv2.resize(dst_img, (W, H))
    canvas = np.concatenate((src_img, dst_img), axis=1)
    clone = canvas.copy()
    cv2.namedWindow('Canvas')
    cv2.setMouseCallback('Canvas', clickndraw)
    while True:
        # Show canvas
        cv2.imshow('Canvas', canvas)
        # Draw feature lines
        if len(ref_ptr) == 1:
            cv2.circle(canvas, center=ref_ptr[0], radius=5, color=(255, 0, 0), thickness=-1)
        elif len(ref_ptr) == 2:
            cv2.line(canvas, ref_ptr[1], ref_ptr[0], color=(255, 0, 0), thickness=3)
            cv2.circle(canvas, center=ref_ptr[-1], radius=5, color=(255, 0, 0), thickness=-1)
            ref_ptr.clear()
        # Ensure key belongs to ascii code
        key = cv2.waitKey(1) & 0xFF
        if key == ord('r'):
            canvas = clone.copy()
            ref_ptr.clear()
            src_ptr.clear()
            dst_ptr.clear()
        elif key == ord('q'):
            break
        elif key == ord('s'):
            ''' report line '''
            src_text = '['
            dst_text = '['
            for i in src_ptr:
                src_text = src_text + str(i[0]) + ',' + str(i[1]) + ','
            for i in dst_ptr:
                dst_text = dst_text + str(i[0]) + ',' + str(i[1]) + ','
            src_text = src_text.rstrip(',')
            dst_text = dst_text.rstrip(',')
            src_text += ']'
            dst_text += ']'
            print('src_list =', src_text)
            print('dst_list =', dst_text)
        elif key == ord('b'):
            tic = time.time()
            morphed_gif = start_beier_neely(src_ptr, dst_ptr, src_img, dst_img)
            toc = time.time()
            #morphed_img = start_beier_neely(src_ptr, dst_ptr, src_img, dst_img)
            #print(morphed_img.astype('uint8'))
            #cv2.imshow('morphed result', morphed_img.astype('uint8'))
            print("Software runtime: {0}".format(toc-tic))
            imageio.mimsave('Morphing_2.gif', morphed_gif)


    cv2.destroyAllWindows()


def hardware_validation():
    parser = argparse.ArgumentParser(description='Image Morphing')
    parser.add_argument('--src_img', type=str, default='./cat.jpg')
    parser.add_argument('--dst_img', type=str, default='./face.jpg')
    # parser.add_argument('--port', type=str, default='COM1')
    args = parser.parse_args()
    # create image
    src_img = cv2.imread(args.src_img, flags=cv2.IMREAD_COLOR)
    dst_img = cv2.imread(args.dst_img, flags=cv2.IMREAD_COLOR)
    src_img = cv2.resize(src_img, (W, H))
    dst_img = cv2.resize(dst_img, (W, H))
    with open('morphing_out_src.txt', 'r') as src_out, open('morphing_out_dst.txt', 'r') as dst_out:
        morphed_img = hardware_beier_neely(src_out, dst_out, src_img, dst_img)
    cv2.imshow('morphed result', morphed_img.astype('uint8'))
    cv2.waitKey(0)

if __name__ == '__main__':
    #hardware_validation()
    main()








'''

# coding: utf-8

# In[ ]:


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
#import imageio
import time

sys.path.append('/home/xilinx')
W = 256
H = 256
MAX_LINE_NUM = 8
LINE_NUM = 3
ref_ptr = []
src_ptr = []
dst_ptr = []
src_flag = False
alpha = 0.4
src_list = [77,132,109,144,184,116,149,143,115,176,151,177]
dst_list = [77,112,120,107,196,89,154,101,119,154,161,146]
tar_list = [alpha * src_list[x] + (1-alpha) * dst_list[x] for x in range(len(src_list))]

def hardware_beier_neely():
    # Declare buffer
    line_src_point_buffer = allocate(shape=(MAX_LINE_NUM,), dtype=np.uint32)
    line_src_len_buffer = allocate(shape=(MAX_LINE_NUM,), dtype=np.float32)
    line_dst_point_buffer = allocate(shape=(MAX_LINE_NUM,), dtype=np.uint32)
    line_dst_len_buffer = allocate(shape=(MAX_LINE_NUM,), dtype=np.float32)
    line_tar_point_buffer = allocate(shape=(MAX_LINE_NUM,), dtype=np.uint32)
    line_tar_len_buffer = allocate(shape=(MAX_LINE_NUM,), dtype=np.float32)
    
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
            tar_point = np.uint8(tar_list[4*(i+1)-j-1])
            line_tar_point_buffer[i] = np.left_shift(line_tar_point_buffer[i], 8)
            line_tar_point_buffer[i] = np.bitwise_or(line_tar_point_buffer[i], tar_point)
    
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
        x_tar = tar_list[4 * i + 0] - tar_list[4 * i + 2]
        y_tar = tar_list[4 * i + 1] - tar_list[4 * i + 3]
        len_tar = np.float32((x_tar ** 2 + y_tar ** 2) ** 0.5)
        line_tar_len_buffer[i] = len_tar
    
    # Initiate IP
    ol = Overlay("./IPbitFile/morph_v1.bit")
    ip_morphing = ol.image_morph_0
    ip_dma_out = ol.axi_dma_0
    ip_morphing.write(0x10, line_src_point_buffer.device_address)
    ip_morphing.write(0x18, line_src_len_buffer.device_address)
    ip_morphing.write(0x20, line_tar_point_buffer.device_address)
    ip_morphing.write(0x28, line_tar_len_buffer.device_address)
    ip_morphing.write(0x30, line_dst_point_buffer.device_address)
    ip_morphing.write(0x38, line_dst_len_buffer.device_address)
    ip_morphing.write(0x40, np.uint32(LINE_NUM))
    ip_morphing.write(0x48, np.uint32(0))
    
    # Start IP
    tic = time.time()
    ip_morphing.write(0x00, 0x01)
    ip_dma_out.recvchannel.transfer(answer_buffer)
    ip_dma_out.recvchannel.wait()
    toc = time.time()
    print("Total execution time of hardware: {0}".format(toc-tic))
    
    # Check answer
    for i in trange(W * H):
        src_x = np.bitwise_and(answer_buffer[i], np.uint8(255))
        answer_buffer[i] = np.right_shift(answer_buffer[i], 8)
        src_y = np.bitwise_and(answer_buffer[i], np.uint8(255))
        answer_buffer[i] = np.right_shift(answer_buffer[i], 8)
        dst_x = np.bitwise_and(answer_buffer[i], np.uint8(255))
        answer_buffer[i] = np.right_shift(answer_buffer[i], 8)
        dst_y = np.bitwise_and(answer_buffer[i], np.uint8(255))
        morphed_img[i%256, i//256, :] = alpha * src_img[src_y, src_x, :] + (1-alpha) * dst_img[dst_y, dst_x, :]
    plt.imshow(cv2.cvtColor(morphed_img.astype('uint8'), cv2.COLOR_BGR2RGB))
    plt.show()

#     morphed_img = np.zeros(src_img.shape)
#     alpha = 1.0
#     for i in range(len(src_coord)-1):
#         src_point = eval(src_coord[i])
#         dst_point = eval(dst_coord[i])
#         #print(src_point)
#         #print(dst_point)
#         morphed_img[i % 256, i // 256, :] = alpha * src_img[src_point[1], src_point[0], :] + (1-alpha) * dst_img[dst_point[1], dst_point[0], :]
#     return morphed_img

def beier_neely(input_line, target_line, img):
    h, w, c = img.shape
    point_num = input_line.shape[0]
    line_num = point_num // 2
    morphed_img = np.zeros(img.shape)
    for y in range(1, h+1):
        for x in range(1, w+1):
            X = np.array([y, x])
            X_source = np.zeros(2,)
            d_sum = np.zeros(2, )
            weighted_sum = 0.
            if line_num > 0:
                for i in range(1, line_num+1):
                    i_1 = (i-1) * 2 + 1
                    P_i =  np.array([target_line[i_1 - 1][0], target_line[i_1 - 1][1]])
                    Q_i =  np.array([target_line[i_1][0], target_line[i_1][1]])
                    QP_i = Q_i - P_i
                    P_i_src =  np.array([input_line[i_1 - 1][0], input_line[i_1 - 1][1]])
                    Q_i_src =  np.array([input_line[i_1][0], input_line[i_1][1]])
                    QP_i_src = Q_i_src - P_i_src
                    u = np.dot((X - P_i), QP_i) / (np.dot(QP_i, QP_i))
                    v = np.dot((X - P_i), np.array([-1 * QP_i[1], QP_i[0]])) / np.sqrt(np.dot(QP_i, QP_i))
                    X_i_src = P_i_src + u * QP_i_src + (v * np.array([-1 * QP_i_src[1], QP_i_src[0]]) / np.sqrt(np.dot(QP_i_src, QP_i_src)))
                    D_i = X_i_src - X
                    if u < 0:
                        dist = np.sqrt(np.dot(X - P_i, X - P_i))
                    elif u > 1:
                        dist = np.sqrt(np.dot(X - Q_i, X - Q_i))
                    else:
                        dist = np.abs(v)
                    length = np.sqrt(np.dot(QP_i, QP_i))
                    p = 0.5
                    a = 0.1
                    b = 1
                    weight = (length ** p) / ((a + dist) ** int(b))
                    d_sum = d_sum + (D_i * weight)
                    weighted_sum = weighted_sum + weight
                X_source = X + d_sum / weighted_sum
                nullCol = False

                if int(X_source[1]) <= 0:
                    X_source[1] = 1
                    nullCol = True
                elif int(X_source[1]) > w:
                    X_source[1] = w
                    nullCol = True
                if int(X_source[0]) <= 0:
                    X_source[0] = 1
                    nullCol = True
                elif int(X_source[0]) > h:
                    X_source[0] = h
                    nullCol = True
            else:
                X_source = X
            morphed_img[X[1]-1, X[0]-1, :] = img[int(X_source[1]-1), int(X_source[0]-1), :]
    return morphed_img


def start_beier_neely(src_ptr, dst_ptr, src_img, dst_img):
    video = []
    for t in trange(11):
        alpha = 0.1 * t
        src_line = np.array(src_ptr)
        dst_line = np.array(dst_ptr)
        target_line = alpha * src_line + (1 - alpha) * dst_line
        morphed_src = beier_neely(src_line, target_line, src_img)
        morphed_dst = beier_neely(dst_line, target_line, dst_img)
        morphed_img = alpha * morphed_src + (1-alpha) * morphed_dst
        video.append(np.flip(morphed_img, axis=2).astype('uint8'))
    return video


def hardware_validation():
    # create image
#     src_img = cv2.imread('./cat.jpg', flags=cv2.IMREAD_COLOR)
#     dst_img = cv2.imread('./face.jpg', flags=cv2.IMREAD_COLOR)
#     src_img = cv2.resize(src_img, (W, H))
#     dst_img = cv2.resize(dst_img, (W, H))
#     plt.imshow(np.flip(dst_img, axis=2))
#     plt.show()
      
      hardware_beier_neely()
#     with open('morphing_out_src.txt', 'r') as src_out, open('morphing_out_dst.txt', 'r') as dst_out:
#         morphed_img = hardware_beier_neely(src_out, dst_out, src_img, dst_img)
#     cv2.imshow('morphed result', morphed_img.astype('uint8'))
#     cv2.waitKey(0)

if __name__ == '__main__':
    hardware_validation()
'''