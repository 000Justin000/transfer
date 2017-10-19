systems = ["1001", "1101", "1111", "10n01", "11n01", "11n11"];
Ts = [375, 394, 369, 338, 367, 361]/3.16e5;

Bs=zeros(1296,1296,length(systems));

for id=1:length(systems)
    system = systems(id);
    transport;
    Bs(:,:,id)=B;
end

for id=1:length(systems)
    display((1/(n^2)^2)*sum(sum(exp(-Bs(:,:,id)/(300/3.16e5)))));
end

%{
[Xe,Ye,Ve] = meshBoard(X,Y,reshape(Bs(1,:,2),[n,n]));
surf(Xe/(2*pi)*360,Ye/(2*pi)*360,Ve*627.509);
view(0,90);
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
h = colorbar;
ylabel(h,'kcal/mol')
set(h,'YTick',[0,4,8,12]);
caxis([0 12]);
%}

close all;