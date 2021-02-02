clc,clear;
fileName = 'beach-sunset.mp4';
obj = VideoReader(fileName);
numFrames = obj.NumFrames;
for k = 1 : 66
     frame = read(obj,k);
     imwrite(frame,strcat('framedata/',num2str(k),'.jpg'),'jpg');
end