%Clear workspace
clear all
close all hidden


%Load image and convert to grayscale
image_filename = 'images/houses_big.jpg'; 
I = imread(image_filename);
I = imresize(I, [128 128]); %Sample down for faster deconvolution
I = double(I);
disp(max(I(:)));
I = I./max(I(:));
%I = I.^2+1;
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

%Prepare data
%Extract current patches and blur kernels
channel_patch = cell(0);
for ch = 1:size(I,3)
    channel_patch(ch).Image = I_blurred(:,:,ch);
    channel_patch(ch).K = K_blur{ch};
end

%Proposed cross-channel method:
fprintf('\nComputing fft coefficient ... \n\n')

otfk  = psf2otf(K_blur{2}, [128 128]); 
Nomin1 = conj(otfk).*fft2(I_blurred(:,:,2));
Denom1 = abs(otfk).^2  ; 

RE = real(Nomin1) ;
RE = RE';
img1D = RE(:);
fid = fopen('REAL2.txt', 'wt');
fprintf(fid, '%f\n', img1D);
fclose(fid);
    
IMAG = imag(Nomin1) ;
IMAG = IMAG' ;
img1D = IMAG(:);
fid = fopen('IMAGINARY2.txt', 'wt');
fprintf(fid, '%f\n', img1D);
fclose(fid);
    
Denom1 = Denom1';
img1D = Denom1(:);
fid = fopen('DENOM2.txt', 'wt');
fprintf(fid, '%f\n', img1D);
fclose(fid);


otfk  = psf2otf(K_blur{3}, [128 128]); 
Nomin1 = conj(otfk).*fft2(I_blurred(:,:,3));
Denom1 = abs(otfk).^2 + 1 ; 

RE = real(Nomin1) ;
RE = RE';
img1D = RE(:);
fid = fopen('REAL3.txt', 'wt');
fprintf(fid, '%f\n', img1D);
fclose(fid);
    
IMAG = imag(Nomin1) ;
IMAG = IMAG' ;
img1D = IMAG(:);
fid = fopen('IMAGINARY3.txt', 'wt');
fprintf(fid, '%f\n', img1D);
fclose(fid);

Denom1 = Denom1';
img1D = Denom1(:);
fid = fopen('DENOM3.txt', 'wt');
fprintf(fid, '%f\n', img1D);
fclose(fid);

imwrite(I_blurred(:,:,1),'R_blurred.bmp');
imwrite(I_blurred(:,:,2),'G_blurred.bmp');
imwrite(I_blurred(:,:,3),'B_blurred.bmp');



% utility function
theta=1.0;
tau=0.02;
lambda_residual=1e-4;
%imshow();
B=I_blurred(:,:,3);
ProxG = @(f,tau,l) solve_fft(Nomin1, Denom1, tau, l, f );
I_blur_B =I_blurred(:,:,3);
subplot(1,2,1),imshow(I_blur_B );
I_deblur_B=I_blur_B;
for i=1:20
    I_deblur_B_old=I_deblur_B;
    I_deblur_B = ProxG(I_deblur_B, tau, lambda_residual); % image
    I_deblur_B = I_deblur_B_old+theta*(I_deblur_B-I_deblur_B_old)
end
subplot(1,2,2),imshow(I_deblur_B);

function x = solve_fft(Nomin1, Denom1, tau, lambda, f )

    %Solves Ax = b with
    % A = (tau*lambda* K'* K + eye ) and b = tau * lambda * K' * B + f 
    %      Nomin1  -- F(K)'*F(y)
    %      Denom1  -- |F(K)|.^2

    x = (tau * 2 * lambda * Nomin1 + fft2(f))./ (tau * 2 * lambda * Denom1 + 1); 
    x = real(ifft2(x));
    
return;
end