
# coding: utf-8

# In[85]:


import hashlib
import numpy as np
import sys
import string
import random
from time import time


from __future__ import print_function
sys.path.append('/home/xilinx')
from pynq import Overlay
from pynq import allocate

if __name__ == "__main__":
    print("Entry:", sys.argv[0])
    print("System argument(s):", len(sys.argv))
    print("Start of \"" + sys.argv[0] + "\"\n")

    
    ol = Overlay("/home/xilinx/IPBitFile/final3.bit")
    SHAIP = ol.sha256_0
    AESIP = ol.aescbc_0
    EccDecIP = ol.ecc_dec_0
    EccEncIP = ol.ecc_enc_0
    EccGenKeyIP = ol.ecc_gen_key_0
    PRNGIP = ol.PRNG_0
    SerialNumIP = ol.SerialNum_0
    
    
    def id_generator(size=256, chars=string.ascii_uppercase + string.digits):
        return ''.join(random.choice(chars) for i in range(size))
    
    def encode_4c(s):
        temp_bstr = '0b' + ''.join([(bin(ord(c)).replace('0b', '')).zfill(8) for c in s])
        return int(temp_bstr, 2)
    def insert_sting_middle(str, word, i):
        return str[:i] + word + str[i:]
    #set the ECC y^2 = x^3 + ax + b   
    timeKernelStart = time()
    a = 1
    b = 6
    p = 11
    Gx = 2 # x coordinate of Base point 
    Gy = 7 # y coordinate of Base point
    privateKey = 7
    EccGenKeyIP.write(0x10,a)
    EccGenKeyIP.write(0x18,b)
    EccGenKeyIP.write(0x20,p)
    EccGenKeyIP.write(0x28,Gx)
    EccGenKeyIP.write(0x30,Gy)
    EccGenKeyIP.write(0x38,privateKey)


    # start
    EccGenKeyIP.write(0x00,0x01)
    Px = EccGenKeyIP.read(0x40)
    Py = EccGenKeyIP.read(0x48)
    
    hostRN = random.randrange(0,99)
    RN = 0
    PRNGIP.write(0x10,hostRN)
    PRNGIP.write(0x00,0x01)
    RN = str(PRNGIP.read(0x18))
    #print(RN)
    
    
    #RN = id_generator()
    s = hashlib.sha256()
    
    #RN = "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUV"
    #RN = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    #RN = "AB23322211!!!"
    #RN = "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJ"
    RNLen = len(RN)
    
    digest = hashlib.sha256(str(RN).encode('utf-8')).hexdigest()
     

    
    if(RNLen%4!=0):
        for i in range(4-RNLen%4):
            RN = insert_sting_middle(RN,"0",RNLen)
    
    #print(RN)
    RN = [ RN[i+3]+RN[i+2]+RN[i+1]+RN[i] for i in range(0, len(RN)-3, 4) ]
    #print(RN)
    RN = list(map(encode_4c, RN))
    #print(RN)
    msg_strm = allocate(shape=(len(RN),), dtype=np.int32)
    for i in range(len(RN)):
        msg_strm [i] = RN[i]

    for i in range(len(msg_strm)):
        SHAIP.write(0x100 + i*4, int(msg_strm[i]))


    SHAIP.write(0x200,0)
 
    SHAIP.write(0x208,RNLen)

    
    timeKernelStart = time()
    SHAIP.write(0x00, 0x01)
    while (SHAIP.read(0x00) & 0x4) == 0x0:
        continue
    timeKernelEnd = time()
    #print("Kernel execution time: " + str(timeKernelEnd - timeKernelStart) + " s\n")
    
    
    final=''
    digest_strm= ''   

    for i in range(8):
        temp = str("{:08x}".format(SHAIP.read(0x220 + i*4)))
        temp = ''.join([temp[j:j+2] for j in range(6, -1, -2)]) 
        digest_strm = digest_strm + temp

    
    
    #print ("HW Digest = ",digest_strm ,"\n")
    
    
    #print("SW Digest = ",digest,"\n")
    digest_strm = int(digest_strm,16)%11
    #print(digest_strm)
    
    
    EccGenKeyIP.write(0x10,a)
    EccGenKeyIP.write(0x18,b)
    EccGenKeyIP.write(0x20,p)
    EccGenKeyIP.write(0x28,Gx)
    EccGenKeyIP.write(0x30,Gy)
    EccGenKeyIP.write(0x38,privateKey)


    # start
    EccGenKeyIP.write(0x00,0x01)
    Px = EccGenKeyIP.read(0x40) #public key
    Py = EccGenKeyIP.read(0x48)
    
    #print("Px = ",Px)
    #print("Py = ",Py)
    #y^2 = x^3 + ax + b
    PMx_d = digest_strm
    PMy_d = int((PMx_d**3+a*PMx_d + b)**0.5)%11
    #PMx_d = 2
    #PMy_d = 4
    #print(PMx_d)
    #print(PMy_d)
    EccEncIP.write(0x10,a)
    EccEncIP.write(0x18,b)
    EccEncIP.write(0x20,p)
    EccEncIP.write(0x28,Gx)
    EccEncIP.write(0x30,Gy)
    EccEncIP.write(0x38,Px)
    EccEncIP.write(0x40,Py)
    EccEncIP.write(0x48,hostRN)
    EccEncIP.write(0x50,PMx_d)
    EccEncIP.write(0x58,PMy_d)
    #start
    EccEncIP.write(0x00,0x01)
    
    C1x = EccEncIP.read(0x60)
    C1y = EccEncIP.read(0x68)
    C2x = EccEncIP.read(0x70)
    C2y = EccEncIP.read(0x78)
    
    
###########################################

    EccDecIP.write(0x10,a)
    EccDecIP.write(0x18,b)
    EccDecIP.write(0x20,p)
    EccDecIP.write(0x28,C1x)
    EccDecIP.write(0x30,C1y)
    EccDecIP.write(0x38,C2x)
    EccDecIP.write(0x40,C2y)
    EccDecIP.write(0x48,privateKey)
    
    # start
    EccDecIP.write(0x00,0x01)
    
    # golden data

    
    PMx = EccDecIP.read(0x50)
    PMy = EccDecIP.read(0x58)
    
    #print("PMx = ",PMx)
    #print("PMy = ",PMy)
    #print("PMx_d = ",PMx_d)
    #print("PMy_y = ",PMy_d)
#     if PMx != PMx_d or PMy != PMy_d:
#         print("Test failed !\n\n")
#     else:
#         print("Test successful!\n\n")
    
    PUFKey = "Spice Monkey"
    test = 1
    SN = 0
    SerialNumIP.write(0x10,test)
    SerialNumIP.write(0x00,0x01)
    SN = SerialNumIP.read(0x18)
    #print(SN)
    
    SN_PUF = str(SN)+" and "+PUFKey
    #print("SN_PUF = ",SN_PUF)
    
    
    
    
    
    s = hashlib.sha256()
    
    #data = "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUV"
    #data = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    #data = "AB23322211!!!"
    #data = "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJ"
    SN_PUFLen = len(SN_PUF)
    
    deKey = hashlib.sha256(str(SN_PUF).encode('utf-8')).hexdigest()
     
    
    
    Challenge = random.randrange(0,10000)

    Ch_deKey = str(Challenge) + str(deKey)
    
    Ch_deKeyLen = len(Ch_deKey)
    
    s = hashlib.sha256()
    digest = hashlib.sha256(str(Ch_deKey).encode('utf-8')).hexdigest()
    
    if(Ch_deKeyLen%4!=0):
        for i in range(4-Ch_deKeyLen%4):
            Ch_deKey = insert_sting_middle(Ch_deKey,"0",Ch_deKeyLen)
    
    #print(data)
    Ch_deKey = [ Ch_deKey[i+3]+Ch_deKey[i+2]+Ch_deKey[i+1]+Ch_deKey[i] for i in range(0, len(Ch_deKey)-3, 4) ]
    #print(Ch_deKey)
    Ch_deKey = list(map(encode_4c, Ch_deKey))
    #print(data)
    msg_strm = allocate(shape=(len(Ch_deKey),), dtype=np.int32)
    for i in range(len(Ch_deKey)):
        msg_strm [i] = Ch_deKey[i]

    for i in range(len(msg_strm)):
        SHAIP.write(0x100 + i*4, int(msg_strm[i]))


    SHAIP.write(0x200,0)
 
    SHAIP.write(0x208,Ch_deKeyLen)

    
    
    SHAIP.write(0x00, 0x01)
    while (SHAIP.read(0x00) & 0x4) == 0x0:
        continue
    timeKernelEnd = time()
    print("Kernel execution time: " + str(timeKernelEnd - timeKernelStart) + " s\n")
    
    
    final=''
    digest_strm= ''   

    for i in range(8):
        temp = str("{:08x}".format(SHAIP.read(0x220 + i*4)))
        temp = ''.join([temp[j:j+2] for j in range(6, -1, -2)]) 
        digest_strm = digest_strm + temp

    

    print ("HW Digest = ",digest_strm ,"\n")
    
    
    print("SW Digest = ",digest,"\n")
    
    
    
    
    if (digest_strm == digest):
        print("Test successful!\n\n")
    else:
        print("Test failed !\n\n")

