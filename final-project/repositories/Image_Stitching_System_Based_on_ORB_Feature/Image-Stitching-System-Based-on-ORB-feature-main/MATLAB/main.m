clear all
close all


profile clear
profile on

addpath('./ORB')
addpath('./Stiching')


% global
% Loading File
% dirName = ('./image/clock_900/');
dirName = ('./image/clock_test/');
% dirName = ('./image/Sample/');
% dirName = ('./image/pikachu/');
% dirName = ('./image/pikachu_test/');
% dirName = ('./image/BL/');

filelist = dir(dirName);
f = 900;
display=1;

for i = 3:size(filelist,1)
    filenames{i-2} = strcat(dirName,filelist(i).name);
end    

imgs=cell(size(filenames,1));
i=1;


for filename=filenames
     filename = filename{1};
     I=imread(filename);
     I=imresize(I, 0.5);    % resize
     imwrite(I, ['./file/clock_resize/',num2str(i),'.png']);
     I=cylpro(I,f,display);
     imwrite(I, ['./file/clock_cylpro/',num2str(i),'cyl.png']); 
     imgs{i}=I;
     i=i+1;
end


feature=cell(size(filenames,1));
i = 1;

 %% Feature description
 for I = imgs
        I=I{1};
        I_grey = rgb2gray(I);
        fprintf('Feature description...\n')
        feature{i} = stitching_ORB(I_grey);  % return ORB keypoints/descriptors
        f2 = feature{i};
%         save(['./file/feature/f',num2str(i),'.mat'], 'f2')
        i = i + 1;
 end
 
 %% Feature matching
 feature_match_matrix = cell(size(filenames,2),size(filenames,2));
 match = 0;
 for i = 1:size(filenames,2)
    for j = 1: size(filenames,2)
        if (j>i)
            fprintf('Feature matching...\n'); 
            match = match + 1;
            [matchpoint,match_num] = feature_match(feature{i},feature{j});
            feature_match_matrix{i,j} = matchpoint;
            feature_match_matrix{j,i} = matchpoint;
        end      
    end
 end

 % show matching point
 run('showMatchPt.m')

 
 %% RANSAC picture choosing
    fprintf('Stitching picture choosing...\n');
    stiching_matrix = zeros(size(filenames,2),16);
    for i = 1:size(filenames,2)
        matching_pic1_num = 0;
        matching_pic2_num = 0;
        matching_pic3_num = 0; 
        for j = 1: size(filenames,2)
           if (j ~= i)
              if (size(feature_match_matrix{i,j},1) > matching_pic3_num)
                 matching_pic3_num = size(feature_match_matrix{i,j},1);
                 stiching_matrix(i,7) = j;
              end
              if (matching_pic3_num > matching_pic2_num)
                 matching_pic3_num = matching_pic2_num;
                 matching_pic2_num = size(feature_match_matrix{i,j},1);
                 stiching_matrix(i,7) = stiching_matrix(i,4);
                 stiching_matrix(i,4) = j;
              end
              if (matching_pic2_num > matching_pic1_num)
                 matching_pic2_num = matching_pic1_num;
                 matching_pic1_num = size(feature_match_matrix{i,j},1);
                 stiching_matrix(i,4) = stiching_matrix(i,1);
                 stiching_matrix(i,1) = j;
              end
           end
        end
    end
    
tic
   %RANSAC
   fprintf('RANSAC...\n');
   stiching_matrix = RANSAC(feature_match_matrix,stiching_matrix);
 toc  
     %% Stitching and Blending
    fprintf('Stitching and Blending...\n'); 
    imgr=stitching(imgs,stiching_matrix);
    imgr=uint8(imgr);
    imwrite(imgr,'result.jpg','JPG');
    fprintf('Done!\n'); 
    
    
    
profile viewer

