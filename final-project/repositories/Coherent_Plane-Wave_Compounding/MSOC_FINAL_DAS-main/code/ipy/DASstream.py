from __future__ import print_function

import sys
import numpy as np
from time import time
import matplotlib.pyplot as plt 

sys.path.append('/home/xilinx')
from pynq import Overlay
from pynq import allocate
from scipy import misc
import matplotlib.pyplot as plt


print("Entry:", sys.argv[0])
print("System argument(s):", len(sys.argv))

print("Start of \"" + sys.argv[0] + "\"")

ol = Overlay("/home/xilinx/IPBitFile/DAS/das.bit")
ipLK = ol.DAS_0
ipDMAIn0 = ol.axi_dma_in_0
ipDMAOut0 = ol.axi_dma_out_0

Nangle         = 25 
num_block      = 8 
Datalength     = 4096
ch_amount      = 32
down_sample    = 256-32
ch             = 16
total_ch       = 128 

#load echo
fiecho = open("/home/xilinx/IPBitFile/DAS/echo_int16.txt", "r+")

inBuffer = allocate(shape=(num_block*Nangle,Datalength*ch_amount), dtype=np.int32)
outBuffer = allocate(shape=(num_block, down_sample*ch), dtype=np.uint32)
gray_array= np.zeros((down_sample,total_ch))

for i in range(num_block):
    for j in range(Nangle):
        print("naggle: ", j, " block: ", i)
        for m in range(ch_amount):
            for n in range(Datalength):
                line = fiecho.readline()
                line = ''.join(line).strip('\n')
                inBuffer[i*Nangle+j][m*Datalength+n] = int(line)

j=0
last_timeKernel = 0
acc_timeKernel = 0
for i in range(num_block):
    while(j <Nangle):
        if (ipLK.read(0x00) == 6 or ipLK.read(0x00) == 4):
            ipLK.write(0x10, j)
            timeKernel = time()
            print('Nangle: ', j)
            ipLK.write(0x00, 0x01)
            timeTStart = time()
            ipDMAIn0.sendchannel.transfer(inBuffer[j+i*Nangle])
            #print('finished sendchannel.transfer')
            ipDMAIn0.sendchannel.wait()
            #print('finished sendchannel.wait')
            timeTEnd = time()
            print('Transfer time: ',timeTEnd-timeTStart, " s")
            j= j+1
            if (j > 1):
                print('Kernel time: ', timeKernel - last_timeKernel, " s")
                acc_timeKernel = acc_timeKernel + timeKernel - last_timeKernel
            last_timeKernel = timeKernel
            
    ipDMAOut0.recvchannel.transfer(outBuffer[i])
    #print('finished recvchannel.transfer')
    ipDMAOut0.recvchannel.wait()
    #print('finished recvchannel.wait')
    print('one block time: ', acc_timeKernel, " s")
    j=0

print('Total time: ', acc_timeKernel, " s")


for i in range(num_block):
    for j in range(ch):
        for m in range(down_sample):
            gray_array[m,i*ch+j] = outBuffer[i][j*down_sample+m]

plt.imshow(gray_array)