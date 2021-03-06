function [Xe,Ye,Ve] = meshBoard(X,Y,V)
    sz = size(V);
    n = sz(1);
    m = sz(2);

    Xe = zeros(n+1,m+1);
    Ye = zeros(n+1,m+1);
    Ve = zeros(n+1,m+1);
    Xe(1:n,1:m) = X;
    Ye(1:n,1:m) = Y;
    Ve(1:n,1:m) = V;

    Xe(n+1,:) = Xe(1,:)+360;%2*pi;
    Xe(:,m+1) = Xe(:,m);
    Ye(n+1,:) = Ye(n,:);
    Ye(:,m+1) = Ye(:,1)+360;%2*pi;
    Ve(n+1,:) = Ve(1,:);
    Ve(:,m+1) = Ve(:,1);
end