img=imread("G_ground.bmp");
subplot(1,2,1),histogram(img)
img=imread("deblur_G.bmp");
subplot(1,2,2),histogram(img)