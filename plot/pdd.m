function rA = pdd(A, n1, n2)
    rA = A - floor((A-n1)/(n2-n1))*(n2-n1);
end