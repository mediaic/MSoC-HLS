im1= imread('face_256.jpg');
%將jpg 轉binary 為三個一組RGB，先跑k固定橫排在跑種的
%a=[uint8(234),uint8(235)];
%b = dec2bin(a,8);
for k = 1:256
    for j = 1:256
        for i = 1:3
            h(i+3*(j-1)+768*(k-1),:)=dec2bin(im1(k,j,i),8);
        end
    end
end
fid = fopen('face.txt','wt');
[m,n] =size(h);
for i=1:1:m
    for j =1:1:n
        if j==n
            fprintf(fid,'%s\n',h(i,j));
        else
            fprintf(fid,'%s',h(i,j));
        end
    end
end
fclose(fid);
