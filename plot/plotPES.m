close all;

n = 72;

% system = '1111';
geoms  = 'connect';
showpath = true;

labels = [];

A = dlmread(strcat('../qchem_scan_', system, '_B3LYP', '_d3_op_6-311++G**/energies'));

if (showpath==true)
    if (strcmp(geoms, 'critical'))
        switch system
            case '1001'  %[124.4, -22.8]
                labels = [[0,0]; [ 35, -80]; [100, -105]; [145, -150]; [175, 155]; [-145, 125]; [-100,   90]; [-45, 60]; [-30, -75]; [-30,110]; [140,115]];
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
                labels = [[   0,   0]; [  40,  -40]; [90,-75]; [125, -120]; [165,-170]; [-140, 155]; [-80, 110]; [ -40, 60]];
            case '1301'  %[ 121.9, -19.9]
                labels = [[   0,   0]; [  40,  -75]; [100, -110]; [145, -70]; [105, 75]; [145, 125]; [165, 155]; [-145, 135]; ...
                          [ -30, 35]; [ -55, 85]; [ -30, 125]; [  -5, 160]; [ -25, -155]; [-65, -105]; [-30, -60]; [-155, -60]];
            case '1331'  %[ 110.9, -65.2]
                labels = [[   0,   0]; [  60, -30]; [ 115, -55]; [ 150,-120]; [ 150, 160]; [ -50,145]; [ -30, 80]; [ -20, 165]; [-25,-25]; [120,135]; [125, 75]];
            case '10d01' %[ 119.1, -28.1]
                labels = [[   0,   0]; [ 45, -70]; [ 95, -95]; [150, -145]; [-180, 165]; [-145, 130]; [-90, 95]; [-55, 75]; [-25, -70]; [-30,115]; [145,120]];
            case '11d01' %[ 119.1, -28.1]
                labels = [[   0,   0]; [ 35, -40]; [ 60, -55]; [135, -105]; [-145, 150]; [-60, 105]; [-45, -45]; [-40,140]; ...
                          [ 130, 155]; [125,85]; [130,-35]; [60,130]; [35,145]; [-10,-170]; [-40,-95]; [-150, -40]];
            case '11d11' %[ 120.2, -13.4]
                labels = [[0,0]; [ 40, -90]; [100, -115]; [150, -150]; [-180, 145]; [-150, 115]; [-20, -90]; [-20,95]; [145,100]];
        end
    elseif (strcmp(geoms, 'connect'))
        switch system
            case '1001'
                origin = [124.4, -22.8];
                path_line = dlmread(strcat('path_', system));
                labels = [[  0,  0]; [ 35, -75]; [100, -105]; [145, -150]; [175, 155]; [-145, 120]; [-95, 90]; [-55, 65]; path_line];                
            case '1101'
                origin = [126.0, -21.3];
                path_line = dlmread(strcat('path_', system));
                labels = [[  0,  0]; [ 40, -60]; [ 95, -105]; [140, -170]; [160, 155]; [-155, 160]; [-90, 90]; [-30,25]; path_line];
            case '1111'
                origin = [122.8, -38.4];
                path_line = dlmread(strcat('path_', system));
                labels = [[  0,  0]; [ 60, -35]; [ 95,  -90]; [125, -155]; [165, 175]; [-145, 170]; [-85, 120]; [-60, 50]; path_line];
            case '10n01'
                origin = [129.8, -25.0];
                path_line = dlmread(strcat('path_', system));                
                labels = [[  0,  0]; [ 45, -65]; [ 90, -120]; [140, -165]; [-160, 155]; [-115,100]; [-95, 70]; [-60, 45]; path_line];
            case '11n01'
                origin = [106.2,  -7.2];
                path_line = dlmread(strcat('path_', system));                
                labels = [[  0,  0]; [ 70, -90]; [130, -145]; [-175, 160]; [-140, 130]; [-105, 105]; [-65, 65]; [35, -45]; path_line];
            case '11n11'
                origin = [135.7, -58.7];
                path_line = dlmread(strcat('path_', system));
                labels = [[  0,  0]; [ 45, -40]; [ 90,  -75]; [125, -120]; [165, -165]; [-140, 160]; [-75, 110]; [-35, 55]; path_line];
            case '1301'
                labels = [[  0,  0]; [ 35, -80]; [100, -105]];
            case '1331'
                labels = [[  0,  0]; [ 60, -30]; [115, -55]];
            case '10d01'
                labels = [[  0,  0]; [ 45, -70]; [100, -95]];
            case '11d01'
                labels = [[  0,  0]; [ 30, -35]; [ 60, -55]];
            case '11d11'
                labels = [[  0,  0]; [ 40, -90]; [100, -115]];                
        end
    end
end

labels(end+1,:) = -origin;
labels = pdd(labels + origin, 0, 360);
    
X = reshape(A(:,1), [n,n])';
Y = reshape(A(:,2), [n,n])';
P = reshape(A(:,3), [n,n])';

P = (P-min(min(P)))*627.509;

%%{
Pf = P;

[Yf,Xf] = meshgrid(0:5:355, 0:5:355);
Pf = pshiftm(Pf, floor(-origin(1)/5)+180, floor(-origin(2)/5)+180);

labels = labels + (-origin - floor(-origin/5)*5);
%}

[Xe,Ye,Ve] = meshBoard(Xf,Yf,Pf);


% [Ye,Xe] = deal(Xe,Ye); % swap

figure;
% contourf(X,Y,P, [0 0.2 0.5 1.0 2.0 3.0 5.0 7.0 9.0], 'ShowText','on'); colormap jet(10);
surf(Xe,Ye,Ve);
view( 0,90);
set_range
xlabel('$\mathbf{\theta}$','Interpreter','LaTex')
ylabel('$\mathbf{\phi}$','Interpreter','LaTex')
set(gca,'FontSize',30)
set(gcf, 'Position', [0, 0, 1000, 850]);
h = colorbar;
ylabel(h,'kcal/mol','Interpreter','tex', 'FontName', 'Helvetica')
set(h,'YTick',[0,4,8,12]);
caxis([0 12]);
shading interp;

colormap jet(24);

hold on;

% scatter3(labels(:,1)', labels(:,2)', ones(1,size(labels,1))*30, 3, 'wo', 'LineWidth', 1.5);

%{
for i=1:8
    text(labels(i,1),labels(i,2),30,num2str(i-1),'Interpreter','LaTex','FontSize',14,'Color','black');
end
%}

print(strcat('./', system, '_B3LYP'), '-dpng')
