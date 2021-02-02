function [points2, scores2] = NMS(imgSize, winSize, points, scores)
%%% using non-maximal suppression (NMS) method same as FAST algorithm
%%% input grayscale
%%% points(:,1): x-cordinate, points(:,2): y-cordinate (not reverse)
%%% corner: points
%%% metrix: scores

points2 = [];
scores2 = [];

% construct corner map: 1=corner
table = zeros(imgSize(1),imgSize(2));
score_table = zeros(imgSize(1),imgSize(2));
for k = 1:size(points,1)
    pt = [points(k,1),points(k,2)]; % image-coordinate
    table(pt(1),pt(2)) = 1;
    score_table(pt(1),pt(2)) = scores(k);
end


% slide the window through the image
for i = 1:(imgSize(1)-winSize+1)
    for j = 1:(imgSize(2)-winSize+1)
        w = table(i:i+winSize-1, j:j+winSize-1).*score_table(i:i+winSize-1, j:j+winSize-1);
        table(i:i+winSize-1, j:j+winSize-1) = 0;
        maximum = max(max(w));
        if (maximum > 0)
            [x,y] = find(w==maximum);
            for k = 1%:length(x) 
               table(x(k)+i-1,y(k)+j-1) = 1;
            end
        end
    end
end

% construct new location, metrix array
[cx,cy] = find(table == 1);
points2 = [cx,cy];
scores2 = zeros(size(points2,1),1);

for k = 1:size(points2,1)
    pt = [points2(k,1),points2(k,2)];
    scores2(k) = score_table(pt(1),pt(2));
end


