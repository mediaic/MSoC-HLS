clear, clc
mkdir correct
mkdir golden
format long
% rng(1);
img_size = 33;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           fixed point             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
total_n_bits = 32;
frac_n_bits = 16;
f = bitshift(1, frac_n_bits);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% read file from const_image
% [fid, message] = fopen('recon_images/mr_0_01/barbara.tif.png', 'r');
% fprintf('fid = %d\n', fid);
% fprintf('message = %s\n', message);
% [img_in,count]=fscanf(fid,'%f %f',[img_size, img_size]);
% fclose(fid);
pad = 0;
img = ones(img_size*8, img_size*8)*pad;
img_final_out = zeros(img_size*8, img_size*8);
img_L3 = zeros(img_size*8, img_size*8);
[test, map] = imread('test_images/barbara.tif');

write_img(test, 'golden/barbara.txt')
% subplot(1,2,1);
% imshow(test, map);
img(1:256, 1:256) = test;
max_pix = max(test,[],'all');
min_pix = min(test,[],'all');
opt_h.format = 'h';
for row = 0:7
    for col = 0:7
        img_in = img(1+row*img_size:img_size+row*img_size, 1+col*img_size:img_size+col*img_size);

%         img_in = (img_in-double(min_pix))/double(max_pix-min_pix);
        img_in = (img_in*1.0/255);
        img_in = chop(img_in, opt_h);
%         img_in = half(img_in);
%         img_in = floor(img_in*f)*(1.0/f); %unaffected because img_in is only determined by 8 bit
% img_in = img(1:img_size, 1:img_size);
% read weights and bias from model_param_txt
% shift 1 to 4 and 2 to 3
weight_1_array = [64,1,11,11]; %11, 11, 1 ,64
weight_2_array = [32,64,1,1]; %1, 1, 64, 32
weight_3_array = [1,32,7,7]; %7, 7, 32, 1 
weight_4_array = [64,1,11,11];
weight_5_array = [32,64,1,1];
weight_6_array = [1,32,7,7];

weight_1 = zeros(weight_1_array);
weight_2 = zeros(weight_2_array);
weight_3 = zeros(weight_3_array);
weight_4 = zeros(weight_4_array);
weight_5 = zeros(weight_5_array);
weight_6 = zeros(weight_6_array);

bias_1_array = [64];
bias_2_array = [32];
bias_3_array = [1];
bias_4_array = [64];
bias_5_array = [32];
bias_6_array = [1];

% bias_1 = []; %64
% bias_2 = []; %32
% bias_3 = [];  % 1
% bias_4 = []; %64
% bias_5 = []; %32
% bias_6 = []; % 1


for i = 1:6
    % weight
    [fid_weight, message_weight] = fopen(['model_param_edit_txt/ReconNet_conv', num2str(i), '.txt'], 'r');
%     fprintf('fid_weight = %d\n', fid_weight);
%     fprintf('message = %s\n', message_weight);

%     weight_in = fopen(['model_param_edit_txt/ReconNet_conv', num2str(i), '.txt'],'r')
    switch i
        case 1
            weight_in = fscanf(fid_weight,'%f',prod(weight_1_array,'all'));
%             weight_in = floor(weight_in*f)*(1.0/f);
            weight_in = chop(weight_in, opt_h);
            weight_1 = reshape(weight_in, weight_1_array);
            weight_1 = permute(weight_1, [4 3 2 1]);
        case 2
            weight_in = fscanf(fid_weight,'%f',prod(weight_2_array,'all'));
%             weight_in = floor(weight_in*f)*(1.0/f);
            weight_in = chop(weight_in, opt_h);
            weight_2 = reshape(weight_in, weight_2_array);
            weight_2 = permute(weight_2, [4 3 2 1]);
        case 3
            weight_in = fscanf(fid_weight,'%f',prod(weight_3_array,'all'));
%             weight_in = floor(weight_in*f)*(1.0/f);
            weight_in = chop(weight_in, opt_h);
            weight_3 = reshape(weight_in, weight_3_array);
            weight_3 = permute(weight_3, [4 3 2 1]);
        case 4
            weight_in = fscanf(fid_weight,'%f',prod(weight_4_array,'all'));
%             weight_in = floor(weight_in*f)*(1.0/f);
            weight_in = chop(weight_in, opt_h);
            weight_4 = reshape(weight_in, weight_4_array);
            weight_4 = permute(weight_4, [4 3 2 1]);
        case 5
            weight_in = fscanf(fid_weight,'%f',prod(weight_5_array,'all'));
%             weight_in = floor(weight_in*f)*(1.0/f);
            weight_in = chop(weight_in, opt_h);
            weight_5 = reshape(weight_in, weight_5_array);
            weight_5 = permute(weight_5, [4 3 2 1]);
        case 6
            weight_in = fscanf(fid_weight,'%f',prod(weight_6_array,'all'));
%             weight_in = floor(weight_in*f)*(1.0/f);
            weight_in = chop(weight_in, opt_h);
            weight_6 = reshape(weight_in, weight_6_array);
            weight_6 = permute(weight_6, [4 3 2 1]);
    end
%     [weight,count]=fscanf(fid_weight,'%f %f %f %f',weight_array);
    fclose(fid_weight);
%     disp(weight_1(1,1,1,:))
    % bias
%     bias_in = textread(['model_param_edit_txt/ReconNet_bias', num2str(i), '.txt'], '%f')
    [fid_bias, message_bias] = fopen(['model_param_edit_txt/ReconNet_bias', num2str(i), '.txt'], 'r');
%     fprintf('fid_bias = %d\n', fid_bias);
%     fprintf('message = %s\n', message_bias);
    switch i
        case 1
            bias_in = fscanf(fid_bias,'%f',prod(bias_1_array,'all'));
%             bias_in = floor(bias_in*f)*(1.0/f);
            bias_in = chop(bias_in, opt_h);
            bias_1 = [bias_in];
        case 2
            bias_in = fscanf(fid_bias,'%f',prod(bias_2_array,'all'));
%             bias_in = floor(bias_in*f)*(1.0/f);
            bias_in = chop(bias_in, opt_h);
            bias_2 = [bias_in];
        case 3
            bias_in = fscanf(fid_bias,'%f',prod(bias_3_array,'all'));
%             bias_in = floor(bias_in*f)*(1.0/f);
            bias_in = chop(bias_in, opt_h);
            bias_3 = [bias_in];
        case 4
            bias_in = fscanf(fid_bias,'%f',prod(bias_4_array,'all'));
%             bias_in = floor(bias_in*f)*(1.0/f);
            bias_in = chop(bias_in, opt_h);
            bias_4 = [bias_in];
        case 5
            bias_in = fscanf(fid_bias,'%f',prod(bias_5_array,'all'));
%             bias_in = floor(bias_in*f)*(1.0/f);
            bias_in = chop(bias_in, opt_h);
            bias_5 = [bias_in];
        case 6
            bias_in = fscanf(fid_bias,'%f',prod(bias_6_array,'all'));
%             bias_in = floor(bias_in*f)*(1.0/f);
            bias_in = chop(bias_in, opt_h);
            bias_6 = [bias_in];
    end
%     [bias,count]=fscanf(fid_bias,'%f %f %f %f',bias_array);
    fclose(fid_bias);
end
% disp(double(img_in)/255)
% img_in = rand(img_size, img_size)-0.5;
% kernel_1 = rand(11,11,1,64)-0.5;
% kernel_2 = rand(1,1,64,32)-0.5;
% kernel_3 = rand(7,7,32,1)-0.5;
% kernel_4 = rand(11,11,1,64)-0.5;
% kernel_5 = rand(1,1,64,32)-0.5;
% kernel_6 = rand(7,7,32,1)-0.5;
% a = [11];
% disp(a(1))
L1 = conv2d(img_in, weight_1, bias_1);
% L1(1:5,1:5,1:2)
% pause
L1 = chop(L1, opt_h);
% L11 = L1(1,1,:);
L2 = conv2d(L1, weight_2, bias_2);
L2 = chop(L2, opt_h);
% L22 = permute(L2, [3 2 1]);
L3 = conv2d(L2, weight_3, bias_3);
L3 = chop(L3, opt_h);
% L33 = permute(L3, [3 2 1]);
L4 = conv2d(L3, weight_4, bias_4);
L4 = chop(L4, opt_h);
% L44 = permute(L4, [3 2 1]);
L5 = conv2d(L4, weight_5, bias_5);
L5 = chop(L5, opt_h);
img_out = conv2d(L5, weight_6, bias_6);
img_out = chop(img_out, opt_h);
% write output
% write_img(L3, 'golden/L3.txt')
% write_img(img_in, 'golden/img_in.txt')
% write_img(img_out*2550, 'correct/img_out.txt')
L3_out(1+row*img_size:img_size+row*img_size, 1+col*img_size:img_size+col*img_size) = L3;
img_final_out(1+row*img_size:img_size+row*img_size, 1+col*img_size:img_size+col*img_size) = img_out;
% disp(img_final_out)
if row == 7&& col==7 
    subplot(1,2,2);
    img_final_out_not_edge = img_final_out(1:256,1:256); 
    min_pix_out = min(img_final_out_not_edge,[],'all');
    max_pix_out = max(img_final_out_not_edge,[],'all');
%     img_pic = uint8(255*img_final_out);
    img_pic = uint8(255*(img_final_out-min_pix_out)/(max_pix_out-min_pix_out)); 
    img_pic = img_pic(1:256,1:256);%real output
    img_L3 = uint8(L3_out*255);
    img_L3 = img_L3(1:256,1:256);
%     subplot(1,2,2);
%     imshow(img_pic);
end
    end
end

% imwrite(uint8(L3*255), ['correct/img_L3.png']);
% imwrite(img_pic, ['correct/img_out.png']);
% imwrite(img_pic, ['correct/img_out_fixed_INT',num2str(total_n_bits-frac_n_bits),'_FRAC',num2str(frac_n_bits),'.png']);
imwrite(img_pic, ['correct/img_float16.tif']);
%compare with golden (floating point)
golden = imread('correct/img_out.png');
golden = golden(:,:,1);
subplot(1,3,1);
imshow(golden);
title('golden');


subplot(1,3,2);
imshow(img_pic);
title(['float16']);  

   
subplot(1,3,3);
real = imread('original_images/barbara.tif');
imshow('original_images/barbara.tif'); 
title('real');

%psnr
psnr_float = psnr1(real, golden);
psnr_float16 = psnr1(real, img_pic);

%%% transfer tif to txt is needed
% fid = fopen('barbara.txt','w+');
% [row_img, col_img] = size(test); 
% for i = 1:row_img
%     for j = 1:col_img
%         fprintf(fid,' %f',test(i,j));
%     end
% end
% fclose(fid);

% imshow(img_L3);
% title('L3');
Correct = sum((golden - img_pic) > 1 | (golden - img_pic) < -1, 'all') == 0;
% disp(Correct)
% disp(max(L1,[],'all'));
% disp(max(L2,[],'all'));
% disp(max(L3,[],'all'));
% disp(max(L4,[],'all'));
% disp(max(L5,[],'all'));
% disp(max(img_out,[],'all'));
% compare w/ csim
% golden = imread('barbara_recon.png');
% golden = golden(:,:,1);
% Correct = sum((golden - img_pic) > 1 | (golden - img_pic) < -1, 'all') == 0;
% disp(Correct)
% for i = 1:256
%     for j = 1:256
%         if (golden[i, j] ~= img_pic[i,j]
% disp(class(weight_1));
% fid = fopen('weights.h','w+');
% fprintf(fid, 'typedef float data_type;\n');
% write_array(fid, kernel_1, 'data_type kernel1_weight[11][11][1][64]')
% write_array(fid, kernel_2, 'data_type kernel2_weight[1][1][64][32]')
% write_array(fid, kernel_3, 'data_type kernel3_weight[7][7][32][1]')
% write_array(fid, kernel_4, 'data_type kernel4_weight[11][11][1][64]')
% write_array(fid, kernel_5, 'data_type kernel5_weight[1][1][64][32]')
% write_array(fid, kernel_6, 'data_type kernel6_weight[7][7][32][1]')
% fclose(fid);

% fid = fopen('weights.h','r');
% fprintf(fid, 'typedef float data_type;\n');
% disp(double(img_in)/100)

function write_array(fid, M, name)
    M = permute(M, [4 3 2 1]);
    fprintf(fid, '%s = {%s', name, num2str(M(1)));
    for ii = 2 : numel(M)-1
        fprintf(fid, ', %s', num2str(M(ii)));
    end
    if(numel(M) ~= 1)
        fprintf(fid, ', %s', num2str(M(numel(M))));
    end
    fprintf(fid, '};\n');
end

function write_img(M, name)
    fid = fopen(name,'w+');
    M = permute(M, [2 1]);
    for ii = 1 : numel(M)
        fprintf(fid, '%s\n', num2str(M(ii)));
    end
%     fprintf(fid, '};\n');
    fclose(fid);
end

function ary_out = conv2d(ary_in, kernel, bias)
    [img_size,~,~] = size(ary_in);
    [~,kernel_size,in_channel,out_channel] = size(kernel);
    ary_out = zeros(img_size,img_size,out_channel);
    opt_h.format = 'h';
    ary_out = chop(ary_out, opt_h);
    for ii = 1 : out_channel
%         disp(out_channel)
        L = zeros(img_size,img_size);
        L = chop(L, opt_h);
        for jj = 1 : in_channel
%             L = L + conv2(ary_in(:,:,jj), flipud(fliplr(kernel(:,:,jj,ii))), 'same');
            avg = mean(ary_in(:,:,jj),'all');
            img_pad = ones(img_size+kernel_size-1,img_size+kernel_size-1,1)*0;
            img_pad = chop(img_pad, opt_h);
            start_idx = ceil(kernel_size/2);
            img_pad(start_idx:start_idx+img_size-1,start_idx:start_idx+img_size-1,1) = ary_in(:,:,jj);
            L = L + conv2(img_pad, flipud(fliplr(kernel(:,:,jj,ii))), 'valid');
        end
%         disp(ii)
        L = L + bias(ii)*ones(img_size,img_size);
%         disp(bias(ii)*ones(img_size,img_size));
        L = L.*(L > 0);
        ary_out(:,:,ii) = L;
%         disp(L)
    end
    
end


function psnr = psnr1(img1, img2)
   diff = img1 - img2;
%    disp(diff);
   mse = mean(diff.^2, 'all');
%    disp(mse);
   if mse < 1.0e-10
      psnr = 100;
   
   else
       psnr = 10 * log10(255.0*255.0/mse);
   end
end

