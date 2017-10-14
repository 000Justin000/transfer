close all;
clear;

n = 72;

system = '1001';
method = '_B3LYP';
showpath = true;

labels = [];

if (strcmp(method, '_B3LYP'))
    A = dlmread(strcat('../qchem_scan_', system, method, '_d3_op_6-311++G**/energies'));
    if (showpath==true)
        switch system
            case '1001'  %[ 24.4, -22.8]
                labels = [[0,0]; [ 35, -80]; [100, -105]; [145, -150]; [175, 155]; [-145, 125]; [-100,   90]; [-45, 60]; [-30, -75]; [-30,110]; [140,115];];
            case '1101'  %[126.0, -21.3]
                labels = [[   0,   0]; [ -30,  30]; [ -90,  90]; [ -35, 125]; [   0, 165]; [-25, -150]; [ -90, -105]; [-35,-65]; [ 40, -60]; [95,-105]; [150,-30]; ...
                          [  95,  80]; [ 135, 125]; [ 160, 155]; [-155, 155]; [-155, -40]];
            case '1111'  %[122.8, -38.4]
                labels = [[   0,   0]; [  55, -40]; [  95, -90]; [ 125,-155]; [ 165, 175]; [-140, 170]; [ -85,120]; [ -60, 50]; [-40, 140]; [-40,-50]; [130,140]];
            case '10n01' %[129.8, -25.0]
                labels = [[   0,   0]; [  40, -60]; [ 90, -120]; [140, -165]; [-160, 155]; [ -90, 65];];
            case '11n01' %[106.2, -7.2]
                labels = [[   0,   0]; [  70,  -90]; [130, -145]; [-105,105]];
            case '11n11' %[ 135.7, -58.7];
                labels = [[   0,   0]; [ 40, -40]; [90,-75]; [125, -120]; [165,-170]; [-140, 155]; [-80, 110]; [ -40, 60]];
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

% [Ye,Xe] = deal(Xe,Ye); % swap

figure;
surf(Xe,Ye,Ve);
view( 0,90);
set_range
xlabel('$\mathbf{\theta}$','Interpreter','LaTex')
ylabel('$\mathbf{\phi}$','Interpreter','LaTex')
set(gca,'FontSize',30)
set(gcf, 'Position', [0, 0, 1000, 850]);
h = colorbar;
ylabel(h,'kcal/mol')
set(h,'YTick',[0,4,8,12]);
caxis([0 12]);
shading interp;

colormap jet(24);

hold on;

for i=1:size(labels,1)
    text(labels(i,1),labels(i,2),10,num2str(i-1),'Interpreter','LaTex','FontSize',14,'Color','black');
end

print(strcat('./', system, method), '-dpng')