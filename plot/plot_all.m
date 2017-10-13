close all;

ha = tight_subplot(2,3,[0.040, 0.050],[0.10, 0.03],[0.075 0.07]);
axes(ha(1));
surf(Xe,Ye,VE(:,:,1));
view( 0,90);
set_range
xlabel('','Interpreter','LaTex')
set(gca,'XTickLabel',[]);
ylabel('$\mathbf{\phi}$','Interpreter','LaTex')
set(gca,'YTickLabel',['-180';'   0';' 180']);
set(gca,'FontSize',24)
caxis([0 12]);
shading interp;
colormap jet(18);
t=text(20,20,10,'1a','Interpreter','LaTex');
t.FontSize=30;
%-------------------------------------------
labels=LB(:,:,1);
hold on
plot3(labels(:,1)', labels(:,2)', ones(size(labels(:,1)))'*10, '*w', 'LineWidth', 1.5);

%{
for i=1:length(labels)
    t = text(labels(i,1),labels(i,2),10,num2str(i-1),'Interpreter','LaTex');
    t.FontSize = 11;
end
%}
%-------------------------------------------



axes(ha(2));
surf(Xe,Ye,VE(:,:,2));
view( 0,90);
set_range
set(gca,'XTickLabel',[]);
set(gca,'YTickLabel',[]);
xlabel('','Interpreter','LaTex')
ylabel('','Interpreter','LaTex')
set(gca,'FontSize',24)
caxis([0 12]);
shading interp;
colormap jet(18);
t=text(20,20,10,'1b','Interpreter','LaTex');
t.FontSize=30;
%-------------------------------------------
labels=LB(:,:,2);
hold on
plot3(labels(:,1)', labels(:,2)', ones(size(labels(:,1)))'*10, '*w', 'LineWidth', 1.5);

%{
for i=1:length(labels)
    t = text(labels(i,1),labels(i,2),10,num2str(i-1),'Interpreter','LaTex');
    t.FontSize = 11;
end
%}
%-------------------------------------------



axes(ha(3));
surf(Xe,Ye,VE(:,:,3));
view( 0,90);
set_range
set(gca,'XTickLabel',[]);
set(gca,'YTickLabel',[]);
xlabel('','Interpreter','LaTex')
ylabel('','Interpreter','LaTex')
set(gca,'FontSize',24)
caxis([0 12]);
shading interp;
colormap jet(18);
t=text(20,20,10,'1c','Interpreter','LaTex');
t.FontSize=30;
%-------------------------------------------
labels=LB(:,:,3);
hold on
plot3(labels(:,1)', labels(:,2)', ones(size(labels(:,1)))'*10, '*w', 'LineWidth', 1.5);

%{
for i=1:length(labels)
    t = text(labels(i,1),labels(i,2),10,num2str(i-1),'Interpreter','LaTex');
    t.FontSize = 11;
end
%}
%-------------------------------------------



axes(ha(4));
surf(Xe,Ye,VE(:,:,4));
view( 0,90);
set_range
set(gca,'XTickLabel',['-180';'   0';' 180']);
set(gca,'YTickLabel',['-180';'   0';' 180']);
xlabel('$\mathbf{\theta}$','Interpreter','LaTex')
ylabel('$\mathbf{\phi}$','Interpreter','LaTex')
set(gca,'FontSize',24)
caxis([0 12]);
shading interp;
colormap jet(18);
t=text(20,20,10,'1d','Interpreter','LaTex');
t.FontSize=30;
%-------------------------------------------
labels=LB(:,:,4);
hold on
plot3(labels(:,1)', labels(:,2)', ones(size(labels(:,1)))'*10, '*w', 'LineWidth', 1.5);

%{
for i=1:length(labels)
    t = text(labels(i,1),labels(i,2),10,num2str(i-1),'Interpreter','LaTex');
    t.FontSize = 11;
end
%}
%-------------------------------------------



axes(ha(5));
surf(Xe,Ye,VE(:,:,5));
view( 0,90);
set_range
set(gca,'XTickLabel',['-180';'   0';' 180']);
xlabel('$\mathbf{\theta}$','Interpreter','LaTex')
set(gca,'YTickLabel',[]);
ylabel('','Interpreter','LaTex')

set(gca,'FontSize',24)
caxis([0 12]);
shading interp;
colormap jet(18);
t=text(20,20,10,'1e','Interpreter','LaTex');
t.FontSize=30;
%-------------------------------------------
labels=LB(:,:,5);
hold on
plot3(labels(:,1)', labels(:,2)', ones(size(labels(:,1)))'*10, '*w', 'LineWidth', 1.5);

%{
for i=1:length(labels)
    t = text(labels(i,1),labels(i,2),10,num2str(i-1),'Interpreter','LaTex');
    t.FontSize = 11;
end
%}
%-------------------------------------------



axes(ha(6));
surf(Xe,Ye,VE(:,:,6));
view( 0,90);
set_range
set(gca,'XTickLabel',['-180';'   0';' 180']);
xlabel('$\mathbf{\theta}$','Interpreter','LaTex')
set(gca,'YTickLabel',[]);
ylabel('','Interpreter','LaTex')
set(gca,'FontSize',24)
caxis([0 12]);
shading interp;
colormap jet(18);
t=text(20,20,10,'1f','Interpreter','LaTex');
t.FontSize=30;
%-------------------------------------------
labels=LB(:,:,6);
hold on
plot3(labels(:,1)', labels(:,2)', ones(size(labels(:,1)))'*10, '*w', 'LineWidth', 1.5);

%{
for i=1:length(labels)
    t = text(labels(i,1),labels(i,2),10,num2str(i-1),'Interpreter','LaTex');
    t.FontSize = 11;
end
%}
%-------------------------------------------


hc = axes('Units','normalized', 'Position', [0.12, 0.00, 0.5, 0.18], 'XTickLabel', '', 'YTickLabel', '');
axis off;
colormap jet(18);
caxis([0 12]);
h = colorbar('Position',[0.95, 0.10, 0.015, 0.87], 'location', 'Eastoutside');
ylabel(h,'kcal/mol');
h.Label.Position = [2.0, 6.0, 0.0];
set(h,'YTick',[0,4,8,12]);
set(gca,'FontSize',24)

set(gcf, 'Position', [0, 0, 1600, 2000]);

print('~/1a-1f', '-dpng', '-r300');