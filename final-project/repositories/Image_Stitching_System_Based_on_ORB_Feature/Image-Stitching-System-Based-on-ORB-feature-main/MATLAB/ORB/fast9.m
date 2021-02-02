%FAST9. perform an  FAST corner detection 
%    [corners, scores] = FAST9.(image, threshold) 
%    X coordinates in corners(:,1), the Y coordinares in corners(:,2) and 
%    corners: consecutive n points greater or smaller than p (n = 12) 
%    scores: The score is computed using binary search over all possible thresholds.
%
%    [corners, scores] = FAST9.(image, threshold, nonmax) performs the corner
%    detection and nonmaximal suppression if nonmax is not zero. 


function [ corners, scores ] = fast9(image, threshold, do_nonmax, winSize, offset)
    
candidates = zeros(1024, 2);    % (:,1): x-cordinate, (:,2): y-cordinate
thres_score = zeros(1024, 1);   % score of every candidate
numCandidate = 0;

num_row = size(image,1);
num_col = size(image,2);
n = 12;

%% Corner detection
% iterate every pixel
for i = offset:(num_row-offset)
    for j = offset:(num_col-offset)
        % fast detection for n = 12
        TH = image(i,j) + threshold;
        TL = image(i,j) - threshold;
        corner_4 = [image(i-3,j), image(i,j+3), image(i+3,j), image(i,j-3)];    % [P_1, P_5, P_9, P_13]
        higher_4 = zeros(1,4);
        smaller_4 = zeros(1,4);
        higher_4(corner_4 >= TH) = 1;
        smaller_4(corner_4 <= TL) = 1;
        
        if ((sum(higher_4) >= 3) || (sum(smaller_4) >= 3))  % corner candidate
            numCandidate = numCandidate + 1;
            candidates(numCandidate, :) = [i, j];
            % Scoring:
            P = zeros(16, 1);
            P(1) = image(i-3,j);
            P(2) = image(i-3,j+1);
            P(3) = image(i-2,j+2);
            P(4) = image(i-1,j+3);
            P(5) = image(i,j+3);
            P(6) = image(i+1,j+3);
            P(7) = image(i+2,j+2);
            P(8) = image(i+3,j+1);
            P(9) = image(i+3,j);
            P(10) = image(i+3,j-1);
            P(11) = image(i+2,j-2);
            P(12) = image(i+1,j-3);
            P(13) = image(i,j-3);
            P(14) = image(i-1,j-3);
            P(15) = image(i-2,j-2);
            P(16) = image(i-3,j-1);
            % iterate through all points, find threshold
            for k = 1:16
                T = P(k);
                higher_16 = zeros(1,16);
                higher_16(P >= T) = 1;
                if ((sum(higher_16) == n) || (sum(higher_16) == (16-n)))    % threshold = score
                    thres_score(numCandidate, :) = T;
                end
            end
            % expand array size
            if ((int8(log2(numCandidate)) == log2(numCandidate)) && (numCandidate >= 1024))   
                candidates = [candidates; zeros(size(candidates))];
                thres_score = [thres_score; zeros(size(thres_score))];
            end
        end

    end
end

corners = candidates(1:numCandidate, :);
scores = thres_score(1:numCandidate, :);

%% non-maximum suppression
if (do_nonmax)
    [corners, scores] = NMS(size(image), winSize, corners, scores);
end

return;


