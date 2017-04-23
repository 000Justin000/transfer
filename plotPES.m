A = csvread('qchem_scan_1001_B3LYP_d3_6-31G*/energies');
X = reshape(A(:,1), [36,36]);
Y = reshape(A(:,2), [36,36]);
V = reshape(A(:,3), [36,36]);
Xe = zeros(37,37);
Ye = zeros(37,37);
Ve = zeros(37,37);
Xe(1:36,1:36) = X;
Ye(1:36,1:36) = Y;
Ve(1:36,1:36) = V;

Xe(37,:) = Xe(36,:);
Xe(:,37) = Xe(:,1)+2*pi;
Ye(:,37) = Ye(:,36);
Ye(37,:) = Ye(1,:)+2*pi;
Ve(37,:) = Ve(1,:);
Ve(:,37) = Ve(:,1);

surf(Xe,Ye,(Ve-min(min(Ve)))*627.509);
colorbar;
caxis([0 10]);
grid;
shading interp;
