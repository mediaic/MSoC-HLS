
# coding: utf-8

# In[ ]:


from __future__ import print_function

import sys
import numpy as np
from time import time
import matplotlib.pyplot as plt 
import math
sys.path.append('/home/xilinx')
from pynq import Overlay
from pynq import allocate
import random

if __name__ == "__main__":
    print("Entry:", sys.argv[0])
    print("System argument(s):", len(sys.argv))

    print("Start of \"" + sys.argv[0] + "\"")
    'S_AXI_LITE_0', 'S_AXI_PARAMS_0', 'S_AXI_SLV0_0'
    ol = Overlay("/home/xilinx/6eng_100M/design_1.bit")
    #print(dir(ol.design_1_0.S_AXI_SLV0_0))
    
    mytwist0 = ol.engine_0.S_AXI_SLV0_0
    myheston0= ol.engine_0.S_AXI_PARAMS_0
    DMA0=ol.axi_dma_0
    
    mytwist1 = ol.engine_1.S_AXI_SLV0_0
    myheston1= ol.engine_1.S_AXI_PARAMS_0
    DMA1=ol.axi_dma_1
    
    mytwist2 = ol.engine_2.S_AXI_SLV0_0
    myheston2= ol.engine_2.S_AXI_PARAMS_0
    DMA2=ol.axi_dma_2
    
    mytwist3 = ol.engine_3.S_AXI_SLV0_0
    myheston3= ol.engine_3.S_AXI_PARAMS_0
    DMA3=ol.axi_dma_3
    
    mytwist4 = ol.engine_4.S_AXI_SLV0_0
    myheston4= ol.engine_4.S_AXI_PARAMS_0
    DMA4=ol.axi_dma_4
    
    mytwist5 = ol.engine_5.S_AXI_SLV0_0
    myheston5= ol.engine_5.S_AXI_PARAMS_0
    DMA5=ol.axi_dma_5
    
    spot_price = 0x42c80000
    reversion_rate = 0x3f000000;
    long_term_avg_vola = 0x3d23d70a;
    vol_of_vol = 0x3f800000;
    riskless_rate = 0x00000000;
    vola_0 = 0x3d23d70a;
    correlation = 0x00000000;
    time_to_maturity = 0x3f800000;
    strike_price = 0x42c80000;
    #both knockout
    lower_barrier_value = 0x42b40000;
    upper_barrier_value = 0x42dc0000;
    #reference
    ref_price = 0.74870;
    ref_price_precision = 0x3727c5ac;
    BARRIER_HIT_CORRECTION=0x3f152546
    step_cnt = 256; #256;
    path_cnt = 10000; #10000;
    #log_spot_price=2
    log_spot_price = 0x40935cfb
    
    step_size = 0x3b800000;

    output0 = allocate(shape=(path_cnt,), dtype=np.float32)
    output1 = allocate(shape=(path_cnt,), dtype=np.float32)
    output2 = allocate(shape=(path_cnt,), dtype=np.float32)
    output3 = allocate(shape=(path_cnt,), dtype=np.float32)
    output4 = allocate(shape=(path_cnt,), dtype=np.float32)
    output5 = allocate(shape=(path_cnt,), dtype=np.float32)
    
    
    
    
    
    for i in range(624):
       mytwist0.write(0x1000+i*4,random.randint(-2**16+2,2**16-2))
       mytwist1.write(0x1000+i*4,random.randint(-2**16+2,2**16-2))
       mytwist2.write(0x1000+i*4,random.randint(-2**16+2,2**16-2))
       mytwist3.write(0x1000+i*4,random.randint(-2**16+2,2**16-2))
       mytwist4.write(0x1000+i*4,random.randint(-2**16+2,2**16-2))
       mytwist5.write(0x1000+i*4,random.randint(-2**16+2,2**16-2))
    
    myheston0.write(0x14,log_spot_price)
    myheston0.write(0x1c,0x3b000000)
    myheston0.write(0x24,long_term_avg_vola)
    myheston0.write(0x2c,0x3d800000)
    myheston0.write(0x34,0x00000000)
    myheston0.write(0x3c,vola_0)
    myheston0.write(0x44,0x00000000)
    myheston0.write(0x4c,0x42c80000)
    myheston0.write(0x54,step_cnt)
    myheston0.write(0x5c,0x3b000000)
    myheston0.write(0x64,0x3d800000)
    myheston0.write(0x6c,BARRIER_HIT_CORRECTION)
    myheston0.write(0x74,path_cnt)
    
    myheston1.write(0x14,log_spot_price)
    myheston1.write(0x1c,0x3b000000)
    myheston1.write(0x24,long_term_avg_vola)
    myheston1.write(0x2c,0x3d800000)
    myheston1.write(0x34,0x00000000)
    myheston1.write(0x3c,vola_0)
    myheston1.write(0x44,0x00000000)
    myheston1.write(0x4c,0x42c80000)
    myheston1.write(0x54,step_cnt)
    myheston1.write(0x5c,0x3b000000)
    myheston1.write(0x64,0x3d800000)
    myheston1.write(0x6c,BARRIER_HIT_CORRECTION)
    myheston1.write(0x74,path_cnt)
    
    myheston2.write(0x14,log_spot_price)
    myheston2.write(0x1c,0x3b000000)
    myheston2.write(0x24,long_term_avg_vola)
    myheston2.write(0x2c,0x3d800000)
    myheston2.write(0x34,0x00000000)
    myheston2.write(0x3c,vola_0)
    myheston2.write(0x44,0x00000000)
    myheston2.write(0x4c,0x42c80000)
    myheston2.write(0x54,step_cnt)
    myheston2.write(0x5c,0x3b000000)
    myheston2.write(0x64,0x3d800000)
    myheston2.write(0x6c,BARRIER_HIT_CORRECTION)
    myheston2.write(0x74,path_cnt)
    
    myheston3.write(0x14,log_spot_price)
    myheston3.write(0x1c,0x3b000000)
    myheston3.write(0x24,long_term_avg_vola)
    myheston3.write(0x2c,0x3d800000)
    myheston3.write(0x34,0x00000000)
    myheston3.write(0x3c,vola_0)
    myheston3.write(0x44,0x00000000)
    myheston3.write(0x4c,0x42c80000)
    myheston3.write(0x54,step_cnt)
    myheston3.write(0x5c,0x3b000000)
    myheston3.write(0x64,0x3d800000)
    myheston3.write(0x6c,BARRIER_HIT_CORRECTION)
    myheston3.write(0x74,path_cnt)
    
    myheston4.write(0x14,log_spot_price)
    myheston4.write(0x1c,0x3b000000)
    myheston4.write(0x24,long_term_avg_vola)
    myheston4.write(0x2c,0x3d800000)
    myheston4.write(0x34,0x00000000)
    myheston4.write(0x3c,vola_0)
    myheston4.write(0x44,0x00000000)
    myheston4.write(0x4c,0x42c80000)
    myheston4.write(0x54,step_cnt)
    myheston4.write(0x5c,0x3b000000)
    myheston4.write(0x64,0x3d800000)
    myheston4.write(0x6c,BARRIER_HIT_CORRECTION)
    myheston4.write(0x74,path_cnt)
    
    myheston5.write(0x14,log_spot_price)
    myheston5.write(0x1c,0x3b000000)
    myheston5.write(0x24,long_term_avg_vola)
    myheston5.write(0x2c,0x3d800000)
    myheston5.write(0x34,0x00000000)
    myheston5.write(0x3c,vola_0)
    myheston5.write(0x44,0x00000000)
    myheston5.write(0x4c,0x42c80000)
    myheston5.write(0x54,step_cnt)
    myheston5.write(0x5c,0x3b000000)
    myheston5.write(0x64,0x3d800000)
    myheston5.write(0x6c,BARRIER_HIT_CORRECTION)
    myheston5.write(0x74,path_cnt)
    
    print(123)
    
    #ipFIRN11.write(0x20, outBuffer0.device_address)
    mytwist0.write(0x0000, 0x01)
    mytwist1.write(0x0000, 0x01)
    mytwist2.write(0x0000, 0x01)
    mytwist3.write(0x0000, 0x01)
    mytwist4.write(0x0000, 0x01)
    mytwist5.write(0x0000, 0x01)
    
    timeKernelStart = time()
    myheston0.write(0x00, 0x01)
    myheston1.write(0x00, 0x01)
    myheston2.write(0x00, 0x01)
    myheston3.write(0x00, 0x01)
    myheston4.write(0x00, 0x01)
    myheston5.write(0x00, 0x01)
    
    DMA0.recvchannel.transfer(output0)
    DMA1.recvchannel.transfer(output1)
    DMA2.recvchannel.transfer(output2)
    DMA3.recvchannel.transfer(output3)
    DMA4.recvchannel.transfer(output4)
    DMA5.recvchannel.transfer(output5)

    DMA0.recvchannel.wait()
    DMA1.recvchannel.wait()
    DMA2.recvchannel.wait()
    DMA3.recvchannel.wait()
    DMA4.recvchannel.wait()
    DMA5.recvchannel.wait()
    timeKernelEnd = time()
    
    print("", Kernel execution time: " + str(timeKernelEnd - timeKernelStart) + " s")
    result=0
    for i in output0:
        a=max(0., math.exp(i) - 100)
        result+=a
    result /= path_cnt;
    result *= 1
    print(result)
    
    
    result=0
    for i in output1:
        #print(i)
        a=max(0., math.exp(i) - 100)
        result+=a
    result /= path_cnt;
    result *= 1
    print(result)
    
    result=0
    for i in output2:
        #print(i)
        a=max(0., math.exp(i) - 100)
        result+=a
    result /= path_cnt;
    result *= 1
    print(result)
    
    result=0
    for i in output3:
        #print(i)
        a=max(0., math.exp(i) - 100)
        result+=a
    result /= path_cnt;
    result *= 1
    print(result)
    
    result=0
    for i in output4:
        #print(i)
        a=max(0., math.exp(i) - 100)
        result+=a
    result /= path_cnt;
    result *= 1
    print(result)
    
    result=0
    for i in output5:
        #print(i)
        a=max(0., math.exp(i) - 100)
        result+=a
    result /= path_cnt;
    result *= 1
    print(result)
    
    print("============================")
    
    print("Exit process")

