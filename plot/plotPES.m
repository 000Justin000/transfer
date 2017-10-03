close all;

n = 36;

% system = '11n11';
method = '_B3LYP';
showpath = true;

labels = [];
shift = [];

if (strcmp(method, '_B3LYP'))
    A = dlmread(strcat('../qchem_scan_', system, method, '_d3_6-31G*/energies'));
    if (showpath==true)
        switch system
            case '1001'
                % labels = [[56.8, 52.4]; [  61.6, -162.3]; [  96.4,  146.0]; [  56.1,   50.2]; [-170.0,   83.9]; [-126.5,   55.4];];
                labels = [[56.8, 52.4]; [  61.6, -162.3]; [ 162.1,  -61.2];];
                disp = [10,24];
                labels = pdd(labels - [56.8, 52.4] - 360/n*disp, -180, 180);
            case '1101'
                % labels = [[59.9,-148.6]; [  61.3, -147.9]; [ 127.7,  160.3]; [  56.8,   47.0]; [ 143.5,   97.9]; [-125.6,   51.2]; [-172.4,  -84.4]; [-115.6, -145.8];];                
                labels = [[59.9,-148.6]; [  61.3, -147.9]; [ 164.0, -56.5];];
                disp = [10,9];
                labels = pdd(labels - [59.9,-148.6] - 360/n*disp, -180, 180);
            case '1111'
                % labels = [[147.1, -60.4]; [  64.6, -147.3]; [ 127.1,  164.8]; [  56.3,   44.8]; [ -144.1,  47.2]; [ -102.5,  54.7];];
                labels = [[147.1, -60.4]; [  64.6, -147.3]; [146.6, -60.2]];
                disp = [0,0];                
                labels = pdd(labels - [147.1, -60.4] - 360/n*disp, -180, 180);
            case '10n01'
                labels=[[-39.1, -38.4]; [  50, -160]; [155.5, -48.6]];
                disp = [20,0];
                labels = pdd(labels - [-39.1, -38.4] - 360/n*disp, -180, 180);
            case '11n01'
                labels=[[-163.6,  67.3]; [ 60, -155]; [165.5, -66.7];]; % bad up-up, wanted up-up, up-down
                disp = [-3,23];
                labels = pdd(labels - [-163.6,  67.3] - 360/n*disp, -180, 180);
            case '11n11'
                labels=[[  45.2,  47.2]; [ 44.8, -127.2]; [137.1, -51.9]];
                disp = [10,-10];
                labels = pdd(labels - [  45.2,  47.2] - 360/n*disp, -180, 180);
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

if (strcmp(system, '10n01') || strcmp(system, '11n01') || strcmp(system, '11n11'))
    P = P';
end

X = X-pi; Y=Y-pi;
xs = disp(1); ys = disp(2);
X = pshiftm(X, xs, ys); X = X-(2*pi)/n*xs; X = pdd(X,-pi-0.001, pi-0.001);
Y = pshiftm(Y, xs, ys); Y = Y-(2*pi)/n*ys; Y = pdd(Y,-pi-0.001, pi-0.001);
P = pshiftm(P, xs-n/2, ys-n/2);

P = (P-min(min(P)))*627.509;

[Xe,Ye,Ve] = meshBoard(X,Y,P);

Xe = Xe/(2*pi)*360;
Ye = Ye/(2*pi)*360;

figure;
surf(Xe,Ye,Ve);
view( 0,90);
set_range

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

colormap jet(24);

hold on;

for i=1:length(labels)
    text(labels(i,1),labels(i,2),10,num2str(i-1),'Interpreter','LaTex');
end

print(strcat('./', system, method), '-dpng')