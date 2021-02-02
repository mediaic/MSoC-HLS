
# coding: utf-8

# In[13]:


#import ssl, socket
import hashlib
import numpy as np
import sys
from time import time


from __future__ import print_function
sys.path.append('/home/xilinx')
from pynq import Overlay
from pynq import allocate

if __name__ == "__main__":
    print("Entry:", sys.argv[0])
    print("System argument(s):", len(sys.argv))
    print("Start of \"" + sys.argv[0] + "\"\n")

    
    ol = Overlay("/home/xilinx/IPBitFile/final1.bit")
    SHAIP = ol.sha256_0
    AESIP = ol.aescbc_0
    EccDecIP = ol.ecc_dec_0
    EccEncIP = ol.ecc_enc_0
    def encode_4c(s):
        temp_bstr = '0b' + ''.join([(bin(ord(c)).replace('0b', '')).zfill(8) for c in s])
        #print(temp_bstr)
        return int(temp_bstr, 2)
    def insert_sting_middle(str, word, i):
        return str[:i] + word + str[i:]
    #test = "11111"
    #test = insert_sting_middle(test," ",len(test)-1)
    #print(test)
        
    
    s = hashlib.sha256()
    
    data = "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUV"
    #data = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    #data = "AB23322211!!!"
    #data = "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJ"
    DataLen = len(data)
    
    digest = hashlib.sha256(str(data).encode('utf-8')).hexdigest()
     
    print(digest)
    
    if(DataLen%4!=0):
        for i in range(4-DataLen%4):
            data = insert_sting_middle(data,"0",DataLen)
    
    #print(data)
    data = [ data[i+3]+data[i+2]+data[i+1]+data[i] for i in range(0, len(data)-3, 4) ]
    print(data)
    data = list(map(encode_4c, data))
    #print(data)
    msg_strm = allocate(shape=(len(data),), dtype=np.int32)
    for i in range(len(data)):
        msg_strm [i] = data[i]
    #print(msg_strm)
    
    #print(len(msg_strm))
    
    for i in range(len(msg_strm)):
        SHAIP.write(0x100 + i*4, int(msg_strm[i]))
#     for i in range(64):
#         print("After writing data = ","{0:08x}".format(SHAIP.read(0x100 + i*4)))
    #print("len of msg_strm = ",len(msg_strm))

    SHAIP.write(0x200,0)
    #print("bytes offset : ",SHAIP.read(0x200))
    SHAIP.write(0x208,DataLen)
    #print("bytes : ",SHAIP.read(0x208))
    
    
    timeKernelStart = time()
    SHAIP.write(0x00, 0x01)
    while (SHAIP.read(0x00) & 0x4) == 0x0:
        continue
    timeKernelEnd = time()
    print("Kernel execution time: " + str(timeKernelEnd - timeKernelStart) + " s\n")
    
    
    final=''
    digest_strm= ''   
    #print("\n")
    for i in range(8):
        temp = str("{:08x}".format(SHAIP.read(0x220 + i*4)))
        temp = ''.join([temp[j:j+2] for j in range(6, -1, -2)]) 
        digest_strm = digest_strm + temp

    
#     for i in range(0,len(digest_strm)-7,8):
#         final = final + digest_strm[i+6:i+8] + digest_strm[i+4:i+6] + digest_strm[i+2:i+4] + digest_strm[i:i+2] 
    print ("HW Digest = ",digest_strm ," length of Digest = ",len(digest_strm),"\n")
    
    
    print("SW Digest = ",digest,"\n")
    
    
    if (digest_strm == digest):
        print("Test successful!\n\n")
    else:
        print("Test failed !\n\n")


# In[14]:


data = "The Quick Brown Fox Jumped Over "
DataLen = len(data)
data = [ data[i+3]+data[i+2]+data[i+1]+data[i] for i in range(0, len(data)-3, 4) ]

data = list(map(encode_4c, data))
if(DataLen%4!=0):
    for i in range(4-DataLen%4):
        data = insert_sting_middle(data,"0",DataLen)
print("data = ", data)
print("\n")
print("len of data = ",len(data))
print("\n")
result = allocate(shape=(8,),dtype=np.int64)
  
key = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]
KeyLen = len(key)
key = [ key[i+3]*(2**24)+key[i+2]*(2**16)+key[i+1]*(2**8)+key[i] for i in range(0, len(key)-3, 4) ]
print("key = ",key)
print("\n")
IV = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
IV = [ IV[i+3]*(2**24)+IV[i+2]*(2**16)+IV[i+1]*(2**8)+IV[i] for i in range(0, len(IV)-3, 4) ]
print("IV = ",IV)
print("\n")

AESIP.write(0x10,4)
for i in range(len(key)):
    AESIP.write(0x20+i*4,key[i])
AESIP.write(0x00,0x01)


AESIP.write(0x10,3)
for i in range(len(IV)):
    AESIP.write(0x20+i*4,IV[i])
AESIP.write(0x00,0x01)


AESIP.write(0x10,0)
for i in range(len(data)):
    AESIP.write(0x20+i*4,data[i])
AESIP.write(0x00,0x01)


AESIP.write(0x10,1)
for i in range(len(data)):
    AESIP.write(0x20+i*4,data[i])    
AESIP.write(0x00,0x01)
for i in range(4):
    result[i] = AESIP.read(0x40+ i*4)


AESIP.write(0x10,1)
for i in range(4):
    #print("data[",i+4,"] = ",data[i+4])
    AESIP.write(0x20+i*4,data[i+4])
AESIP.write(0x00,0x01)

for i in range(4):
    #print(AESIP.read(0x40+ i*4))
    result[i+4]= AESIP.read(0x40+ i*4)
#print(result)

DataEnc =""
for i in range(len(result)):
    temp = str("{:08x}".format(result[i]))
    temp = ''.join([temp[j:j+2] for j in range(6, -1, -2)]) 
    DataEnc = DataEnc + temp
print("DataEnc = ", DataEnc)


# In[7]:


EccDecIP.write(0x10,1)
EccDecIP.write(0x18,6)
EccDecIP.write(0x20,11)
EccDecIP.write(0x28,8)
EccDecIP.write(0x30,3)
EccDecIP.write(0x38,10)
EccDecIP.write(0x40,2)
EccDecIP.write(0x48,7)

# start
EccDecIP.write(0x00,0x01)

# golden data
gldx = 10
gldy = 9

PMx = EccDecIP.read(0x50)
PMy = EccDecIP.read(0x58)

if ((gldx != PMx) or (gldy != PMy)):
    print("Test Failed")
else:
    print("Test Pass")


# In[9]:


EccEncIP.write(0x10,1)
EccEncIP.write(0x18,6)
EccEncIP.write(0x20,11)
EccEncIP.write(0x28,2)
EccEncIP.write(0x30,7)
EccEncIP.write(0x38,7)
EccEncIP.write(0x40,2)
EccEncIP.write(0x48,3)
EccEncIP.write(0x50,10)
EccEncIP.write(0x58,9)

# start
EccEncIP.write(0x00,0x01)

# golden data
gld1x = 8
gld1y = 3
gld2x = 10
gld2y = 2

C1x = EccEncIP.read(0x60)
C1y = EccEncIP.read(0x68)
C2x = EccEncIP.read(0x70)
C2y = EccEncIP.read(0x78)

if ((gld1x != C1x) or (gld1y != C1y) or (gld2x != C2x) or (gld2y != C2y)):
    print("Test Failed")
else:
    print("Test Pass")


