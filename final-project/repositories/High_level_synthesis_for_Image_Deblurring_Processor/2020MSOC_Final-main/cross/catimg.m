R=imread("R_blurred.bmp");
G=imread("G_blurred.bmp");
B=imread("B_blurred.bmp");
RGB=cat(3,R,G,B);
subplot(1,2,1),imshow(RGB)

