function db_chs = pd_joint_deconv(channels, w_base, max_it, tol)
                            
db_chs = channels; 
%Do startup minimization
for s=1:size(w_base,1)
   
    fprintf('\n### Startup iteration %d ###\n',s)
       
    %Get current channel and weights
    ch_opt =       w_base(s, 1);
    w_res_curr =   w_base(s, 2);
    w_tv_curr =    w_base(s, 3);
    w_cross_curr = w_base(s, 4:end - 1);
    res_iter =     w_base(s,end);
    
    % edgetaper to better handle circular boundary conditions
    ks = size(channels(ch_opt).K,1);
    for ch = 1:length(channels)
        channels(ch).Image = padarray(channels(ch).Image, [1 1]*ks, 'replicate', 'both');
        db_chs(ch).Image = padarray(db_chs(ch).Image, [1 1]*ks, 'replicate', 'both');
        for a=1:4
          channels(ch).Image = edgetaper(channels(ch).Image, channels(ch_opt).K);
         % db_chs(ch).Image = edgetaper(db_chs(ch).Image, channels(ch_opt).K);
        end
        
        channels(ch).Image = channels(ch).Image + 1.0;
        db_chs(ch).Image = db_chs(ch).Image + 1.0;
    end
    
    %Do residual pd deconvolution
    [db_chs(ch_opt).Image] = residual_pd_deconv(channels, db_chs, ch_opt, ...
                                    w_res_curr, w_tv_curr, w_cross_curr, ...
                                    res_iter, tol, max_it);  
                                
    for ch = 1:length(channels)
        % remove padding
        channels(ch).Image = channels(ch).Image(ks+1:end-ks, ks+1:end-ks) - 1.0;
        db_chs(ch).Image = db_chs(ch).Image(ks+1:end-ks, ks+1:end-ks) - 1.0;
    end                     
end
return;

function [ res ] = residual_pd_deconv(channels, db_chs, ch, ...
                                    w_res_curr, w_tv_curr, w_cross_curr, ...
                                    res_iter, tol, max_it)
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
        [x] = pd_channel_deconv(channels_res_blur, ch, x_0 , db_chs, ...
                       w_res_curr, w_cross_curr, w_tv_curr, ...
                       max_it, detail_tol, tol_offset);  
                   
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

function [res] = pd_channel_deconv(channels, ch, x_0 , db_chs, ...
                    lambda_residual, lambda_cross_ch, lambda_tv, ...
                    max_it, tol, tol_offset)
    
    %Shortcut for the TV norm.
    Amplitude = @(u)sqrt(u.^2);
    
    %Prepare
    sizey = size(channels(ch).Image);
    otfk  = psf2otf(channels(ch).K, sizey); 
    Nomin1 = conj(otfk).*fft2(channels(ch).Image);
    Denom1 = abs(otfk).^2; 

    %Prox operator
    ProxFS = @(u,lambda) u ./ max(1, Amplitude(u));
    ProxG = @(f,tau,l) solve_fft(Nomin1, Denom1, tau, l, f );
    
    % weights
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
    g = Kmult(f, ch, db_chs, lambda_cross_ch, lambda_tv);
    f1 = f;
    
    %Example of one iterations.
    for i = 1:max_it
        
        fold = f;
        g = ProxFS( g + sigma * Kmult(f1, ch, db_chs, lambda_cross_ch, lambda_tv), sigma);
        f = ProxG( f - tau * KSmult(g, ch, db_chs, lambda_cross_ch, lambda_tv), tau, lambda_residual);
        f1 = f + theta * (f-fold);
       
        diff = (f + tol_offset) - (fold + tol_offset);
        f_comp = (f + tol_offset);
        fprintf('Ch: %d, iter %d, diff %5.5g\n', ch, i, norm(diff(:),2)/ norm(f_comp(:),2))
        
        if norm(diff(:),2)/ norm(f_comp(:),2) < tol
            break;
        end
    end
    res = f1;
return;

function x = solve_fft(Nomin1, Denom1, tau, lambda, f )

    x = (tau * 2 * lambda * Nomin1 + fft2(f))./ (tau * 2 * lambda * Denom1 + 1); 
    x = real(ifft2(x));
    
return;

function Kmultf = Kmult(f, ch, db_chs, lambda_cross_ch, lambda_tv )

%Result
Kmultf = [];


%Compute tv terms
if lambda_tv > eps
    
    fd_w = 0.5;  %weight for first derivatives
    fx = imconv(f, [1,-1], 'full');
    fx = (lambda_tv * fd_w) * fx(:, 2:end);

    fy = imconv(f, [1;-1], 'full');
    fy = (lambda_tv * fd_w) * fy(2:end, :);

    sd_w = 0.15; %weight for second derivatives
    fxx = imconv(f, [-1,2,-1], 'full');
    fxx = (lambda_tv * sd_w) *  fxx(:, 3:end);

    fyy = imconv(f, [-1; 2; -1], 'full');
    fyy = (lambda_tv * sd_w) *  fyy(3:end, :);

    fxy = imconv(f, [-1 1;1 -1], 'full');
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
    diag_term = imconv(adjChImg, [1,-1], 'full');
    diag_term = diag_term(:, 2:end) .* f;
    conv_term = imconv(f,[1,-1], 'full');
    Sxf = lambda_cross_ch(adj_ch) * ( adjChImg .* conv_term(:, 2:end) - diag_term );
    
    diag_term = imconv(adjChImg, [1;-1], 'full');
    diag_term = diag_term(2:end, :) .* f;
    conv_term = imconv(f, [1;-1], 'full');
    Syf = lambda_cross_ch(adj_ch) * ( adjChImg .* conv_term(2:end, :) - diag_term );
    
    %Gather
    Kmultf = cat(3,Kmultf, Sxf, Syf);
end

return;

function KSmultf = KSmult(f, ch, db_chs, lambda_cross_ch, lambda_tv )

%Compute tv terms
    fd_w = 0.5;   %weight for first derivatives
    
    fx = imconv( (lambda_tv * fd_w) * f(:,:,1), [-1 1], 'full');
    fx = fx(:, 1:end-1);

    fy = imconv( (lambda_tv * fd_w) * f(:,:,2), [-1;1], 'full');
    fy = fy(1:end-1,:);

    sd_w = 0.15; %weight for second derivatives
    
    fxx = imconv( (lambda_tv * sd_w) *  f(:,:,3), [-1, 2, -1], 'full');
    fxx = fxx(:, 1:end-2);

    fyy = imconv( (lambda_tv * sd_w) *  f(:,:,4), [-1; 2; -1], 'full');
    fyy = fyy(1:end-2, :);

    fxy = imconv( (lambda_tv * sd_w) *  f(:,:,5), [-1 1;1 -1], 'full');
    fxy = fxy(1:end-1, 1:end-1);

    % gather result
    KSmultf = fx + fy + fxx + fyy + fxy;

    i = 5 ;
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
    i = i + 1;
    f(:,:,i) = lambda_cross_ch(adj_ch) * f(:,:,i);
    diag_term = imconv(adjChImg, [1 -1], 'full');
    diag_term = diag_term(:, 2:end) .* f(:,:,i);
    conv_term = imconv(adjChImg .* f(:,:,i), [-1 1], 'full'); 
    Sxtf = ( conv_term(:,1:(end-1)) - diag_term );
    
    i = i + 1;
    diag_term = imconv(adjChImg, [1;-1], 'full');
    diag_term = lambda_cross_ch(adj_ch) * diag_term(2:end, :) .* f(:,:,i);
    conv_term = imconv(adjChImg .* f(:,:,i), [-1;1], 'full'); 
    Sytf = ( conv_term(1:(end-1),:) - diag_term ); 

    %Gather result
    KSmultf = KSmultf + Sxtf + Sytf;
end

return;

function F_filt = imconv(F,K,output)
    F_filt = imfilter(F, K, output, 'conv', 'replicate');
return;