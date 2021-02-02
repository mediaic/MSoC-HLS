clear, clc
mkdir golden
rng(1);
img_size = 33;

img_in = rand(img_size, img_size)-0.5;
kernel_1 = rand(11,11,1,64)-0.5;
kernel_2 = rand(1,1,64,32)-0.5;
kernel_3 = rand(7,7,32,1)-0.5;
kernel_4 = rand(11,11,1,64)-0.5;
kernel_5 = rand(1,1,64,32)-0.5;
kernel_6 = rand(7,7,32,1)-0.5;

L1 = conv2d(img_in, kernel_1)
L2 = conv2d(L1, kernel_2);
L3 = conv2d(L2, kernel_3);
L4 = conv2d(L3, kernel_4);
L5 = conv2d(L4, kernel_5);
img_out = conv2d(L5, kernel_6)

write_img(img_in, 'golden/img_in.txt')
write_img(img_out, 'golden/img_out.txt')

fid = fopen('weights.h','w+');
fprintf(fid, 'typedef float data_type;\n');
write_array(fid, kernel_1, 'data_type kernel1_weight[11][11][1][64]')
write_array(fid, kernel_2, 'data_type kernel2_weight[1][1][64][32]')
write_array(fid, kernel_3, 'data_type kernel3_weight[7][7][32][1]')
write_array(fid, kernel_4, 'data_type kernel4_weight[11][11][1][64]')
write_array(fid, kernel_5, 'data_type kernel5_weight[1][1][64][32]')
write_array(fid, kernel_6, 'data_type kernel6_weight[7][7][32][1]')
fclose(fid);

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
    fprintf(fid, '};\n');
    fclose(fid);
end

function ary_out = conv2d(ary_in, kernel)
    [img_size,~,~] = size(ary_in);
    [~,~,in_channel,out_channel] = size(kernel);
    ary_out = zeros(img_size,img_size,out_channel);
    for ii = 1 : out_channel
        L = zeros(img_size,img_size);
        for jj = 1 : in_channel
            L = L + conv2(ary_in(:,:,jj), flipud(fliplr(kernel(:,:,jj,ii))), 'same');
        end
        L = L.*(L > 0);
        ary_out(:,:,ii) = L;
    end
end