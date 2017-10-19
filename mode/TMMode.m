close all;

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
        
        ii=pd(i-1,n); jj=pd(j,n); row=n*(jj-1)+(ii-1)+1; col=n*(j-1)+(i-1)+1; pt=1/4*min(1,exp(-(P(ii,jj)-P(i,j))/T)); TM(row,col)=TM(row,col)+pt; pstay=pstay-pt; % bottom-point
        ii=pd(i+1,n); jj=pd(j,n); row=n*(jj-1)+(ii-1)+1; col=n*(j-1)+(i-1)+1; pt=1/4*min(1,exp(-(P(ii,jj)-P(i,j))/T)); TM(row,col)=TM(row,col)+pt; pstay=pstay-pt; % up-point
        ii=pd(i,n); jj=pd(j-1,n); row=n*(jj-1)+(ii-1)+1; col=n*(j-1)+(i-1)+1; pt=1/4*min(1,exp(-(P(ii,jj)-P(i,j))/T)); TM(row,col)=TM(row,col)+pt; pstay=pstay-pt; % left-point
        ii=pd(i,n); jj=pd(j+1,n); row=n*(jj-1)+(ii-1)+1; col=n*(j-1)+(i-1)+1; pt=1/4*min(1,exp(-(P(ii,jj)-P(i,j))/T)); TM(row,col)=TM(row,col)+pt; pstay=pstay-pt; % right-point

        row=n*(j-1)+(i-1)+1; col=n*(j-1)+(i-1)+1; TM(row,col)=pstay-1; % leave
    end
end

% compute the spectrum of Laplacian matrix
[eigvecs, eigvals] = eig(TM);
[eigvals,idx] = sort(diag(eigvals),'descend');
eigvecs_r = eigvecs(:,idx);
eigvecs_l = inv(eigvecs(:,idx))';

eigvecs_plot='R';

algebraic_connectivity = eigvals(2);
display(algebraic_connectivity);

if (strcmp(eigvecs_plot, 'R'))
    rho = eigvecs_r(:,1)/sum(eigvecs_r(:,1));
    V = reshape(rho,[n,n]);
elseif (strcmp(eigvecs_plot, 'L'))
    rho = eigvecs_l(:,1)/sum(eigvecs_l(:,1));
    V = reshape(rho,[n,n]);
end

[Xe,Ye,Ve] = meshBoard(X,Y,V);
figure
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

% calculate the Laplacian matrix
C = diag(eigvecs_r(:,1)/sum(eigvecs_r(:,1))) * TM';
L = diag(sum(C,2)) - C;

% calculate the pseudoinverse of the Laplacian matrix
[eigvecs,eigvals] = eig(L);
[eigvals,idx] = sort(diag(eigvals),'ascend');
eigvecs = eigvecs(:,idx);
inv_eigvals = 1./eigvals;
inv_eigvals(1) = 0;
pinv_L = eigvecs * diag(inv_eigvals) * eigvecs';
Reff = diag(diag(pinv_L))*ones(size(pinv_L)) - 2*pinv_L + ones(size(pinv_L))*diag(diag(pinv_L));

Ceff = 1./(Reff+diag(inf(n^2,1)));
rate = sum(sum(Ceff * diag(rho)));

display(rate);

[Xe,Ye,Ve] = meshBoard(X,Y,reshape(Ceff(1,:),[n,n]));
figure
surf(Xe/(2*pi)*360,Ye/(2*pi)*360,Ve);
view(90,90);
shading interp;
colormap jet;
set(gca,'xlim',[0 360]);
set(gca,'ylim',[0 360]);
set(gca,'XTick',[0:180:360]);
set(gca,'YTick',[0:180:360]);
xlabel('$\mathbf{\theta}$','Interpreter','LaTex')
ylabel('$\mathbf{\phi}$','Interpreter','LaTex')
set(gca,'FontSize',30)
set(gcf, 'Position', [0, 0, 1000, 850]);
colorbar;