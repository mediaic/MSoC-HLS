clear all
close all


profile clear
profile on


% Read images
im1 = imread('..\image\IMG_7895.JPG');
im1 = imresize(im1,0.125);
im2 = imread('..\image\IMG_7894.JPG');
im2 = imresize(im2,0.125);


im1_grey = rgb2gray(im1);
im2_grey = rgb2gray(im2);


% FAST9
threshold = 20;
winSize = 7;
% [ corners1, scores1 ] = fast9(im1_grey, threshold, 1, winSize);
% [ corners2, scores2 ] = fast9(im2_grey, threshold, 1, winSize);
[ corners1, descriptors1] = extract_ORB(im1_grey); 
[ corners2, descriptors2] = extract_ORB(im2_grey); 


figure
imshow(im1); hold on;
plot(corners1(:,2), corners1(:,1),'g+');
title('im1 with NMS');

figure
imshow(im2); hold on;
plot(corners2(:,2), corners2(:,1),'g+');
title('im2 with NMS');


profile viewer
