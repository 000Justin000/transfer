clc, clear, close all;
n = 36;
T = 600/(3.16e5);

system = '11n11';
method = '_B3LYP';
labels = [];

if (strcmp(method, '_B3LYP'))
    A = dlmread(strcat('../qchem_scan_', system, method, '_d3_6-31G*/energies'));
elseif (strcmp(method, '_RIMP2'))
    A = dlmread(strcat('../qchem_sp_', system, method, '_None_aug-cc-pVDZ/energies'));  
end
    
X = reshape(A(:,1), [n,n]);
Y = reshape(A(:,2), [n,n]);
P = reshape(A(:,3), [n,n]);

TM = zeros(n^2, n^2);
for i=1:n
    for j=1:n
        pstay=1;
        
        ii=pd(i-1,n); jj=pd(j,n); row=n*(ii-1)+(jj-1)+1; col=n*(i-1)+(j-1)+1; pt=1/4*min(1,exp(-(P(ii,jj)-P(i,j))/T)); TM(row,col)=TM(row,col)+pt; pstay=pstay-pt; % bottom-point
        ii=pd(i+1,n); jj=pd(j,n); row=n*(ii-1)+(jj-1)+1; col=n*(i-1)+(j-1)+1; pt=1/4*min(1,exp(-(P(ii,jj)-P(i,j))/T)); TM(row,col)=TM(row,col)+pt; pstay=pstay-pt; % up-point
        ii=pd(i,n); jj=pd(j-1,n); row=n*(ii-1)+(jj-1)+1; col=n*(i-1)+(j-1)+1; pt=1/4*min(1,exp(-(P(ii,jj)-P(i,j))/T)); TM(row,col)=TM(row,col)+pt; pstay=pstay-pt; % left-point
        ii=pd(i,n); jj=pd(j+1,n); row=n*(ii-1)+(jj-1)+1; col=n*(i-1)+(j-1)+1; pt=1/4*min(1,exp(-(P(ii,jj)-P(i,j))/T)); TM(row,col)=TM(row,col)+pt; pstay=pstay-pt; % right-point

        row=n*(i-1)+(j-1)+1; col=n*(i-1)+(j-1)+1; TM(row,col)=pstay; % stay
    end
end

[eigv, eigs] = eig(TM);
[eigs,idx] = sort(abs(diag(eigs)),'descend');
eigv = eigv(:,idx);
plot(1:n^2, eigs);

eigv(:,1)=eigv(:,1)/sum(eigv(:,1));
display(sum(log(eigs)));

V = reshape(eigv(:,1),[n,n])';

[Xe,Ye,Ve] = meshBoard(X,Y,V);
surf(Xe/(2*pi)*360,Ye/(2*pi)*360,Ve);
set(gca,'xlim',[0 360]);
set(gca,'ylim',[0 360]);
shading interp;
colormap jet;
colorbar
view(0,90);
set(gcf, 'Position', [0, 0, 1100, 1200]);
set(gca,'XTick',[0:60:360]);
set(gca,'YTick',[0:60:360]);
