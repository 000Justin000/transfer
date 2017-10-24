close all;

% namelist = ['1a'; '1b'; '1c'; '1d'; '1e'; '1f'];
namelist = ["1g"; "1h"; "1i"; "1j"; "1k"; "1l"];

set(0,'DefaultTextInterpreter', 'latex')
ha = tight_subplot(2,3,[0.040, 0.040],[0.10, 0.03],[0.065 0.07]);
axes(ha(1));
surf(Xe,Ye,VE(:,:,1));
view( 0,90);
set_range
xlabel('','Interpreter','LaTex');
set(gca,'XTickLabel',[]);
hy = ylabel('$\mathbf{\phi}$','Interpreter','LaTex'); hy.Position = hy.Position + [50, 0, 0];
set(gca,'YTickLabel',['-180^{\circ}';'   0^{\circ}';' 180^{\circ}']);
set(gca,'FontSize',24)
caxis([0 12]);
shading interp;
colormap jet(18);
t=text(140,160,10,namelist(1),'Interpreter','LaTex');
t.FontSize=32;
%-------------------------------------------
labels=LB(:,:,1);
hold on
plot3(labels(:,1)', labels(:,2)', ones(size(labels(:,1)))'*10, ':*w', 'LineWidth', 1.5);

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
t=text(140,160,10,namelist(2),'Interpreter','LaTex');
t.FontSize=32;
%-------------------------------------------
labels=LB(:,:,2);
hold on
plot3(labels(:,1)', labels(:,2)', ones(size(labels(:,1)))'*10, ':*w', 'LineWidth', 1.5);

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
t=text(140,160,10,namelist(3),'Interpreter','LaTex');
t.FontSize=32;
%-------------------------------------------
labels=LB(:,:,3);
hold on
plot3(labels(:,1)', labels(:,2)', ones(size(labels(:,1)))'*10, ':*w', 'LineWidth', 1.5);

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
set(gca,'XTickLabel',['-180^{\circ}';'   0^{\circ}';' 180^{\circ}']);
set(gca,'YTickLabel',['-180^{\circ}';'   0^{\circ}';' 180^{\circ}']);
hx = xlabel('$\mathbf{\theta}$','Interpreter','LaTex');  hx.Position = hx.Position + [6, 0, 0];
hy = ylabel('$\mathbf{\phi}$','Interpreter','LaTex');    hy.Position = hy.Position + [65, 0, 0];
set(gca,'FontSize',24)
caxis([0 12]);
shading interp;
colormap jet(18);
t=text(140,160,10,namelist(4),'Interpreter','LaTex');
t.FontSize=32;
%-------------------------------------------
labels=LB(:,:,4);
hold on
plot3(labels(:,1)', labels(:,2)', ones(size(labels(:,1)))'*10, ':*w', 'LineWidth', 1.5);

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
set(gca,'XTickLabel',['-180^{\circ}';'   0^{\circ}';' 180^{\circ}']);
hx = xlabel('$\mathbf{\theta}$','Interpreter','LaTex');  hx.Position = hx.Position + [5, 0, 0];
set(gca,'YTickLabel',[]);
ylabel('','Interpreter','LaTex')

set(gca,'FontSize',24)
caxis([0 12]);
shading interp;
colormap jet(18);
t=text(140,160,10,namelist(5),'Interpreter','LaTex');
t.FontSize=32;
%-------------------------------------------
labels=LB(:,:,5);
hold on
plot3(labels(:,1)', labels(:,2)', ones(size(labels(:,1)))'*10, ':*w', 'LineWidth', 1.5);

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
set(gca,'XTickLabel',['-180^{\circ}';'   0^{\circ}';' 180^{\circ}']);
h = xlabel('$\mathbf{\theta}$','Interpreter','LaTex');  h.Position = h.Position + [6, 0, 0];
set(gca,'YTickLabel',[]);
ylabel('','Interpreter','LaTex')
set(gca,'FontSize',24)
caxis([0 12]);
shading interp;
colormap jet(18);
t=text(140,160,10,namelist(6),'Interpreter','LaTex');
t.FontSize=32;
%-------------------------------------------
labels=LB(:,:,6);
hold on
plot3(labels(:,1)', labels(:,2)', ones(size(labels(:,1)))'*10, ':*w', 'LineWidth', 1.5);

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

print('~/1g-1l', '-dpng', '-r300');