systems = ["1001", "1101", "1111", "10n01", "11n01", "11n11"];
Ts = [300, 300, 300, 300, 300, 300]/3.16e5;

Bs=zeros(5184,5184,length(systems));

for id=1:length(systems)
    system = systems(id);
    transport;
    Bs(:,:,id)=B;
end

T = 373.15;

for id=1:length(systems)
    display((1/(n^2)^2)*sum(sum(exp(-Bs(:,:,id)/(T/3.16e5)))));
end

for id=1:length(systems)
    PT = sum(sum(exp(-Bs(:,:,id)/(T/3.16e5))));
    Q  = sum(exp(-diag(Bs(:,:,id))/(T/3.16e5)));
    
    F = PT / Q;
    
    F_free = ((n^4)/(n^2));
    
    display(F/F_free);
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