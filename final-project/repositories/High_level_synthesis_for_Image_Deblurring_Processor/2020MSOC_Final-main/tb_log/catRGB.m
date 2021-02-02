clear all;
 R=imread("R_blurred.bmp");
 G=imread("G_blurred.bmp");
 B=imread("B_blurred.bmp");
% RGB=cat(3,R,G,B);
RGB=imread("I_blurred.png");
subplot(1,2,1),imshow(RGB)


R=imread("deblur_R.bmp"); %zeros(128,128);%
G=imread("deblur_G.bmp");
B=imread("deblur_B.bmp");
RGB=cat(3,R,G,B);
subplot(1,2,2),imshow(RGB);