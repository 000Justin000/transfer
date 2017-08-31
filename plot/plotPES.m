close all;
n = 36;

% system = '11n11';
method = '_B3LYP';
showpath = false;

labels = [];

if (strcmp(method, '_B3LYP'))
    A = dlmread(strcat('../qchem_scan_', system, method, '_d3_6-31G*/energies'));
    if (showpath==true)
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
    end
elseif (strcmp(method, '_RIMP2'))
    A = dlmread(strcat('../qchem_sp_', system, method, '_None_aug-cc-pVDZ/energies'));  
    if (showpath==true)        
        switch system
            case '1001'
                labels=[[  0,360]; [ 35,310]; [ 95,275]; [135,240]; [180,213]; [199,150]; [247,102]; [318, 78];];
            case '1101'
                labels=[[  0,360]; [ 65,310]; [ 78,250]; [178,195]; [225,148]; [252, 90]; [310, 70]; ...
                        [358,190]; [ 45,135]; [100, 90]; [120, 65]; [182,  3]; [240,315]; [295,240];];
            case '1111'
                labels=[[  0,360]; [ 62,325]; [ 85,255]; [130,200]; [185,195]; [230,160]; [257, 92]; [298, 40];];
            case '10n01'
                labels=[[  0,360]; [ 44,302]; [ 90,245]; [150,198]; [176,180]; [198,153]; [248, 87]; [302, 43];];
            case '11n01'
                labels=[[  0,360]; [108,253]; [230,130]; [293, 72]; [  0,190]; [118, 72]; [212,335]; [288, 255];];
            case '11n11'
                labels=[[  0,360]; [ 40,313]; [ 75,268]; [133,226]; [187,185]; [223,136]; [265, 77]; [310, 46];];
        end
    end
end
    
X = reshape(A(:,1), [n,n])';
Y = reshape(A(:,2), [n,n])';
P = reshape(A(:,3), [n,n])';

P = (P-min(min(P)))*627.509;

[Xe,Ye,Ve] = meshBoard(X,Y,P);

Xe = Xe/(2*pi)*360;
Ye = Ye/(2*pi)*360;

figure;
surf(Xe,Ye,Ve);
view(90,90);
set(gca,'xlim',[0 360]);
set(gca,'ylim',[0 360]);
set(gca,'XTick',[0:180:360]);
set(gca,'YTick',[0:180:360]);
% set(gca,'XTickLabel',['  0';'180';'360']);
% set(gca,'YTickLabel',['  0';'180';'360']);
xlabel('$\mathbf{\theta}$','Interpreter','LaTex')
ylabel('$\mathbf{\phi}$','Interpreter','LaTex')
set(gca,'FontSize',30)
set(gcf, 'Position', [0, 0, 1000, 850]);
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