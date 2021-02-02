%%%%%%%%%%%% extract ORB keypoints and rBRIEF descriptors %%%%%%%%%%%%
function [keypoints, descriptors] = extract_ORB(im_grey) 
%----------  input  ----------%
%   image: grayscale image

%----------  output  ---------%
%   keypoints: (:,1)-x  (:,2)-y
%   descriptors: rBRIEF


%% FAST
threshold = 20;
winSize = 7;
do_nonmax = 1;
[ corners, scores ] = fast9(im_grey, threshold, do_nonmax, winSize);

%% Harris corner: strongest response
N = 100;
if (size(corners,1) > N)
    H = harris(im_grey);
    harris_score = H(sub2ind(size(H),corners(:,1),corners(:,2)));
    [~,idx] = sort(harris_score);
    keypoints = corners(idx(1:N),:);
end

%% orientation
angle = orientation(im_grey, keypoints);

%% rBRIEF
run('sampling_param.m')
descriptors = rBRIEF(im_grey, [keypoints(:,2), keypoints(:,1)], sample, angle);


figure
imshow(im_grey); hold on;
plot(keypoints(:,2), keypoints(:,1),'g+');
title('ORB');



return;