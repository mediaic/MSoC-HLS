%Clear workspace
close all hidden

%Load image and convert to grayscale
image_filename = 'images/houses_big.jpg'; 
I = imread(image_filename);
I = imresize(I, [128 128]); %Sample down for faster deconvolution
I = double(I);
I = I ./ max(I(:));

%Display image information and noisy image
fprintf('Processing %s with size %d x %d \n', image_filename, size(I, 2), size(I ,1))

%Define sharp image
I_sharp = I;

%Define square sized blur kernel
blur_size = 15; %has to be an odd number !
K_blur = cell(0); %Blur for all channels

%Loaded kernel
inc_blur_exp = 1.7;
max_blur_size = round(blur_size * (inc_blur_exp)^(size(I,3) - 1));
max_blur_size = max_blur_size + (1 - mod(max_blur_size,2));
max_radius = floor(max_blur_size / 2);

for ch = 1:size(I,3)
    K_blur{ch} = imread('kernels/fading.png');
    %Curr blur size
    curr_blur_size = round(blur_size* (inc_blur_exp)^(ch - 1));
    curr_blur_size = curr_blur_size + (1 - mod(curr_blur_size,2));
    K_blur{ch} = imresize( K_blur{ch}, [curr_blur_size, curr_blur_size] , 'bicubic');
    K_blur{ch} = img_to_norm_grayscale(K_blur{ch});
    K_blur{ch} = K_blur{ch} ./ sum(K_blur{ch}(:)); %Finally normalize kernel to sum of 1
end

%Set first channel to sharp image
K_blur{1} = imread('kernels/fading.png');
curr_blur_size = blur_size + (1 - mod(blur_size,2));
curr_blur_radius = floor(curr_blur_size / 2);
K_blur{1} = imresize( K_blur{1}, [curr_blur_size, curr_blur_size] , 'bicubic');
K_blur{1}(:) = 0;
K_blur{1} = img_to_norm_grayscale( K_blur{1} );
K_blur{1}(curr_blur_radius + 1, curr_blur_radius + 1) = 1.0;
K_blur{1} = K_blur{1} ./ sum(K_blur{1}(:));
   
    
%Compute blurred images
I_blurred = zeros(size(I));
for ch = 1:size(I,3)
    I_blurred(:,:,ch) = imfilter(I_sharp(:,:,ch), K_blur{ch}, 'conv', 'symmetric');
    K_blur{ch} = K_blur{ch} ./ sum(K_blur{ch}(:)); %Normalize
end

%Extract current patches and blur kernels
channel_patch = cell(0);
for ch = 1:size(I,3)
    channel_patch(ch).Image = I_blurred(:,:,ch);
    channel_patch(ch).K = K_blur{ch};
end

%Proposed cross-channel method:
fprintf('\nComputing cross-channel deconvolution ... \n\n')

%format: #ch, l_residual, l_tv, l_chross_ch, #detail_layers
lambda_startup = [ [1, 300, 1.0, [  0.0, 0.0, 0.0], 1]
                  [2, 750, 0.5,  [  1.0, 0.0, 0.0], 0];...
                  [3, 750, 0.5,  [  1.0, 0.0, 0.0], 0]];

I_deconv_channels = pd_joint_deconv(channel_patch,lambda_startup, 200, 1e-4);

%Gather result
I_deconv = zeros(size(I));
for ch = 1:length(I_deconv_channels)
    I_deconv(:,:,ch) = I_deconv_channels(ch).Image;
end
I_deconv(I_deconv < 0 ) = 0;

%Write out results
imwrite( I_sharp, 'I_sharp.png'  );
imwrite( I_blurred, 'I_blurred.png'  );
imwrite( I_deconv, 'I_deconv_ours.png'  );