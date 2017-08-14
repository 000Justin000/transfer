clc, clear, close all;
n = 36;

system = '1111';
method = '_RIMP2';
showpath = true;

labels = [];

if (showpath==true)
    if (strcmp(method, '_B3LYP'))
        A = dlmread(strcat('../qchem_scan_', system, method, '_d3_6-31G*/energies'));
        switch system
            case '1001'
                labels=[[  0,360]; [ 65,283]; [ 85,275]; [120,250]; [170,218]; [199,159.6]; [247,102]; [300, 87]; [318, 78];];
            case '1101'
                labels=[[  0,360]; [ 40,328.5]; [60,305]; [ 82,244]; [172,200]; [225,148.5]; [252, 90]; [300.4, 85]; [310, 70];];
            case '1111'
                labels=[[  0,360]; [ 55,329.7]; [ 85,242]; [160 ,195]; [200,200]; [237,149.7]; [257, 92]; [303.5, 43];];
            case '10n01'
                labels=[[  0,360]; [ 39.1,310]; [47,300]; [ 85,242]; [147,205]; [181,180]; [205,148]; [242, 87]; [297, 38.4];];
            case '11n01'
                labels=[[  0,360]; [ 47,318]; [103,253]; [112.7,253]; [147,212]; [181,183]; [205,162]; [238,130]; [292.7, 74];];
            case '11n11'
                labels=[[  0,360]; [ 41,314.8]; [ 84,264]; [132.8,223]; [183,182]; [221,134.8]; [262, 87]; [312.8, 46];];
        end
    elseif (strcmp(method, '_RIMP2'))
        A = dlmread(strcat('../qchem_sp_', system, method, '_None_aug-cc-pVDZ/energies'));  
        switch system
            case '1001'
                labels=[[  0,360]; [ 35,310]; [95,275]; [120,250]; [180,213]; [199,159.6]; [247,102]; [300, 87]; [318, 78];];
            case '1101'
                labels=[[  0,360]; [ 40,328.5]; [60,305]; [ 82,244]; [178,195]; [225,148.5]; [252, 90]; [300.4, 85]; [310, 70];];
            case '1111'
                labels=[[  0,360]; [ 55,329.7]; [ 62,325]; [ 85,255]; [130,200]; [185,195]; [230,160]; [237,149.7]; [257, 92]; [298, 40]; [303.5, 43];];
            case '10n01'
                labels=[[  0,360]; [ 39.1,310]; [47,300]; [ 90,245]; [147,205]; [181,180]; [205,148]; [248, 87]; [300, 38.4];];
            case '11n01'
                labels=[[  0,360]; [ 42,318]; [103,253]; [112.7,253]; [155,212]; [187,183]; [205,162]; [232,130]; [292.7, 74];];
            case '11n11'
                labels=[[  0,360]; [ 41,314.8]; [ 75,268]; [132.8,223]; [187,185]; [221,134.8]; [265, 77]; [312.8, 46];];
        end
    end
end
    
X = reshape(A(:,1), [n,n]);
Y = reshape(A(:,2), [n,n]);
P = reshape(A(:,3), [n,n]);

[Xe,Ye,Ve] = meshBoard(X,Y,P);

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
set(h,'YTick',[0,4,8,12]);
caxis([0 12]);
shading interp;
colormap jet;

hold on;

for i=1:length(labels)
    text(labels(i,1),labels(i,2),10,num2str(i-1),'Interpreter','LaTex');
end

print(strcat('./', system, method), '-dpng')
