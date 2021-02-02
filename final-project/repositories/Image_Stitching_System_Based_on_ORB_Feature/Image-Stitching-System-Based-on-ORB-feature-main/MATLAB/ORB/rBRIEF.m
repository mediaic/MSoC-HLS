function features = rBRIEF(I,corners,patterns,angle,wpatch)

% initialise features
features = zeros(size(corners,1),256);

for i = 1:size(corners,1)
    pattern1 = round([cos(angle(i)),-sin(angle(i));sin(angle(i)),cos(angle(i))]*patterns(:,1:2)')';
    pattern2 = round([cos(angle(i)),-sin(angle(i));sin(angle(i)),cos(angle(i))]*patterns(:,3:4)')';
    for j = 1:256
%         p1 = I(corners(i,2) + pattern1(j,2),corners(i,1) + pattern1(j,1));
%         p2 = I(corners(i,2) + pattern2(j,2),corners(i,1) + pattern2(j,1));
        p1_u = corners(i,2)+pattern1(j,2)-wpatch; if (p1_u < 1) p1_u = 1;end
        p1_d = corners(i,2)+pattern1(j,2)+wpatch; if (p1_d > size(I,1)) p1_d = size(I,1);end
        p1_l = corners(i,1)+pattern1(j,1)-wpatch; if (p1_l < 1) p1_l = 1;end
        p1_r = corners(i,1)+pattern1(j,1)+wpatch; if (p1_r > size(I,2)) p1_r = size(I,2);end
        
        p2_u = corners(i,2)+pattern2(j,2)-wpatch; if (p2_u < 1) p2_u = 1;end
        p2_d = corners(i,2)+pattern2(j,2)+wpatch; if (p2_d > size(I,1)) p2_d = size(I,1);end
        p2_l = corners(i,1)+pattern2(j,1)-wpatch; if (p2_l < 1) p2_l = 1;end
        p2_r = corners(i,1)+pattern2(j,1)+wpatch; if (p2_r > size(I,2)) p2_r = size(I,2);end
        
        p1 = mean(I( p1_u:p1_d, p1_l:p1_r ) , 'all');
        p2 = mean(I( p2_u:p2_d, p2_l:p2_r ) , 'all');
        
%         p1 = mean(I( corners(i,2)+pattern1(j,2)-wpatch:corners(i,2)+pattern1(j,2)+wpatch, corners(i,1)+pattern1(j,1)-wpatch:corners(i,1)+pattern1(j,1)+wpatch ) , 'all');
%         p2 = mean(I( corners(i,2)+pattern2(j,2)-wpatch:corners(i,2)+pattern2(j,2)+wpatch, corners(i,1)+pattern2(j,1)-wpatch:corners(i,1)+pattern2(j,1)+wpatch ) , 'all');
        features(i,j) = double(p1 < p2);
    end
end