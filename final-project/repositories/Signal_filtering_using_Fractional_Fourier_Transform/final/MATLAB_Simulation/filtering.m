% Draw the spectrogram of filtered input signal

N = 256 ; 
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

rotation_angle = pi*0.42;
F = Kernel(N,0, rotation_angle ) ;
y = x * F ; 
y(round(N*0.3):round(N*0.7))=0;
F = Kernel(N,0, -rotation_angle );
y = y * F;

z = zeros(1,N*2);
z(1:2:end) = y;
%s = stft(y,d,'Window',win,'OverlapLength',98,'FFTLength',N/2);
stft([z,z],d,'Window',win,'OverlapLength',98,'FFTLength',N);
caxis([-40 40]);
    





