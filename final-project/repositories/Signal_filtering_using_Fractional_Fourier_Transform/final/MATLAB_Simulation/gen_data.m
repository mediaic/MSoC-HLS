% Generate testing data

N = 256;
N_DATA = 1;

fid_ang = fopen("./src/test_data/input_anglex.txt","w");
fid_dat = fopen("./src/test_data/input_datax.txt","w");
%fid_ref_E = fopen("./src/test_data/ref_result_E.txt","w");
%fid_ref_U = fopen("./src/test_data/ref_result_U.txt","w");
fid_ref = fopen("./src/test_data/ref_resultx.txt","w");

%%
ts = 0:1/N:1-(1/N);

f0 = 10;
f1 = 100;

noise = 10 .* exp( - 1e4.* ( ts(1:N/2)-0.25 ).^2 ) ;
noise = noise .* cos(2*pi*85.*ts(1:N/2)) ; 

x = chirp(ts,f0,1,f1);

x(1:N/2) = x(1:N/2) + noise ; 

d = seconds(1/N);
win = hamming(100,'periodic');

rotation_angle = pi/2 ; 
F = Kernel(N, 0, rotation_angle ) ;
x = x * F ; 

x(N/2:end) = 0 ; 
F = Kernel(N, 0, -rotation_angle ) ;
x = x * F ; 


%%
for i = 1:N_DATA
    rotation_angle = rand()*pi*2-pi;
    F = Kernel(N, 1, rotation_angle );
    y = F' * x.';
    tmp = [0:N-2,N];
    y_E = diag(exp(-j*rotation_angle*tmp)) * y;
    y = F * y_E ;
    d = seconds(1/N);
    win = hamming(100,'periodic');
    z = zeros(1,N*2);
    z(1:2:end) = y;
    stft([z z],d,'Window',win,'OverlapLength',98,'FFTLength',N);
    
    fprintf(fid_ang,"%16.9f\n",rotation_angle);
    for k = 1:N
        fprintf(fid_dat,"%16.9f",real(x(k)));
        fprintf(fid_dat,"%16.9f",imag(x(k)));
        fprintf(fid_ref,"%16.9f",real(y(k)));
        fprintf(fid_ref,"%16.9f",imag(y(k)));
        %fprintf(fid_ref_E,"%16.9f",real(y_E(k)));
        %fprintf(fid_ref_E,"%16.9f",imag(y_E(k)));
        %fprintf(fid_ref_U,"%16.9f",real(y_U(k)));
        %fprintf(fid_ref_U,"%16.9f",imag(y_U(k)));
    end
    fprintf(fid_dat,"\n");
    fprintf(fid_ref,"\n");
    %fprintf(fid_ref_E,"\n");
    %fprintf(fid_ref_U,"\n");
end

fclose(fid_ang);
fclose(fid_dat);
fclose(fid_ref);
%fclose(fid_ref_U);
%fclose(fid_ref_E);