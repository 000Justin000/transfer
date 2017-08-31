close all;

ha = tight_subplot(2,3,[0.05, 0.05],[0.20, 0.03],[0.07 0.03]);
axes(ha(1));
surf(Xe,Ye,VE(:,:,1));
view(90,90);
set(gca,'xlim',[0 360]);
set(gca,'ylim',[0 360]);
set(gca,'XTick',[0:180:360]);
set(gca,'YTick',[0:180:360]);
set(gca,'XTickLabel',['  0';'180';'360']);
set(gca,'YTickLabel',[]);
xlabel('$\mathbf{\theta}$','Interpreter','LaTex')
ylabel('','Interpreter','LaTex')
set(gca,'FontSize',18)
caxis([0 12]);
shading interp;
colormap jet;
t=text(20,20,10,'1a','Interpreter','LaTex');
t.FontSize=25;


axes(ha(2));
surf(Xe,Ye,VE(:,:,2));
view(90,90);
set(gca,'xlim',[0 360]);
set(gca,'ylim',[0 360]);
set(gca,'XTick',[0:180:360]);
set(gca,'YTick',[0:180:360]);
set(gca,'XTickLabel',[]);
set(gca,'YTickLabel',[]);
xlabel('','Interpreter','LaTex')
ylabel('','Interpreter','LaTex')
set(gca,'FontSize',18)
caxis([0 12]);
shading interp;
colormap jet;
t=text(20,20,10,'1b','Interpreter','LaTex');
t.FontSize=25;


axes(ha(3));
surf(Xe,Ye,VE(:,:,3));
view(90,90);
set(gca,'xlim',[0 360]);
set(gca,'ylim',[0 360]);
set(gca,'XTick',[0:180:360]);
set(gca,'YTick',[0:180:360]);
set(gca,'XTickLabel',[]);
set(gca,'YTickLabel',[]);
xlabel('','Interpreter','LaTex')
ylabel('','Interpreter','LaTex')
set(gca,'FontSize',18)
caxis([0 12]);
shading interp;
colormap jet;
t=text(20,20,10,'1c','Interpreter','LaTex');
t.FontSize=25;


axes(ha(4));
surf(Xe,Ye,VE(:,:,4));
view(90,90);
set(gca,'xlim',[0 360]);
set(gca,'ylim',[0 360]);
set(gca,'XTick',[0:180:360]);
set(gca,'YTick',[0:180:360]);
set(gca,'XTickLabel',['  0';'180';'360']);
set(gca,'YTickLabel',['  0';'180';'360']);
xlabel('$\mathbf{\theta}$','Interpreter','LaTex')
ylabel('$\mathbf{\phi}$','Interpreter','LaTex')
set(gca,'FontSize',18)
caxis([0 12]);
shading interp;
colormap jet;
t=text(20,20,10,'1d','Interpreter','LaTex');
t.FontSize=25;


axes(ha(5));
surf(Xe,Ye,VE(:,:,5));
view(90,90);
set(gca,'xlim',[0 360]);
set(gca,'ylim',[0 360]);
set(gca,'XTick',[0:180:360]);
set(gca,'YTick',[0:180:360]);
set(gca,'XTickLabel',[]);
set(gca,'YTickLabel',['  0';'180';'360']);
xlabel('','Interpreter','LaTex')
ylabel('$\mathbf{\phi}$','Interpreter','LaTex')
set(gca,'FontSize',18)
caxis([0 12]);
shading interp;
colormap jet;
t=text(20,20,10,'1e','Interpreter','LaTex');
t.FontSize=25;


axes(ha(6));
surf(Xe,Ye,VE(:,:,6));
view(90,90);
set(gca,'xlim',[0 360]);
set(gca,'ylim',[0 360]);
set(gca,'XTick',[0:180:360]);
set(gca,'YTick',[0:180:360]);
set(gca,'XTickLabel',[]);
set(gca,'YTickLabel',['  0';'180';'360']);
xlabel('','Interpreter','LaTex')
ylabel('$\mathbf{\phi}$','Interpreter','LaTex')
set(gca,'FontSize',18)
caxis([0 12]);
shading interp;
colormap jet;
t=text(20,20,10,'1f','Interpreter','LaTex');
t.FontSize=25;


hc = axes('Units','normalized', 'Position', [0.12, 0.00, 0.5, 0.18], 'XTickLabel', '', 'YTickLabel', '');
axis off;
colormap jet;
caxis([0 12]);
h = colorbar('Position',[0.07, 0.07, 0.90  0.03],'location','Southoutside');
ylabel(h,'kcal/mol');
set(h,'YTick',[0,4,8,12]);
set(gca,'FontSize',18)

set(gcf, 'Position', [0, 0, 1300, 2000]);

print('1a-1f', '-dpng', '-r300');