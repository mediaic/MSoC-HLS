import matplotlib.pyplot as plt
import numpy as np
import cv2
from time import time
from bitstring import Bits
import math
np.set_printoptions(threshold=1000)

def cylpro(img, f, height, width, offset):
    h,w,c = img.shape
    xc = h/2
    yc = w/2

    result = np.zeros(img.shape, np.uint8)
    border_y = 0
    for y in range(w):
        angle = math.atan((y-yc)/f)
        
        y1 = f*angle+yc-20
        
        if y1 < 0: y1=0
        if y1 > border_y:
            border_y = y1
        for x in range(h):
            tanx = (x-xc) / ((y-yc)**2 + f**2)**0.5
            x1 = f*tanx + xc
            if xc < 0: x1=0
            result[int(x1),int(y1),:] = img[x,y,:]
#     print(border_y, w)
    assert border_y > width
    return result[offset:offset+height,:width,:]

# def stitching(imgs, stitching_matrix):
#     num_imgs = len(imgs)
#     imgOffset = np.zeros((num_imgs, 2))
#     hasOffset = np.zeros(num_imgs,)
#     hasOffset[0] = 1
#     while(np.sum(hasOffset) != num_imgs):
        
#         for i in range(num_imgs):
#             if(hasOffset[i] == 0): continue
#             neighbors = stitching_matrix[i,:]
#             ind = 0
#             while(ind < len(neighbors)):
                
#                 neighborID = int(neighbors[ind])
#                 nx = neighbors[ind+1]
#                 ny = neighbors[ind+2]
#                 if neighborID == -1:
#                     break
#                 if(hasOffset[neighborID] == 1):
#                     ind += 3
#                     continue
#                 imgOffset[neighborID][0] = imgOffset[i][0] + nx
#                 imgOffset[neighborID][1] = imgOffset[i][1] + ny
#                 hasOffset[int(neighbors[ind])] = 1
#                 ind += 3
                
#     min_x, min_y = np.min(imgOffset, axis=0)
#     imgOffset[:,0] = imgOffset[:,0] - min_x
#     imgOffset[:,1] = imgOffset[:,1] - min_y
    
#     h,w,s = imgs[0].shape
#     M = np.max(imgOffset, axis=0)
#     RH = int(M[0] + h)
#     RW = int(M[1] + w)
    
#     img_res = np.zeros((RH,RW,s))
#     for i in range(num_imgs):
#         print("Processing Image {}...".format(i+1))
#         ori = imgs[i]
#         dx = int(imgOffset[i][0])
#         dy = int(imgOffset[i][1])
#         if dx<0: dx=0
#         if dy<0: dy=0
#         newPatch = np.zeros((RH,RW,s), dtype=np.float)
#         newPatch[dx:h+dx, dy:w+dy, :] = ori

#         back = np.where(np.all(img_res==[0,0,0], axis=-1))
#         backind = list(zip(back[0], back[1]))        
#         fore = np.where(np.all(img_res!=[0,0,0], axis=-1))
#         foreind = list(zip(fore[0], fore[1]))
#         new = np.where(np.all(newPatch!=[0,0,0], axis=-1))
#         newind = list(zip(new[0], new[1]))
        
#         addNew = set(backind).intersection(set(newind))
#         addNew = np.array(list(map(list, addNew)))
#         addPatch = set(foreind).intersection(set(newind))
#         addPatch = np.array(list(map(list, addPatch)))
        
#         oriWeight = np.zeros((RH,RW,s), dtype=np.float)
#         patchWeight = np.zeros((RH,RW,s), dtype=np.float)
#         if(len(addPatch) != 0 and len(addNew) != 0):
#             ps = np.min(addPatch[:,1])
#             pw = np.max(addPatch[:,1]) - ps
#             psn = np.min(addNew[:,1])
#             lw = 0
#             if(ps < psn):
#                 lw = 1-lw
#             oriWeight[:, ps:ps+pw,0] = np.tile(np.linspace(lw, 1-lw, pw), (RH, 1))
#             oriWeight[:, ps:ps+pw,1] = np.tile(np.linspace(lw, 1-lw, pw), (RH, 1))
#             oriWeight[:, ps:ps+pw,2] = np.tile(np.linspace(lw, 1-lw, pw), (RH, 1))
#             patchWeight = 1 - oriWeight
        
#         for ind in addNew:
#             img_res[ind[0],ind[1],:] = newPatch[ind[0],ind[1],:]
#         if(len(addPatch) != 0):
#             for ind in addPatch:
#                 x,y = ind
#                 img_res[x,y,:] = img_res[x,y,:]*oriWeight[x,y,:] + newPatch[x,y,:]*patchWeight[x,y,:]
#     return img_res.astype(np.uint8)

def stitching(imgs, stitching_matrix):
    num_imgs = len(imgs)
    imgOffset = np.zeros((num_imgs, 2))
    hasOffset = np.zeros(num_imgs,)
    hasOffset[0] = 1
    while(np.sum(hasOffset) != num_imgs):
        
        for i in range(num_imgs):
            if(hasOffset[i] == 0): continue
            neighbors = stitching_matrix[i,:]
            ind = 0
            while(ind < len(neighbors)):
                
                neighborID = int(neighbors[ind])
                nx = neighbors[ind+1]
                ny = neighbors[ind+2]
                if neighborID == -1:
                    break
                if(hasOffset[neighborID] == 1):
                    ind += 3
                    continue
                imgOffset[neighborID][0] = imgOffset[i][0] + nx
                imgOffset[neighborID][1] = imgOffset[i][1] + ny
                hasOffset[int(neighbors[ind])] = 1
                ind += 3
                
    min_x, min_y = np.min(imgOffset, axis=0)
    imgOffset[:,0] = imgOffset[:,0] - min_x
    imgOffset[:,1] = imgOffset[:,1] - min_y
    
    h,w,s = imgs[0].shape
    M = np.max(imgOffset, axis=0)
    RH = int(M[0] + h)
    RW = int(M[1] + w)
    
    img_res = np.zeros((RH,RW,s))
    for i in range(num_imgs):
        print("Processing Image {}...".format(i+1))
        ori = imgs[i]
        dx = int(imgOffset[i][0])
        dy = int(imgOffset[i][1])
        newPatch = np.zeros((RH,RW,s), dtype=np.float)
        newPatch[dx:h+dx, dy:w+dy, :] = ori

        back_mask = np.all(img_res==[0,0,0], axis=-1)
        fore_mask = np.all(img_res!=[0,0,0], axis=-1)
        new_mask = np.all(newPatch!=[0,0,0], axis=-1)
        
        addNew_mask = np.logical_and(new_mask, back_mask)
        addNew_x, addNew_y = np.where(addNew_mask == True)
        
        addPatch_mask = np.logical_and(new_mask, fore_mask)
        addPatch_x, addPatch_y = np.where(addPatch_mask == True)
        
        oriWeight = np.zeros((RH,RW,s), dtype=np.float)
        patchWeight = np.zeros((RH,RW,s), dtype=np.float)
        if(len(addPatch_x) != 0 and len(addNew_x) != 0):
            ps = np.min(addPatch_y)
            pw = np.max(addPatch_y) - ps
            psn = np.min(addNew_y)
            lw = 0
            if(ps < psn):
                lw = 1-lw
            oriWeight[:, ps:ps+pw,0] = np.tile(np.linspace(lw, 1-lw, pw), (RH, 1))
            oriWeight[:, ps:ps+pw,1] = np.tile(np.linspace(lw, 1-lw, pw), (RH, 1))
            oriWeight[:, ps:ps+pw,2] = np.tile(np.linspace(lw, 1-lw, pw), (RH, 1))
            patchWeight = 1 - oriWeight
        
        img_res[addNew_mask] = newPatch[addNew_mask]
        if(len(addPatch_x) != 0):
            img_res[addPatch_mask] = img_res[addPatch_mask]*oriWeight[addPatch_mask] + newPatch[addPatch_mask]*patchWeight[addPatch_mask]

    return img_res.astype(np.uint8)

def similarity(a, b):
    hamming_distance = 0
    for i in range(8):
        hamming_distance += (bin(a[i]^b[i])).count('1')
    return hamming_distance

def matching(des1, des2): 
    matchpoint = []
    for i in des1:
        close_1st = 10000
        close_2nd = 10000
        mp = []
        for j in des2:
            d = similarity(i, j)
            if(d < close_2nd):
                close_2nd = d
            if(d < close_1st):
                close_2nd = close_1st
                close_1st = d
                mp = j
        if(close_2nd == 0):
            matchpoint.append([i[8],i[9],mp[8],mp[9]])
        elif(float(close_1st)/float(close_2nd) < 0.5):
            matchpoint.append([i[8],i[9],mp[8],mp[9]])
    return matchpoint

def RANSAC(matching_matrix):
    num_imgs = len(matching_matrix)
    index = [0,3,6]
    stitching_matrix = np.zeros((num_imgs , 12))
    stitching_matrix[:, index] -= 1
    for i in range(num_imgs):
        matching_pic1_num = 0
        matching_pic2_num = 0
        matching_pic3_num = 0
        for j in range(num_imgs):
            if(i != j):
                if(len(matching_matrix[i][j]) > matching_pic3_num):
                    matching_pic3_num = len(matching_matrix[i][j])
                    stitching_matrix[i,6] = j
                if(matching_pic3_num > matching_pic2_num):
                    matching_pic3_num = matching_pic2_num
                    matching_pic2_num = len(matching_matrix[i][j])
                    stitching_matrix[i,6] = stitching_matrix[i,3]
                    stitching_matrix[i,3] = j
                if(matching_pic2_num > matching_pic1_num):
                    matching_pic2_num = matching_pic1_num
                    matching_pic1_num = len(matching_matrix[i][j])
                    stitching_matrix[i,3] = stitching_matrix[i,0]
                    stitching_matrix[i,0] = j
    
    for i in range(num_imgs):
        for j in index:
            n_img = int(stitching_matrix[i,j])
            if(n_img != -1):
                matchpoints = matching_matrix[i][n_img]
                fit_x = 0
                fit_y = 0
                max_agree = 0
                for k in matchpoints:
                    tx = float(k[0])-float(k[2])
                    ty = float(k[1])-float(k[3])
                    agree = 0
                    for m in matchpoints:
                        tx_inv = float(m[2])-float(m[0])
                        ty_inv = float(m[3])-float(m[1])
                        if((tx+tx_inv)**2 + (ty+ty_inv)**2 < 1):
                            agree += 1
                    if(agree > max_agree):
                        max_agree = agree
                        fit_x = tx
                        fit_y = ty
                        
                if(stitching_matrix[i,j] > i):
                    stitching_matrix[i,j+1] = fit_y
                    stitching_matrix[i,j+2] = fit_x
                else:
                    stitching_matrix[i,j+1] = -fit_y
                    stitching_matrix[i,j+2] = -fit_x
                if(j==0):
                    stitching_matrix[i,9] = max_agree
                elif(j==3):
                    stitching_matrix[i,10] = max_agree
                elif(j==6):
                    stitching_matrix[i,11] = max_agree
                    
        if(stitching_matrix[i,9] == 1 and stitching_matrix[i,11] > 1):
            stitching_matrix[i,[0,1,2,9]] = stitching_matrix[i,[6,7,8,11]]
        elif(stitching_matrix[i,10] == 1 and stitching_matrix[i,11] > 1):
            stitching_matrix[i,[3,4,5,10]] = stitching_matrix[i,[6,7,8,11]]
        if(stitching_matrix[i,9] == 1):
            stitching_matrix[i,[0,1,2]] = [-1,0,0]
        if(stitching_matrix[i,10] == 1):
            stitching_matrix[i,[3,4,5]] = [-1,0,0]

    result_matrix = stitching_matrix[:,:6]
    print(result_matrix)
    return result_matrix

