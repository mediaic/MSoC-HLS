function db_chs = pd_joint_deconv(channels, channels_0, ...
                                w_base, ...
                                max_it, tol, verbose)
                            
%Debug options
local_iterate_fig = [];
if strncmpi(verbose,'all',3)
    verbose = 'all';
    %Figures
    local_iterate_fig = figure();
elseif strncmpi(verbose,'brief',5)
    verbose = 'brief';
else
    verbose = 'none';
end           

%Initialize all channels
if isempty(channels_0)
    channels_0 = channels;
end
db_chs = channels; %Empty initialization
iterate_fig = []; %Debug figures for all channels
for ch = 1:length(channels)
    
    %Set to the initial iterate if neccessary
    if ~isempty(db_chs(ch).K)
        db_chs(ch).Image = channels_0(ch).Image;
    elseif isequal(size(db_chs(ch).K, 1), size(db_chs(ch).K, 2)) ||...
           mod(size(db_chs(ch).K, 1),2) == 0
        error('Blur size is not square or odd'); %Blur size check
    end
                              
    %Result figure
    if strcmp(verbose, 'all')
    	iterate_fig = [iterate_fig, figure()];
    end
end

%Do startup minimization
for s=1:size(w_base,1)
    if strcmp(verbose, 'brief') || strcmp(verbose, 'all')
        fprintf('\n### Startup iteration %d ###\n',s)
    end
    
    %Get current channel and weights
    ch_opt =       w_base(s,1);
    w_res_curr =   w_base(s, 2);
    w_tv_curr =    w_base(s, 3);
    w_black_curr = w_base(s, 4);
    w_cross_curr = w_base(s, 5:end - 1);
    res_iter =     w_base(s,end);
    
    %Check for residual deconvolution sanity
    if (res_iter > 0) && ~isequal(w_cross_curr, zeros(size(w_cross_curr)))
        error('Residual iteration with cross channel terms is not supported')
    end
    
    % edgetaper to better handle circular boundary conditions
    ks = size(channels(ch_opt).K,1);
    for ch = 1:length(channels)
        channels(ch).Image = padarray(channels(ch).Image, [1 1]*ks, 'replicate', 'both');
        db_chs(ch).Image = padarray(db_chs(ch).Image, [1 1]*ks, 'replicate', 'both');
        for a=1:4
          channels(ch).Image = edgetaper(channels(ch).Image, channels(ch_opt).K);
          db_chs(ch).Image = edgetaper(db_chs(ch).Image, channels(ch_opt).K);
        end
        
        channels(ch).Image = channels(ch).Image + 1.0;
        db_chs(ch).Image = db_chs(ch).Image + 1.0;
    end
    
    %Do residual pd deconvolution
    [db_chs(ch_opt).Image] = residual_pd_deconv(channels, db_chs, ch_opt, ...
                                    w_res_curr, w_tv_curr, w_black_curr, w_cross_curr, ...
                                    res_iter, tol, max_it, verbose, iterate_fig, local_iterate_fig);  
                                
    for ch = 1:length(channels)
        % remove padding
        channels(ch).Image = channels(ch).Image(ks+1:end-ks, ks+1:end-ks) - 1.0;
        db_chs(ch).Image = db_chs(ch).Image(ks+1:end-ks, ks+1:end-ks) - 1.0;
    end
                                
end

return;

function [ res ] = residual_pd_deconv(channels, db_chs, ch, ...
                                    w_res_curr, w_tv_curr, w_black_curr, w_cross_curr, ...
                                    res_iter, tol, max_it, verbose, iterate_fig, local_iterate_fig)
    %Residual deconvolution
    detail_tol = tol;
    for d = 1:(res_iter + 1)
        
        %Compute residual blur
        if d == 1
            channels_res_blur = channels;
           
            %Initial iterate
            x_0 = db_chs(ch).Image;
            
            %Detail tolerance
            tol_offset = zeros(size(db_chs(ch).Image));
        else
            %Compute residual blur image
            channels_res_blur = channels;
            channels_res_blur(ch).Image = channels(ch).Image - imconv(db_chs(ch).Image, db_chs(ch).K, 'same' );
            channels_res_blur(ch).Image = 1 + channels_res_blur(ch).Image;
            
            %Initial iterate is blurred residual
            x_0 = channels_res_blur(ch).Image;
            
            %Update regularizer weight and tolerance
            w_res_curr = w_res_curr * 3.0;
            
            %Detail tolerance
            tol_offset = db_chs(ch).Image - 1;
        end
        
        %Minimize
        verbose_local = 'brief';
        [x] = pd_channel_deconv(channels_res_blur, ch, x_0 , db_chs, ...
                       w_res_curr, w_cross_curr, w_tv_curr, w_black_curr, ...
                       max_it, detail_tol, tol_offset, verbose_local, local_iterate_fig);  
                   
        %Threshold if neccessary
        x(x < 1) = 1;
        
        %Update details and write back
        if d == 1
            db_chs(ch).Image = x;
        else
            db_chs(ch).Image = db_chs(ch).Image + (x - 1);
            db_chs(ch).Image(db_chs(ch).Image < 0 ) = 0; %Threshold again if neccessary
        end
        
      
    end
    
    %Result
    res = db_chs(ch).Image;
return;

function [ res ] = pd_channel_deconv(channels, ch, x_0 , db_chs, ...
                    lambda_residual, lambda_cross_ch, lambda_tv, lambda_black, ...
                    max_it, tol, tol_offset, verbose, iterate_fig)
    
    
    %Shortcut for the TV norm.
    Amplitude = @(u)sqrt(u.^2);
    F = @(u)sum(sum(Amplitude(u)));
    
    %Prepare
    sizey = size(channels(ch).Image);
    otfk  = psf2otf(channels(ch).K, sizey); 
    Nomin1 = conj(otfk).*fft2(channels(ch).Image);
    Denom1 = abs(otfk).^2; 
    
    %% write FFT coe
    otfkkk  = psf2otf(channels(ch).K, sizey); 
    Nomin1kk = conj(otfkkk).*fft2(channels(ch).Image);
    Denom1kk = abs(otfkkk).^2; 
%     RE = real(Nomin1kk) ;
%     img1D = RE(:);
%     fid = fopen('REAL.txt', 'wt');
%     fprintf(fid, '%f\n', img1D);
%     fclose(fid);
%     
%     IMAG = imag(Nomin1kk) ;
%     img1D = IMAG(:);
%     fid = fopen('IMAGINARY.txt', 'wt');
%     fprintf(fid, '%f\n', img1D);
%     fclose(fid);
%     
%     img1D = Denom1kk(:);
%     fid = fopen('DENOM.txt', 'wt');
%     fprintf(fid, '%f\n', img1D);
%     fclose(fid);
%%
    %Prox operator
    %L1 norm
    ProxFS = @(u,lambda) u ./ max(1, Amplitude(u));
    
    %Huber norm 
    %alpha = 0.01;
    %ProxFS = @(u,sigma) (u/(1 + alpha*sigma)) ./ max(1, Amplitude((u/(1 + alpha*sigma)))); 

    %Fast data solve with fft
    ProxG = @(f,tau,l) solve_fft(Nomin1, Denom1, tau, l, f );
    

    
    %Minimization weights
    L = compute_operator_norm(@(x)Kmult(x, ch, db_chs, lambda_cross_ch, lambda_tv), ...
                             @(x)KSmult(x,ch, db_chs, lambda_cross_ch, lambda_tv), size(channels(ch).Image));
    
    
    
    sigma = 1.0;
    tau   = .7/(sigma*L^2);
    theta = 1.0;
    %tau = 0.2273 ,0.0219, 0.0219
    
    %Set initial iterate
    if isempty(x_0)
        x_0 = channels(ch).Image;
    end
    f = x_0;
    g = 0;Kmult(f, ch, db_chs, lambda_cross_ch, lambda_tv);
    f1 = f;
    
    
    
    %Example of one iterations.
    for i = 1:max_it
        
        fold = f;
        g = ProxFS( g + sigma * Kmult(f1, ch, db_chs, lambda_cross_ch, lambda_tv), sigma);
        f = ProxG( f - tau * KSmult(g, ch, db_chs, lambda_cross_ch, lambda_tv), tau, lambda_residual);
        f1 = f + theta * (f-fold);

        %Display it.
        if strcmp(verbose, 'all')  && mod(i,20) == 0
            figure(iterate_fig);
            clf;
            imagesc(f1), colormap gray, axis image, title(sprintf('Local PD iterate %d',i));
            pause(0.1)
        end

        diff = (f + tol_offset) - (fold + tol_offset);
        f_comp = (f + tol_offset);
        if strcmp(verbose, 'brief') || strcmp( verbose, 'all')
            fprintf('Ch: %d, iter %d, diff %5.5g\n', ch, i, norm(diff(:),2)/ norm(f_comp(:),2))
        end
        if norm(diff(:),2)/ norm(f_comp(:),2) < tol
            break;
        end
    end
    res = f1;
return;

function x = solve_fft(Nomin1, Denom1, tau, lambda, f )

    %Solves Ax = b with
    % A = (tau*lambda* K'* K + eye ) and b = tau * lambda * K' * B + f 
    %      Nomin1  -- F(K)'*F(y)
    %      Denom1  -- |F(K)|.^2

    x = (tau * 2 * lambda * Nomin1 + fft2(f))./ (tau * 2 * lambda * Denom1 + 1); 
    x = real(ifft2(x));
    
return;

function Kmultf = Kmult(f, ch, db_chs, lambda_cross_ch, lambda_tv )

%Result
Kmultf = [];

% derivative filters
dxf=[-1 1];
dyf=[-1;1];
dyyf=[-1; 2; -1];
dxxf=[-1, 2, -1];
dxyf=[-1 1;1 -1];

%Compute tv terms
if lambda_tv > eps
    
    fd_w = 0.5;  %weight for first derivatives
    fx = imconv(f, rot90(dxf,2), 'full');
    fx = (lambda_tv * fd_w) * fx(:, 2:end);

    fy = imconv(f, rot90(dyf,2), 'full');
    fy = (lambda_tv * fd_w) * fy(2:end, :);

    sd_w = 0.15; %weight for second derivatives
    fxx = imconv(f, rot90(dxxf,2), 'full');
    fxx = (lambda_tv * sd_w) *  fxx(:, 3:end);

    fyy = imconv(f, rot90(dyyf,2), 'full');
    fyy = (lambda_tv * sd_w) * fyy(3:end, :);

    fxy = imconv(f, rot90(dxyf,2), 'full');
    fxy = (lambda_tv * sd_w) *  fxy(2:end, 2:end);

    %Gather
    Kmultf = cat(3,fx, fy, fxx, fyy, fxy);
end

%Cross-Terms for all adjacent channels
for adj_ch = 1:length(db_chs)
    
     %Early exit
     if sum(lambda_cross_ch) <= eps
         break;
     end

    %Continue for current channel
    if adj_ch == ch || isempty(db_chs(adj_ch).K)
        continue;
    end
    adjChImg = db_chs(adj_ch).Image; %Curr cross channel
    
    %Compute cross terms
    cr_w = 1.0;
    diag_term = imconv(adjChImg, rot90(dxf,2), 'full');
    diag_term = diag_term(:, 2:end) .* f;
    conv_term = imconv(f,rot90(dxf,2), 'full');
    Sxf = (lambda_cross_ch(adj_ch) * cr_w) * ( adjChImg .* conv_term(:, 2:end) - diag_term );
    
    diag_term = imconv(adjChImg, rot90(dyf,2), 'full');
    diag_term = diag_term(2:end, :) .* f;
    conv_term = imconv(f,rot90(dyf,2), 'full');
    Syf = (lambda_cross_ch(adj_ch) * cr_w) * ( adjChImg .* conv_term(2:end, :) - diag_term );
    
    %Gather
    Kmultf = cat(3,Kmultf, Sxf, Syf);
end

return;


function KSmultf = KSmult(f, ch, db_chs, lambda_cross_ch, lambda_tv )

%Result
KSmultf = zeros([size(f,1), size(f,2)]);

% derivative filters
dxf=[-1 1];
dyf=[-1;1];
dyyf=[-1; 2; -1];
dxxf=[-1, 2, -1];
dxyf=[-1 1;1 -1];

%Compute tv terms
i = 0; %Image access term
if lambda_tv > eps
    fd_w = 0.5;   %weight for first derivatives
    i = i + 1;
    fx = imconv( (lambda_tv * fd_w) * f(:,:,i), dxf, 'full');
    fx = fx(:, 1:end-1);

    i = i + 1;
    fy = imconv( (lambda_tv * fd_w) *  f(:,:,i), dyf, 'full');
    fy = fy(1:end-1,:);

    sd_w = 0.15; %weight for second derivatives
    i = i + 1;
    fxx = imconv( (lambda_tv * sd_w) *  f(:,:,i), dxxf, 'full');
    fxx = fxx(:, 1:end-2);

    i = i + 1;
    fyy = imconv( (lambda_tv * sd_w) *  f(:,:,i), dyyf, 'full');
    fyy = fyy(1:end-2, :);

    i = i + 1;
    fxy = imconv( (lambda_tv * sd_w) *  f(:,:,i), dxyf, 'full');
    fxy = fxy(1:end-1, 1:end-1);

    % gather result
    KSmultf = fx + fy + fxx + fyy + fxy;
end

%Cross-Terms for all adjacent channels
for adj_ch = 1:length(db_chs)
    
    %Early exit
    if sum(lambda_cross_ch) <= eps
        break;
    end
    
    %Continue for current channel
    if adj_ch == ch || isempty(db_chs(adj_ch).K)
        continue;
    end
    adjChImg = db_chs(adj_ch).Image; %Curr cross channel
    
    %Compute cross terms
    cr_w = 1.0;
    i = i + 1;
    f(:,:,i) = (lambda_cross_ch(adj_ch) * cr_w) * f(:,:,i);
    diag_term = imconv(adjChImg, rot90(dxf,2), 'full');
    diag_term = diag_term(:, 2:end) .* f(:,:,i);
    conv_term = imconv(adjChImg .* f(:,:,i), dxf, 'full'); 
    Sxtf = ( conv_term(:,1:(end-1)) - diag_term );
    
    i = i + 1;
    f(:,:,i) = (lambda_cross_ch(adj_ch) * cr_w) * f(:,:,i);
    diag_term = imconv(adjChImg, rot90(dyf,2), 'full');
    diag_term = diag_term(2:end, :) .* f(:,:,i);
    conv_term = imconv(adjChImg .* f(:,:,i), dyf, 'full'); 
    Sytf = ( conv_term(1:(end-1),:) - diag_term ); 

    %Gather result
    KSmultf = KSmultf + Sxtf + Sytf;
end

return;


function F_filt = imconv(F,K,output)

%Convolution with boundary condition
%General: F_filt = imfilter(F, K, 'full', 'conv', 'replicate');

%Speedup for small two entry kernels (full)
if size(K,1) == 1 && size(K,2) == 2 && strcmp('full', output)
    F_filt = K(1,2)* F(:,[1 1:end],:) + K(1,1)*F(:,[1:end end],:);
elseif size(K,1) == 2 && size(K,2) == 1 && strcmp('full', output)
    F_filt = K(2,1)* F([1 1:end],:,:) + K(1,1)*F([1:end end],:,:);
else
    %General model
    F_filt = imfilter(F, K, output, 'conv', 'replicate');
end

return;
