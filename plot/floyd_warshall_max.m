function B = floyd_warshall_max(P)
    n = size(P,1);
    
    B = ones(n^2, n^2) * 100;
    for i=1:n
        for j=1:n
            row=n*(j-1)+(i-1)+1; col=n*(j-1)+(i-1)+1; B(row,col)=P(i,j);
            
            ii=pdn(i-1,n); jj=pdn(j,n);   row=n*(jj-1)+(ii-1)+1; col=n*(j-1)+(i-1)+1; B(row,col)=max(P(i,j),P(ii,jj)); % ^
            ii=pdn(i+1,n); jj=pdn(j,n);   row=n*(jj-1)+(ii-1)+1; col=n*(j-1)+(i-1)+1; B(row,col)=max(P(i,j),P(ii,jj)); % v
            ii=pdn(i,n);   jj=pdn(j-1,n); row=n*(jj-1)+(ii-1)+1; col=n*(j-1)+(i-1)+1; B(row,col)=max(P(i,j),P(ii,jj)); % <
            ii=pdn(i,n);   jj=pdn(j+1,n); row=n*(jj-1)+(ii-1)+1; col=n*(j-1)+(i-1)+1; B(row,col)=max(P(i,j),P(ii,jj)); % >
            
            ii=pdn(i-1,n); jj=pdn(j-1,n); row=n*(jj-1)+(ii-1)+1; col=n*(j-1)+(i-1)+1; B(row,col)=max(P(i,j),P(ii,jj)); % <^
            ii=pdn(i-1,n); jj=pdn(j+1,n); row=n*(jj-1)+(ii-1)+1; col=n*(j-1)+(i-1)+1; B(row,col)=max(P(i,j),P(ii,jj)); % ^>
            ii=pdn(i+1,n); jj=pdn(j-1,n); row=n*(jj-1)+(ii-1)+1; col=n*(j-1)+(i-1)+1; B(row,col)=max(P(i,j),P(ii,jj)); % <v
            ii=pdn(i+1,n); jj=pdn(j+1,n); row=n*(jj-1)+(ii-1)+1; col=n*(j-1)+(i-1)+1; B(row,col)=max(P(i,j),P(ii,jj)); % v>
        end
    end

    for k=1:n^2        
        BN = min(B, max(B(:,k)*ones(1,n^2), ones(n^2,1)*B(k,:)));
    end
end