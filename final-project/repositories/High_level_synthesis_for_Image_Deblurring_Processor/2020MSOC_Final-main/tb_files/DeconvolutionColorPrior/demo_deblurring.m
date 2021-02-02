%Clear workspace
clear all
close all hidden

%Load image and convert to grayscale
image_filename = 'images/houses_big.jpg'; 
I = imread(image_filename);
I = imresize(I, [128 128]); %Sample down for faster deconvolution
I = double(I);
I = I ./ max(I(:));

%Apply inverse gamma
I = I .^ (2.0);

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
K_blur_disp = zeros(max_blur_size, max_blur_size, size(I,3));
for ch = 1:size(I,3)
    
    K_blur{ch} = imread('kernels/fading.png');
    
    %Curr blur size
    curr_blur_size = round(blur_size* (inc_blur_exp)^(ch - 1));
    curr_blur_size = curr_blur_size + (1 - mod(curr_blur_size,2));
    
    K_blur{ch} = imresize( K_blur{ch}, [curr_blur_size, curr_blur_size] , 'bicubic');
    K_blur{ch} = img_to_norm_grayscale(K_blur{ch});
    K_blur{ch} = K_blur{ch} ./ sum(K_blur{ch}(:)); %Finally normalize kernel to sum of 1
    
    %Store kernel for display
    curr_blur_radius = floor(curr_blur_size / 2);
    K_blur_disp( 1 + max_radius + (-curr_blur_radius:curr_blur_radius),1 + max_radius + (-curr_blur_radius:curr_blur_radius), ch) = ...
        (K_blur{ch} ./ max(K_blur{ch}(:)));
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
   
K_blur_disp( 1 + max_radius + (-curr_blur_radius:curr_blur_radius), ...
            1 + max_radius + (-curr_blur_radius:curr_blur_radius), 1) = ...
             (K_blur{1} ./ max(K_blur{1}(:)));
    
%Compute blurred images
I_blurred = zeros(size(I));
K_blur_orig = K_blur;
for ch = 1:size(I,3)
    I_blurred(:,:,ch) = imfilter(I_sharp(:,:,ch), K_blur{ch}, 'conv', 'symmetric');

    %Add noise to blurred image
    noise_sd = 0.005;
    I_blurred(:,:,ch) = imnoise(I_blurred(:,:,ch), 'gaussian', 0, noise_sd.^2);

    %And kernel image
    kernel_var = 0.0000001;
    K_blur{ch} = imnoise(K_blur{ch}, 'gaussian', 0, kernel_var / ch^2);
    K_blur{ch} = K_blur{ch} ./ sum(K_blur{ch}(:)); %Normalize
end

%Display input
overview_figure = figure();
I_sharp_disp = I_sharp.^ (1.0/2.0) ;
I_sharp_disp(1:size(K_blur_disp,1), 1:size(K_blur_disp,1),:) = K_blur_disp;
subplot(6,size(I,3)+1,1), imshow(I_sharp_disp ), title(sprintf('Original image (%d x %d)',size(I, 2), size(I ,1)));
for ch = 1:size(I,3)
    K_curr_disp = [K_blur{ch}, K_blur_orig{ch}];
    K_curr_disp = (K_curr_disp ./ max(K_curr_disp(:))) .^ (1.0/2.0);
    subplot(6,size(I,3)+1,1 + ch), imshow( K_curr_disp .^ (1/2.0) ), axis image, title(sprintf('Kernel Ch%d (%d x %d)', ch, size(K_curr_disp, 2)/2, size(K_curr_disp ,1)));
end
I_blurred_disp = I_blurred.^ (1.0/2.0);
subplot(6,size(I,3)+1, size(I,3) + 5 ), imshow( I_blurred_disp ), title(sprintf('Blurred image %d'));

%Display blurred channels
for ch = 1:size(I,3)
    subplot(6,size(I,3)+1, size(I,3) + 1 + ch), imshow(I_blurred_disp(:,:,ch) ), title(sprintf('Blurred Ch%d',ch));
end

%Prepare data
%Extract current patches and blur kernels
channel_patch = cell(0);
for ch = 1:size(I,3)
    channel_patch(ch).Image = I_blurred(:,:,ch);
    channel_patch(ch).K = K_blur{ch};
end

%Proposed cross-channel method:
fprintf('\nComputing cross-channel deconvolution ... \n\n')

%Lambda
%format: #ch, l_residual, l_tv, l_black, l_chross_ch, #detail_layers
lambda_startup = [ [1, 300, 1.0, 0.0, [  0.0, 0.0, 0.0], 1]
                  [2, 750, 0.5, 0.0, [  1.0, 0.0, 0.0], 0];...
                  [3, 750, 0.5, 0.0, [  1.0, 0.0, 0.0], 0]];

tic;
verbose = 'brief';
I_deconv_channels = channel_patch;
I_deconv_channels = pd_joint_deconv(channel_patch, [], ...
                                lambda_startup, ...
                                200, 1e-4, verbose);

%Gather result
I_deconv = zeros(size(I));
for ch = 1:length(I_deconv_channels)
    I_deconv(:,:,ch) = I_deconv_channels(ch).Image;
end

%Compute PSNR:
psnr_pad = round(size(K_blur,1) * 1.5);
I_diff = I_sharp(psnr_pad + 1:end - psnr_pad, psnr_pad + 1:end - psnr_pad,:) - I_deconv(psnr_pad + 1:end - psnr_pad, psnr_pad + 1:end - psnr_pad,:);
I_diffbl = I_sharp(psnr_pad + 1:end - psnr_pad, psnr_pad + 1:end - psnr_pad,:) - I_blurred_disp(psnr_pad + 1:end - psnr_pad, psnr_pad + 1:end - psnr_pad,:);
MSE = 1/size(I_diff(:),1)*(norm(I_diff(:), 2)^2);
MSEbl = 1/size(I_diffbl(:),1)*(norm(I_diffbl(:), 2)^2);
if MSE > eps
    PSNR = 10*log10(1/MSE);
    PSNRbl = 10*log10(1/MSEbl);
else
    PSNR = Inf;
end

%Apply gamma
I_deconv(I_deconv < 0 ) = 0;
I_deconv = I_deconv .^ (1.0/2.0);

%Display result
figure(overview_figure);
for ch = 1:size(I,3)
    subplot(6,size(I,3) + 1, 2 *(size(I,3) + 1) + ch), imshow(I_deconv(:,:,ch)), axis image, title(sprintf('Proposed method Ch%d', ch));
end
subplot(6,size(I,3)+1,3 * size(I,3) + size(I,3)), imshow(I_deconv), title(sprintf('%s (PSNR %5.5g dB)', 'Proposed method', PSNR));

fid=fopen('result.txt','w');%¼g¤JÀÉ®×¸ô®|
fprintf(fid,"blurred image PSNR=");
fprintf(fid,'%.3f',PSNRbl);
fprintf(fid,"\n deconvolution result PSNR=");
fprintf(fid,'%.3f',PSNR);

%Write out results
imwrite( I_sharp.^ (1.0/2.0), 'I_sharp.png'  );
imwrite( K_blur_disp, 'PSF.png'  );
imwrite( I_blurred_disp, 'I_blurred.png'  );
imwrite( I_deconv, 'I_deconv_ours.png'  );