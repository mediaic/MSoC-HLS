function [F] = Kernel(N,u,alpha)
%KERNEL Summary of this function goes here
%   Create u matrix or DFrFT matrix

S = -4*eye(N);
S(1:N-1, 2:end) = S(1:N-1, 2:end) + eye(N-1);
S(2:end, 1:N-1) = S(2:end, 1:N-1) + eye(N-1);
S = S + diag(2*cos(2*pi*(0:N-1)/N));
S(1, end) = 1;
S(end, 1) = 1;

P = eye(N);
n = ceil(N/2)-1;
%n = floor(N/2);
id = eye(n)/sqrt(2);
P(N-n+1:N, N-n+1:N) = -1*id;
P(2:n+1, N-n+1:N) = flip(id);
P(N-n+1:N, 2:n+1) = flip(id);
P(2:n+1, 2:n+1) = id;

block_diag = P*S*P;
Ev = block_diag(1:N-n, 1:N-n);
Od = block_diag(N-n+1:end, N-n+1:end);

F = zeros(N);


if mod(N,2)
    
    [e,lambda] = eig(Ev);
    [~,order] = sort(diag(lambda),"descend");
    F(1:N-n,1:2:end) = e(:,order);

    [e,lambda] = eig(Od);
    [~,order] = sort(diag(lambda),"descend");
    F(N-n+1:end,2:2:end) = e(:,order);

    tmp = 0:N-1;
    
else
    
    [e,lambda] = eig(Ev);
    [~,order] = sort(diag(lambda),"descend");
    F(1:N-n,1:2:end) = e(:,order(1:N/2));
    F(1:N-n,end) = e(:,order(end));

    [e,lambda] = eig(Od);
    [~,order] = sort(diag(lambda),"descend");
    F(N-n+1:end,2:2:2*n) = e(:,order);
    
    tmp = [0:N-2,N];
    
end

F = P*F;
if ~u
    F = F*diag(exp(-j*alpha*(tmp)))*F';
end

end

