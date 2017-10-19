addpath('../plot')

n = 36;

T = 400/(3.16e5);
system = '11n11';
method = '_B3LYP';
labels = [];

if (strcmp(method, '_B3LYP'))
    A = dlmread(strcat('../qchem_scan_', system, method, '_d3_6-31G*/energies'));
elseif (strcmp(method, '_RIMP2'))
    A = dlmread(strcat('../qchem_sp_', system, method, '_None_aug-cc-pVDZ/energies'));  
end
    
X = reshape(A(:,1), [n,n])';
Y = reshape(A(:,2), [n,n])';
P = reshape(A(:,3), [n,n])';

TM = zeros(n^2, n^2);
for i=1:n
    for j=1:n
        pstay=1;
        
        ii=pd(i-1,n); jj=pd(j,n); row=n*(jj-1)+(ii-1)+1; col=n*(j-1)+(i-1)+1; pt=1/5*min(1,exp(-(P(ii,jj)-P(i,j))/T)); TM(row,col)=TM(row,col)+pt; pstay=pstay-pt; % bottom-point
        ii=pd(i+1,n); jj=pd(j,n); row=n*(jj-1)+(ii-1)+1; col=n*(j-1)+(i-1)+1; pt=1/5*min(1,exp(-(P(ii,jj)-P(i,j))/T)); TM(row,col)=TM(row,col)+pt; pstay=pstay-pt; % up-point
        ii=pd(i,n); jj=pd(j-1,n); row=n*(jj-1)+(ii-1)+1; col=n*(j-1)+(i-1)+1; pt=1/5*min(1,exp(-(P(ii,jj)-P(i,j))/T)); TM(row,col)=TM(row,col)+pt; pstay=pstay-pt; % left-point
        ii=pd(i,n); jj=pd(j+1,n); row=n*(jj-1)+(ii-1)+1; col=n*(j-1)+(i-1)+1; pt=1/5*min(1,exp(-(P(ii,jj)-P(i,j))/T)); TM(row,col)=TM(row,col)+pt; pstay=pstay-pt; % right-point

        row=n*(j-1)+(i-1)+1; col=n*(j-1)+(i-1)+1; TM(row,col)=pstay; % stay
    end
end

[eigvec, eigval] = eigs(TM,1,'lm');

rho = eigvec/sum(eigvec);

TMM = TM^((n/4)^2);

D1 = zeros(n,n);

for i=1:n
    for j=1:n
        d = abs(i-j);
        D1(i,j) = abs(d - floor(d/(n/2))*n);
    end
end

D2x = kron(ones(n,n), D1);
D2y = kron(D1, ones(n,n));
DD2 = (D2x.^2 + D2y.^2).^0.5;
% DD2 = (D2x + D2y);

MMM = TMM .* DD2;
fm = sum(MMM) * rho;

V = reshape(MMM(:,1),[n,n]);
[Xe,Ye,Ve] = meshBoard(X,Y,V);
surf(Xe/(2*pi)*360,Ye/(2*pi)*360,Ve);
pbaspect([1 1 1]);
view(90,90);
set(gca,'xlim',[0 360]);
set(gca,'ylim',[0 360]);
set(gca,'XTick',[0:180:360]);
set(gca,'YTick',[0:180:360]);
xlabel('$\mathbf{\theta}$','Interpreter','LaTex')
ylabel('$\mathbf{\phi}$','Interpreter','LaTex')
set(gca,'FontSize',30)
set(gcf, 'Position', [0, 0, 1000, 850]);
shading interp;
colorbar;
colormap jet;

display(fm);
