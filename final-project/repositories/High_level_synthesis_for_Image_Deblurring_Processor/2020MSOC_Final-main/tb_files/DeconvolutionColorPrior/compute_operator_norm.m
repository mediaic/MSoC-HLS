function L = compute_operator_norm(A, AS, sx)

    % computes the operator norm for a linear operator AS on images with size sx, 
    % which is the square root of the largest eigenvector of AS*A.
    % http://mathworld.wolfram.com/OperatorNorm.html
    vec_size = sx(1) * sx(2);

    %Compute largest eigenvalue (in this case arnoldi, since matlab
    %implementation faster than power iteration)
    opts.tol = 1.e-3;
    opts.maxit = 10;
    lambda_largest = eigs(@(x)ASAfun(x, A, AS, sx(1), sx(2)), vec_size, 1,'LM', opts);
    L = sqrt(lambda_largest);

return;

function ASAx = ASAfun(x, A, AS, m, n)
    x_img = reshape(x,m,n);
    ASAx = AS(A(x_img));
    ASAx = ASAx(:);
return;