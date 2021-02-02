clc;
clear all;
close all;

alpha = 0.4;

im = imread('cat_256.jpg');
im2 = imread('face_256.jpg');
inputLines = [250, 500; 300, 800; 800, 350; 850, 700; 350, 540; 650, 490; 480, 820; 600, 800] / 4;
% targetLines = [400, 400; 400, 800; 750, 400; 750, 800];
inputLines2 = [220, 350; 270, 650; 770, 200; 820, 550; 380, 420; 680, 380; 450, 720; 680, 700] / 4;

targetLines = inputLines*alpha + inputLines2*(1-alpha);
morphed_map = zeros(256,256,2);
morphed_map2 = zeros(256,256,2);
[morphed,morphed_map] = bnmorph( im, inputLines, targetLines );
[morphed2,morphed_map2] = bnmorph( im2, inputLines2, targetLines );

morph_result = morphed*alpha + morphed2*(1-alpha);

figure;
imshow(morph_result);
line(reshape(targetLines(:,1),2,[]), reshape(targetLines(:,2),2,[]), 'Color',[.0 1.0 .0]);

function [morphed, morphed_map] = bnmorph( im, inputLines, targetLines)
%BNMORPH Takes image and two sets of lines.
% Morphs image from inputLines to targetLines

[xSize,ySize,~] = size(im);
[numPoints,~] = size(targetLines);
numLineSegments = int32(numPoints/2);

% Make sure there are no horizontal or vertical lines
conditionlines(inputLines);
conditionlines(targetLines);

% Preallocate space
morphed = im;

outbound_num = 0;

tic


% For each pixel in the destination image, calculate the pixel to 
% sample from the source image.
for y = 1:ySize
    for x = 1:xSize
        X = [y x];
        Xsource = zeros(1,2);
        dsum = zeros(1,2);
        weightsum = 0;
            % For each line segment
            for i = 1:numLineSegments
                % Indices for the endpoints of the segments
                i1 = (i-1)*2+1;
                i2 = i1 + 1;

                % Get Pi, Qi, the end points for the line segment i
                % in the dst image
                Pi = targetLines(i1, :);
                Qi = targetLines(i2, :);

                % Get the vector QPi
                QPi = Qi - Pi;

                % Get Pi', Qi', the end points for the line segment i
                % in the src image
                Pisource = inputLines(i1,:);
                Qisource = inputLines(i2,:);

                % Get the vector QPi'
                QPisource = Qisource - Pisource;

                % Calculate u = (X-Pi).(QPi) / ||QPi||^2
                u = dot((X - Pi), QPi) / (QPi(1).^2 + QPi(2).^2);

                % Calculate v = (X-Pi).perp(QPi) / ||QPi||
                % where perp(QPi) = [-QPi(2), QPi(1)]
                v = dot((X - Pi), [-QPi(2), QPi(1)] ) / sqrt(QPi(1).^2 + QPi(2).^2);

                % Calculate Xi', the pixel to sample in src image
                % Xi' = Pi'+u*QPi' + v*perp(QPi') / ||QPi'||
                Xisource = Pisource + u*QPisource + ( v*[-QPisource(2), QPisource(1)] / sqrt(QPisource(1).^2 + QPisource(2).^2));
                

                % Add this pixel to the weight
                % Does nothing when only one line segment
                Di = Xisource - X;
                if u < 0
                    dist = sqrt((X(1)-Pi(1)).^2+(X(2)-Pi(2)).^2);
                elseif u > 1
                    dist = sqrt((X(1)-Qi(1)).^2+(X(2)-Qi(2)).^2);
                else
                    dist = abs(v);
                end
                length = sqrt(QPi(1).^2 + QPi(2).^2);
                p = 0.5; % Defines strength of lines relative to length. Range: [0,1]. If 0, all lines have same weight, if 1, longer lines carry more weight than shorter ones
                a = 0.1; % Defines strength of line based on distance from point. Lower values = more control, larger value = more smooth warping
                b = 1; % Defines strength fall-off based on distance from point. Good Range: [0.5,2]. If 0, pixel affected by all lines equally, if large, then only affected by nearest lines
                weight = (length.^p / (a + dist)).^b;
                dsum = dsum + (Di * weight);
                weightsum = weightsum + weight;
                
                
            end

            % Calculate final source pixel
            % Will equal Xisource when only one line segment       
            Xsource = X + dsum / weightsum;
            if (X == [6 6])
                    fprintf('X: %f,%f\n', Xsource);
                    fprintf('Dsum: %f,%f\n', dsum);
                    fprintf('Weight_sum %f\n', weightsum)
                    
             else 
             end

            % Bounds check to set out of bounds pixels to teal
            % Shouldn't be needed as far as I'm aware
            
            [xSize, ySize, ~] = size(im);
            nullCol = false;
            if int32(Xsource(2)) <= 0
                Xsource(2) = 1;
                nullCol = true;
            elseif int32(Xsource(2)) > xSize
                Xsource(2) = xSize;
                nullCol = true;
            end
            if int32(Xsource(1)) <= 0
                Xsource(1) = 1;
                nullCol = true;
            elseif int32(Xsource(1)) > ySize
                Xsource(1) = ySize;
                nullCol = true;
            end

            %if nullCol == true
            %    outbound_num = outbound_num + 1;
            %    morphed(X(2), X(1), :) = im(X(2), X(1), :); % [0, 255, 255];
            %else
                % Set pixel X in dst image
                morphed(X(2), X(1), :) = im(int32(Xsource(2)), int32(Xsource(1)), :);
                 %X_map = [Xsource(2) Xsource(1)];
                morphed_map(X(2), X(1),:) = int32([Xsource(1), Xsource(2)]);
                
                
            %end
     end
end

toc

% disp(['out of boundary pixel number: ', num2str(outbound_num)]);

figure;
subplot(1, 2, 1);
imshow(im);
line(reshape(inputLines(:,1),2,[]), reshape(inputLines(:,2),2,[]), 'Color',[.0 1.0 .0]);
subplot(1, 2, 2);
imshow(morphed);
line(reshape(targetLines(:,1),2,[]), reshape(targetLines(:,2),2,[]), 'Color',[.0 1.0 .0]);

end

function conditionlines(inputVar)
if size(inputVar, 2) > size(inputVar, 1)
    inputVar = inputVar.';
end
if (sum(abs(diff(inputVar(:,1)))) >0) || (sum(abs(diff(inputVar(:,2)))) > 0)
    %error('conditionlines - inputVar is horizontal or vertical line.');
end
end