    clc, clear, close all;
n = 36;

A = dlmread('../qchem_scan_1111_B3LYP_d3_6-31G*/energies');
X = reshape(A(:,1), [n,n]);
Y = reshape(A(:,2), [n,n]);
V = reshape(A(:,3), [n,n]);
Xe = zeros(n+1,n+1);
Ye = zeros(n+1,n+1);
Ve = zeros(n+1,n+1);
Xe(1:n,1:n) = X;
Ye(1:n,1:n) = Y;
Ve(1:n,1:n) = V;

Xe(n+1,:) = Xe(n,:);
Xe(:,n+1) = Xe(:,1)+2*pi;
Ye(:,n+1) = Ye(:,n);
Ye(n+1,:) = Ye(1,:)+2*pi;
Ve(n+1,:) = Ve(1,:);
Ve(:,n+1) = Ve(:,1);

Ve = (Ve-min(min(Ve)))*627.509;

surf(Xe/(2*pi)*360,Ye/(2*pi)*360,Ve);
view(0,90);
set(gca,'xlim',[0 360]);
set(gca,'ylim',[0 360]);
set(gca,'XTick',[0:60:360]);
set(gca,'YTick',[0:60:360]);
set(gca,'XTickLabel',['  0';' 60';'120';'180';'240';'300';'360']);
set(gca,'YTickLabel',['  0';' 60';'120';'180';'240';'300';'360']);
xlabel('dihedral-1')
ylabel('dihedral-2')
set(gcf, 'Position', [0, 0, 1100, 1200]);
h = colorbar;
ylabel(h,'kcal/mol')
caxis([0 10]);
shading interp;
print('~/Desktop/1111', '-depsc')
