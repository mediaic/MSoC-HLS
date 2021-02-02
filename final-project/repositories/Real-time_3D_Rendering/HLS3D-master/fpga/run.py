# coding: utf-8

import struct

import cv2
import sys
import numpy as np
from time import time, sleep

sys.path.append('/home/xilinx')
import pynq
from pynq import Overlay
from pynq import allocate

WIDTH, HEIGHT = 640, 480


def hdmi_iic_init(ipIIC):
    ipIIC.send(0x39, bytes([0x41, 0x50]), 2)  # power down

    ipIIC.send(0x39, bytes([0x15, 0x01]), 2)  # 16,20,24b YCbCr 4:2:2 separate sync
    ipIIC.send(0x39, bytes([0x16, 0x35]), 2)  # 4:4:4, 8bit, style 2, YCbCr
    ipIIC.send(0x39, bytes([0x17, 0x00]), 2)  # 4:3

    ipIIC.send(0x39, bytes([0x40, 0x80]), 2)  # GC packet enable
    ipIIC.send(0x39, bytes([0x48, 0x08]), 2)  # bit right justified
    ipIIC.send(0x39, bytes([0x49, 0xa8]), 2)  # bit trimming: truncate

    # color space conversion
    ipIIC.send(0x39, bytes([0x18, 0xAC]), 2)
    ipIIC.send(0x39, bytes([0x19, 0x53]), 2)
    ipIIC.send(0x39, bytes([0x1A, 0x08]), 2)
    ipIIC.send(0x39, bytes([0x1B, 0x00]), 2)
    ipIIC.send(0x39, bytes([0x1C, 0x00]), 2)
    ipIIC.send(0x39, bytes([0x1D, 0x00]), 2)
    ipIIC.send(0x39, bytes([0x1E, 0x19]), 2)
    ipIIC.send(0x39, bytes([0x1F, 0xD6]), 2)
    ipIIC.send(0x39, bytes([0x20, 0x1C]), 2)
    ipIIC.send(0x39, bytes([0x21, 0x56]), 2)
    ipIIC.send(0x39, bytes([0x22, 0x08]), 2)
    ipIIC.send(0x39, bytes([0x23, 0x00]), 2)
    ipIIC.send(0x39, bytes([0x24, 0x1E]), 2)
    ipIIC.send(0x39, bytes([0x25, 0x88]), 2)
    ipIIC.send(0x39, bytes([0x26, 0x02]), 2)
    ipIIC.send(0x39, bytes([0x27, 0x91]), 2)
    ipIIC.send(0x39, bytes([0x28, 0x1F]), 2)
    ipIIC.send(0x39, bytes([0x29, 0xFF]), 2)
    ipIIC.send(0x39, bytes([0x2A, 0x08]), 2)
    ipIIC.send(0x39, bytes([0x2B, 0x00]), 2)
    ipIIC.send(0x39, bytes([0x2C, 0x0E]), 2)
    ipIIC.send(0x39, bytes([0x2D, 0x85]), 2)
    ipIIC.send(0x39, bytes([0x2E, 0x18]), 2)
    ipIIC.send(0x39, bytes([0x2F, 0xBE]), 2)

    ipIIC.send(0x39, bytes([0x98, 0x03]), 2)  # fixed
    ipIIC.send(0x39, bytes([0x9a, 0xe0]), 2)  # fixed
    ipIIC.send(0x39, bytes([0x9c, 0x30]), 2)  # fixed
    ipIIC.send(0x39, bytes([0x9d, 0x61]), 2)  # fixed

    ipIIC.send(0x39, bytes([0xa2, 0xa4]), 2)  # fixed
    ipIIC.send(0x39, bytes([0xa3, 0xa4]), 2)  # fixed

    ipIIC.send(0x39, bytes([0xaf, 0x06]), 2)  # HDMI mode

    # ipIIC.send(0x39, bytes([0xd7, 0x16]), 2)
    # ipIIC.send(0x39, bytes([0xd8, 0x02]), 2)
    # ipIIC.send(0x39, bytes([0xd9, 0xc0]), 2)
    # ipIIC.send(0x39, bytes([0xda, 0x10]), 2)
    # ipIIC.send(0x39, bytes([0xdb, 0x05]), 2)

    ipIIC.send(0x39, bytes([0xe0, 0xd0]), 2)  # fixed
    ipIIC.send(0x39, bytes([0xf9, 0x00]), 2)  # fixed
    ipIIC.send(0x39, bytes([0xd6, 0xc0]), 2)

    ipIIC.send(0x39, bytes([0x41, 0x10]), 2)  # power up


def hdmi_init(ipHDMI):
    H_ACTIVE_TIME = WIDTH
    H_BLANKING_TIME = 153
    H_SYNC_OFFSET = 24
    H_SYNC_WIDTH_PULSE = 24
    V_ACTIVE_TIME = HEIGHT
    V_BLANKING_TIME = 50
    V_SYNC_OFFSET = 5
    V_SYNC_WIDTH_PULSE = 8

    HCNT = H_ACTIVE_TIME + H_BLANKING_TIME
    HBP = H_BLANKING_TIME - H_SYNC_OFFSET - H_SYNC_WIDTH_PULSE
    HDMIN = H_SYNC_WIDTH_PULSE + HBP
    HDMAX = HDMIN + H_ACTIVE_TIME

    VCNT = V_ACTIVE_TIME + V_BLANKING_TIME
    VBP = V_BLANKING_TIME - V_SYNC_OFFSET - V_SYNC_WIDTH_PULSE
    VDMIN = V_SYNC_WIDTH_PULSE + VBP
    VDMAX = VDMIN + V_ACTIVE_TIME

    ipHDMI.write(0x0040, 0x0)
    ipHDMI.write(0x0048, 0x0)
    ipHDMI.write(0x0400, (H_ACTIVE_TIME<<16)+HCNT)
    ipHDMI.write(0x0404, H_SYNC_WIDTH_PULSE)
    ipHDMI.write(0x0408, (HDMAX<<16)+HDMIN)
    ipHDMI.write(0x0440, (V_ACTIVE_TIME<<16)+VCNT)
    ipHDMI.write(0x0444, V_SYNC_WIDTH_PULSE)
    ipHDMI.write(0x0448, (VDMAX<<16)+VDMIN)
    ipHDMI.write(0x004c, (255<<16)+(255<<8)+0)


def vtpg_init(ipVTPG):
    ipVTPG.write(0x0040, 0x0)
    ipVTPG.write(0x0010, HEIGHT)
    ipVTPG.write(0x0018, WIDTH)
    ipVTPG.write(0x0098, 0x1)
    ipVTPG.write(0x0020, 0x0)


def vrfb_init(ipVRFB):
    ipVRFB.write(0x0010, WIDTH)
    ipVRFB.write(0x0018, HEIGHT)
    ipVRFB.write(0x0020, 2560)
    ipVRFB.write(0x0028, 10)


def float_to_bytes(x):
    return struct.pack('f', x)


def render_wait_done(ip):
    while True:
        if (ip.read(0x0000) & 0x4) != 0x0:
            break


def render_reset_buffer(ip):
    ip.write(0x0010, 0)
    ip.write(0x0000, 1)
    render_wait_done(ip)


def render_prepare_camera(ip):
    ip.write(0x00A0, float_to_bytes(514.22))
    ip.write(0x00A4, float_to_bytes(514.22))
    ip.write(0x00A8, float_to_bytes(-1.0))
    ip.write(0x00B0, float_to_bytes(320.0))
    ip.write(0x00B4, float_to_bytes(240.0))
    ip.write(0x00B8, float_to_bytes(0.0))


def render_set_light(ip, light):
    light = np.array(light)
    ip.write(0x0090, float_to_bytes(light[0]))
    ip.write(0x0094, float_to_bytes(light[1]))
    ip.write(0x0098, float_to_bytes(light[2]))


def render_set_transform(ip, transform):
    transform = np.array(transform)
    ip.write(0x0040, float_to_bytes(transform[0, 0]))
    ip.write(0x0044, float_to_bytes(transform[0, 1]))
    ip.write(0x0048, float_to_bytes(transform[0, 2]))
    ip.write(0x004C, float_to_bytes(transform[0, 3]))
    ip.write(0x0050, float_to_bytes(transform[1, 0]))
    ip.write(0x0054, float_to_bytes(transform[1, 1]))
    ip.write(0x0058, float_to_bytes(transform[1, 2]))
    ip.write(0x005C, float_to_bytes(transform[1, 3]))
    ip.write(0x0060, float_to_bytes(transform[2, 0]))
    ip.write(0x0064, float_to_bytes(transform[2, 1]))
    ip.write(0x0068, float_to_bytes(transform[2, 2]))
    ip.write(0x006C, float_to_bytes(transform[2, 3]))


def render_set_num_faces(ip, num_faces):
    ip.write(0x0018, num_faces)


def render_set_obj_scale(ip, scale):
    ip.write(0x0080, float_to_bytes(scale))


def render_set_texture_id(ip, texture_id):
    ip.write(0x0088, texture_id)


def render_transform(ipRender, ipIDMA, ipODMA, input_buffer, input_buffer1):
    ipRender.write(0x0010, 4)
    ipRender.write(0x0000, 1)

    ipIDMA.sendchannel.transfer(input_buffer)
    ipODMA.recvchannel.transfer(input_buffer1)
    ipIDMA.sendchannel.wait()
    ipODMA.recvchannel.wait()

    render_wait_done(ipRender)


def render_load_texture(ipRender, ipIDMA, txtr_buffers, texture_ids):
    for i, tid in enumerate(texture_ids):
        if tid != 0:
            render_set_texture_id(ipRender, tid)
            ipRender.write(0x0010, 1)
            ipRender.write(0x0000, 1)
            ipIDMA.sendchannel.transfer(txtr_buffers[2])
            ipIDMA.sendchannel.wait()
            render_wait_done(ipRender)


def render_frame(ipRender, ipIDMA, ipODMA, mesh_buffers, transforms, texture_ids, output_buffer):
    mbuf_trans = []
    for i, mbuf in enumerate(mesh_buffers):
        num_faces = len(mbuf) // 24
        render_set_num_faces(ipRender, num_faces)
        mbuf_trans.append(allocate(shape=len(mbuf), dtype=np.float32))
        render_set_transform(ipRender, transforms[i])
        render_transform(ipRender, ipIDMA, ipODMA, mbuf, mbuf_trans[-1])

    for i in range(8):
        fh0 = 60 * i
        fh1 = 60 * (i + 1)
        ipRender.write(0x00C0, fh0)
        ipRender.write(0x00C4, fh1)
        render_reset_buffer(ipRender)

        for j, mbuf in enumerate(mbuf_trans):
            num_faces = len(mbuf) // 24
            render_set_num_faces(ipRender, num_faces)
            render_set_texture_id(ipRender, texture_ids[j])
            ipRender.write(0x0010, 2)
            ipRender.write(0x0000, 1)
            ipIDMA.sendchannel.transfer(mbuf)
            ipIDMA.sendchannel.wait()
            render_wait_done(ipRender)

        ipRender.write(0x0010, 3)
        ipRender.write(0x0000, 1)
        ipODMA.recvchannel.transfer(output_buffer[fh0*640:fh1*640])
        ipODMA.recvchannel.wait()
        render_wait_done(ipRender)


if __name__ == "__main__":
    print("Start of \"" + sys.argv[0] + "\"")

    ol = Overlay("/home/xilinx/final/final.bit")
    ipIIC = ol.axi_iic_0
    ipVTPG = ol.v_tpg_0
    ipHDMI = ol.axi_hdmi_tx_0
    ipVRFB = ol.v_frmbuf_rd_0
    pynq.ps.Clocks.fclk0_mhz = 250
    pynq.ps.Clocks.fclk1_mhz = 38.5

    hdmi_iic_init(ipIIC)
    hdmi_init(ipHDMI)
    vtpg_init(ipVTPG)
    vrfb_init(ipVRFB)

    ipIDMA = ol.axi_dma_0
    ipODMA = ol.axi_dma_1

    ipRender = ol.render_0

    render_set_obj_scale(ipRender, 1.0)
    render_prepare_camera(ipRender)
    render_set_light(ipRender, [0.81, 0.55, 0.21])

    output_buffer = allocate(shape=(480*640,), dtype=np.uint32)

    meshes = [np.load('01_mesh.npy'),
              np.load('02_mesh.npy'),
              np.load('03_mesh.npy')]
    mesh_buffers = [allocate(shape=len(m), dtype=np.float32) for m in meshes]
    for i, mbuf in enumerate(mesh_buffers):
        mbuf[:] = meshes[i]

    obj_trns = [np.load('01_trns.npy'),
                np.load('02_trns.npy'),
                np.load('03_trns.npy')]
    obj_txtr = [None,
                None,
                np.load('03_txtr.npy')]
    txtr_buffers = []
    for txtr in obj_txtr:
        if txtr is not None:
            txtr_buffers.append(allocate(shape=len(txtr), dtype=np.uint32))
            txtr_buffers[-1][:] = txtr
            txtr_buffers[-1].flush()
        else:
            txtr_buffers.append(None)

    transforms = [0, 0, 0]
    texture_ids = [0, 0, 1]

    render_reset_buffer(ipRender)
    render_load_texture(ipRender, ipIDMA, txtr_buffers, texture_ids)

    ipVTPG.write(0x0000, 0x81)
    ipVRFB.write(0x0000, 0x81)
    ipVRFB.write(0x0030, output_buffer.device_address)
    ipHDMI.write(0x0048, 0x1)
    ipHDMI.write(0x0040, 0x1)

    world_to_camera = np.array(
        [[1., 0.,    0.,     0.  ],
         [0., 0.82, -0.57, -14.73],
         [0., 0.57,  0.82, -83.56],
         [0., 0.,    0.,     1.  ]])

    for n in range(2):
        for i in range(100):
            t0 = time()
            # output_buffer = allocate(shape=(480*640,), dtype=np.uint32)

            c = np.cos(i*4/100*np.pi)
            s = np.sin(i*4/100*np.pi)
            R1 = np.array([
                [  c, 0.0,   s, 0.0],
                [0.0, 1.0, 0.0, 0.0],
                [ -s, 0.0,   c, 0.0],
                [0.0, 0.0, 0.0, 1.0],
            ])

            c = np.cos(i*8/100*np.pi)
            s = np.sin(i*8/100*np.pi)
            R2 = np.array([
                [1.0, 0.0, 0.0, 0.0],
                [0.0,   c,  -s, 0.0],
                [0.0,   s,   c, 0.0],
                [0.0, 0.0, 0.0, 1.0],
            ])

            if (0<=i<25) or (50<=i<75):
                obj_trns[0][1, 3] += 0.2
                obj_trns[2][1, 3] += 0.6
            else:
                obj_trns[0][1, 3] -= 0.2
                obj_trns[2][1, 3] -= 0.6

            if n % 2:
                render_set_light(ipRender, [np.cos(-10+i*0.2), 0, np.sin(10-i*0.2)])
            else:
                render_set_light(ipRender, [np.cos(10-i*0.2), 0, np.sin(-10+i*0.2)])

            transforms[0] = (world_to_camera @ obj_trns[0] @ R1)[:3, :]
            transforms[1] = (world_to_camera @ obj_trns[1])[:3, :]
            transforms[2] = (world_to_camera @ obj_trns[2] @ R1)[:3, :]

            render_frame(ipRender, ipIDMA, ipODMA, mesh_buffers, transforms, texture_ids, output_buffer)
            print('fps:', int(np.round(1/(time()-t0))))

    ipVTPG.write(0x0000, 0x00)
    ipVRFB.write(0x0000, 0x00)
