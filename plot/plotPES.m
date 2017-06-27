clc, clear, close all;
n = 36;

system = '1101';

A = dlmread(strcat('../qchem_scan_', system, '_B3LYP_d3_6-31G*/energies'));

if (strcmp(system, '1001'))
    labels=[[  0,  0]; [ 25, 75]; [100,100]; [180, 20]; [212, 78]; [248,105]; [320, 80]; [ 25,140]; [205,155]; [ 28,245]; [175,215]; [220,240]; [305,255]; [355,212]; [245,290]; [ 55,285]; [ 90,270]; [135,235]];
elseif (strcmp(system, '1101'))
    labels=[[  0,  0]; [ 35, 65]; [ 40,130]; [110, 90]; [185,  0]; [225, 65]; [255, 92]; [315, 65]; [230,150]; [ 30,230]; [175,200]; [220,230]; [300,240]; [355,195]; [ 70,310]; [250,310]; [ 90,245]; [ 80,278]];
elseif (strcmp(system, '1111'))
    labels=[[  0,  0]; [ 35, 55]; [ 90, 90]; [130, 30]; [210,  0]; [235, 55]; [260, 90]; [310, 40]; [ 50,150]; [230,160]; [  0,200]; [ 30,220]; [ 80,240]; [230,220]; [290,230]; [ 70,320]; [160,195]; [200,200]];
else
    error('the system is never considered!\n')
end
    
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
% set(gca,'XTickLabel',['  0';'180';'360']);
% set(gca,'YTickLabel',['  0';'180';'360']);
xlabel('$\phi$','Interpreter','LaTex')
ylabel('$\theta$','Interpreter','LaTex')
% set(gca,'FontSize',35)
set(gcf, 'Position', [0, 0, 1100, 1200]);
h = colorbar;
ylabel(h,'kcal/mol')
set(h,'YTick',[0,5,10]);
caxis([0 10]);
shading interp;

hold on;

for i=1:length(labels)
    text(labels(i,1),labels(i,2),10,num2str(i-1))
end

print(strcat('./', system), '-dpng')
