% write u matrix to header file

N = 256;
K = Kernel(N,1,0);

fid = fopen("hermite_gaussian.h","w");
fprintf(fid,"const DTYPE hermite_gaussian[%d][%d] = \n{\n",N,N);

for i = 1:N
    fprintf(fid,"    {");
    for j = 1:N
        fprintf(fid,"%f",K(j,i));
        if j<N
            fprintf(fid,",");
        end
    end
    fprintf(fid,"}");
    if i<N
        fprintf(fid,",");
    end
    fprintf(fid,"\n");
end
fprintf(fid,"};\n");