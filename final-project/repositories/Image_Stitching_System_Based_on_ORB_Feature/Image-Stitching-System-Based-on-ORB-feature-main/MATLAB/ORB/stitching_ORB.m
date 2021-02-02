%%%%%%%%%%%% extract ORB keypoints and rBRIEF descriptors %%%%%%%%%%%%
function feature = stitching_ORB(im_grey) 
%----------  input  ----------%
%   image: grayscale image

%----------  output  ---------%
%   keypoints: (:,1)-x  (:,2)-y
%   descriptors: rBRIEF


%% FAST
threshold = 40;
winSize = 4;
do_nonmax = 1;
offset = 20;
% im_blur= imgaussfilt(im_grey, 5);
[ corners, scores ] = fast9(im_grey, threshold, do_nonmax, winSize, offset);

%% Harris corner: strongest response
% max_pts = 1000;
% if size(corners,1) > max_pts
%     N = max_pts;
% else
%     N = size(corners,1);    % take all keypoints
% end
N = size(corners,1);

if (size(corners,1) > N)
    H = harris(im_grey);
    harris_score = H(sub2ind(size(H),corners(:,1),corners(:,2)));
    [~,idx] = sort(harris_score);
    corners = corners(idx(1:N),:);
end

%% orientation
% angle = orientation(im_grey, corners);
angle = zeros(size(corners,1),1);   % BRIEF (not rotated)

%% rBRIEF
wpatch = 15;
run('sampling_param.m')
% run('random_sampling.m')
descriptors = rBRIEF(im_grey, [corners(:,2), corners(:,1)], sample, angle, wpatch);


figure
imshow(im_grey); hold on;
plot(corners(:,2), corners(:,1),'g+');
title('ORB');

feature = [corners, descriptors];



return;