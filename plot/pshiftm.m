function SA = pshiftm(A, s1, s2) % shift the frame of matrix in a periodic plot
    SA = zeros(size(A));
    for i=1:size(A,1)
        for j=1:size(A,2)
            SA(i,j) = A(pdd(i+s1,1,size(A,1)+1), pdd(j+s2,1,size(A,2)+1));
        end
    end
end