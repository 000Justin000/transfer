close all;

namelist = ["2a"; "2b"; "2c"; "2d"; "2e"; "2f"];
% namelist = ["1g"; "1h"; "1i"; "1j"; "1k"; "1l"];

lb = [1,2,3,4,5,6,6,6,6];
keyx = [90,90,180,270,270,3,3,357,357];
keyy = [90,270,180,90,270,3,357,3,357];

set(0,'DefaultTextInterpreter', 'tex')

ha = tight_subplot(2,3,[0.040, 0.040],[0.10, 0.03],[0.075 0.09]);
axes(ha(1));
surf(Xe,Ye,VE(:,:,1));
view( 0,90);
set_range
xlabel('','Interpreter','LaTex');
set(gca,'XTickLabel',[]);
hy = ylabel('\fontsize{29}\bf{\phi} \fontsize{25}\rm{(degrees)}','Interpreter','tex','FontName','Helvetica'); % hy.Position = hy.Position + [50, 0, 0];
set(gca,'YTickLabel',['  0';'180';'360']);
set(gca,'FontSize',24)
caxis([0 12]);
shading interp;
colormap jet(18);
textborder(310,330,30,namelist(1),'w','k', 0.5, 'Interpreter','tex', 'FontSize', 32);
%-------------------------------------------
labels=LB(:,:,1);
hold on
% plot3(labels(:,1)', labels(:,2)', ones(size(labels(:,1)))'*10, ':w', 'LineWidth', 1.5, 'MarkerSize', 7);
plot3(0:360, ones(1,361)* 90+labels(end,2), ones(1,361)'*15, '--w', 'LineWidth', 0.8, 'MarkerSize', 7);
plot3(0:360, ones(1,361)*180+labels(end,2), ones(1,361)'*15, '-w', 'LineWidth', 1.25, 'MarkerSize', 7);
plot3(0:360, ones(1,361)*270+labels(end,2), ones(1,361)'*15, '--w', 'LineWidth', 0.8, 'MarkerSize', 7);
plot3(ones(1,361)* 90+labels(end,1), 0:360, ones(1,361)'*15, '--w', 'LineWidth', 0.8, 'MarkerSize', 7);
plot3(ones(1,361)*180+labels(end,1), 0:360, ones(1,361)'*15, '-w', 'LineWidth', 1.25, 'MarkerSize', 7);
plot3(ones(1,361)*270+labels(end,1), 0:360, ones(1,361)'*15, '--w', 'LineWidth', 0.8, 'MarkerSize', 7);
scatter3(labels(1,1),labels(1,2),20, 180, 'o', 'MarkerEdgeColor','k', 'MarkerFaceColor','y', 'LineWidth', 1.2);
scatter3(labels(2,1),labels(2,2),20, 140, '^', 'MarkerEdgeColor','k', 'MarkerFaceColor','y', 'LineWidth', 1.2);
scatter3(labels(3,1),labels(3,2),20, 380, 'p', 'MarkerEdgeColor','k', 'MarkerFaceColor','y', 'LineWidth', 1.0);

for i=1:5
    scatter3(keyx(i)+labels(end,1), keyy(i)+labels(end,2), 20, 350, 'o', 'MarkerEdgeColor','k', 'MarkerFaceColor',[1.0 1.0 1.0], 'LineWidth', 1.5);
end
for i=6:9
    scatter3(keyx(i), keyy(i), 20, 350, 'o', 'MarkerEdgeColor','k', 'MarkerFaceColor',[1.0 1.0 1.0], 'LineWidth', 1.5);
end

for i=1:5
    t = text(keyx(i)+labels(end,1)-7,keyy(i)+labels(end,2)-2,21, strcat("\textbf{",num2str(lb(i)),"}"),'Interpreter','LaTex');
    t.FontSize = 21;
end
for i=6:9
    t = text(keyx(i)-7,keyy(i)-2,21, strcat("\textbf{",num2str(lb(i)),"}"),'Interpreter','LaTex');
    t.FontSize = 21;
end
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
textborder(310,330,30,namelist(2),'w','k', 0.5, 'Interpreter','tex', 'FontSize', 32);
%-------------------------------------------
labels=LB(:,:,2);
hold on
% plot3(labels(:,1)', labels(:,2)', ones(size(labels(:,1)))'*10, ':w', 'LineWidth', 1.5, 'MarkerSize', 7);
plot3(0:360, ones(1,361)* 90+labels(end,2), ones(1,361)'*15, '--w', 'LineWidth', 0.8, 'MarkerSize', 7);
plot3(0:360, ones(1,361)*180+labels(end,2), ones(1,361)'*15, '-w', 'LineWidth', 1.25, 'MarkerSize', 7);
plot3(0:360, ones(1,361)*270+labels(end,2), ones(1,361)'*15, '--w', 'LineWidth', 0.8, 'MarkerSize', 7);
plot3(ones(1,361)* 90+labels(end,1), 0:360, ones(1,361)'*15, '--w', 'LineWidth', 0.8, 'MarkerSize', 7);
plot3(ones(1,361)*180+labels(end,1), 0:360, ones(1,361)'*15, '-w', 'LineWidth', 1.25, 'MarkerSize', 7);
plot3(ones(1,361)*270+labels(end,1), 0:360, ones(1,361)'*15, '--w', 'LineWidth', 0.8, 'MarkerSize', 7);
scatter3(labels(1,1),labels(1,2),20, 180, 'o', 'MarkerEdgeColor','k', 'MarkerFaceColor','y', 'LineWidth', 1.2);
scatter3(labels(2,1),labels(2,2),20, 140, '^', 'MarkerEdgeColor','k', 'MarkerFaceColor','y', 'LineWidth', 1.2);
scatter3(labels(3,1),labels(3,2),20, 380, 'p', 'MarkerEdgeColor','k', 'MarkerFaceColor','y', 'LineWidth', 1.0);

for i=1:5
    scatter3(keyx(i)+labels(end,1), keyy(i)+labels(end,2), 20, 350, 'o', 'MarkerEdgeColor','k', 'MarkerFaceColor',[1.0 1.0 1.0], 'LineWidth', 1.5);
end
for i=6:9
    scatter3(keyx(i), keyy(i), 20, 350, 'o', 'MarkerEdgeColor','k', 'MarkerFaceColor',[1.0 1.0 1.0], 'LineWidth', 1.5);
end

for i=1:5
    t = text(keyx(i)+labels(end,1)-7,keyy(i)+labels(end,2)-2,21, strcat("\textbf{",num2str(lb(i)),"}"),'Interpreter','LaTex');
    t.FontSize = 21;
end
for i=6:9
    t = text(keyx(i)-7,keyy(i)-2,21, strcat("\textbf{",num2str(lb(i)),"}"),'Interpreter','LaTex');
    t.FontSize = 21;
end
%-------------------------------------------



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
textborder(310,330,30,namelist(3),'w','k', 0.5, 'Interpreter','tex', 'FontSize', 32);
%-------------------------------------------
labels=LB(:,:,3);
hold on
% plot3(labels(:,1)', labels(:,2)', ones(size(labels(:,1)))'*10, ':w', 'LineWidth', 1.5, 'MarkerSize', 7);
plot3(0:360, ones(1,361)* 90+labels(end,2), ones(1,361)'*15, '--w', 'LineWidth', 0.8, 'MarkerSize', 7);
plot3(0:360, ones(1,361)*180+labels(end,2), ones(1,361)'*15, '-w', 'LineWidth', 1.25, 'MarkerSize', 7);
plot3(0:360, ones(1,361)*270+labels(end,2), ones(1,361)'*15, '--w', 'LineWidth', 0.8, 'MarkerSize', 7);
plot3(ones(1,361)* 90+labels(end,1), 0:360, ones(1,361)'*15, '--w', 'LineWidth', 0.8, 'MarkerSize', 7);
plot3(ones(1,361)*180+labels(end,1), 0:360, ones(1,361)'*15, '-w', 'LineWidth', 1.25, 'MarkerSize', 7);
plot3(ones(1,361)*270+labels(end,1), 0:360, ones(1,361)'*15, '--w', 'LineWidth', 0.8, 'MarkerSize', 7);
scatter3(labels(1,1),labels(1,2),20, 180, 'o', 'MarkerEdgeColor','k', 'MarkerFaceColor','y', 'LineWidth', 1.2);
scatter3(labels(2,1),labels(2,2),20, 140, '^', 'MarkerEdgeColor','k', 'MarkerFaceColor','y', 'LineWidth', 1.2);
scatter3(labels(3,1),labels(3,2),20, 380, 'p', 'MarkerEdgeColor','k', 'MarkerFaceColor','y', 'LineWidth', 1.0);

for i=1:5
    scatter3(keyx(i)+labels(end,1), keyy(i)+labels(end,2), 20, 350, 'o', 'MarkerEdgeColor','k', 'MarkerFaceColor',[1.0 1.0 1.0], 'LineWidth', 1.5);
end
for i=6:9
    scatter3(keyx(i), keyy(i), 20, 350, 'o', 'MarkerEdgeColor','k', 'MarkerFaceColor',[1.0 1.0 1.0], 'LineWidth', 1.5);
end

for i=1:5
    t = text(keyx(i)+labels(end,1)-7,keyy(i)+labels(end,2)-2,21, strcat("\textbf{",num2str(lb(i)),"}"),'Interpreter','LaTex');
    t.FontSize = 21;
end
for i=6:9
    t = text(keyx(i)-7,keyy(i)-2,21, strcat("\textbf{",num2str(lb(i)),"}"),'Interpreter','LaTex');
    t.FontSize = 21;
end
%-------------------------------------------



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
set(gca,'XTickLabel',['  0';'180';'360']);
set(gca,'YTickLabel',['  0';'180';'360']);
hx = xlabel('\fontsize{29}\bf{\theta} \fontsize{25}\rm{(degrees)}','Interpreter','tex','FontName','Helvetica');  hx.Position = hx.Position + [5, 5, 0];
hy = ylabel('\fontsize{29}\bf{\phi} \fontsize{25}\rm{(degrees)}','Interpreter','tex','FontName','Helvetica');    % hy.Position = hy.Position + [65, 0, 0];
set(gca,'FontSize',24)
caxis([0 12]);
shading interp;
colormap jet(18);
textborder(310,330,30,namelist(4),'w','k', 0.5, 'Interpreter','tex', 'FontSize', 32);
%-------------------------------------------
labels=LB(:,:,4);
hold on
plot3(0:360, ones(1,361)* 90+labels(end,2), ones(1,361)'*15, '--w', 'LineWidth', 0.8, 'MarkerSize', 7);
plot3(0:360, ones(1,361)*180+labels(end,2), ones(1,361)'*15, '-w', 'LineWidth', 1.25, 'MarkerSize', 7);
plot3(0:360, ones(1,361)*270+labels(end,2), ones(1,361)'*15, '--w', 'LineWidth', 0.8, 'MarkerSize', 7);
plot3(ones(1,361)* 90+labels(end,1), 0:360, ones(1,361)'*15, '--w', 'LineWidth', 0.8, 'MarkerSize', 7);
plot3(ones(1,361)*180+labels(end,1), 0:360, ones(1,361)'*15, '-w', 'LineWidth', 1.25, 'MarkerSize', 7);
plot3(ones(1,361)*270+labels(end,1), 0:360, ones(1,361)'*15, '--w', 'LineWidth', 0.8, 'MarkerSize', 7);
scatter3(labels(1,1),labels(1,2),20, 180, 'o', 'MarkerEdgeColor','k', 'MarkerFaceColor','y', 'LineWidth', 1.2);
scatter3(labels(2,1),labels(2,2),20, 140, '^', 'MarkerEdgeColor','k', 'MarkerFaceColor','y', 'LineWidth', 1.2);
scatter3(labels(3,1),labels(3,2),20, 380, 'p', 'MarkerEdgeColor','k', 'MarkerFaceColor','y', 'LineWidth', 1.0);

for i=1:5
    scatter3(keyx(i)+labels(end,1), keyy(i)+labels(end,2), 20, 350, 'o', 'MarkerEdgeColor','k', 'MarkerFaceColor',[1.0 1.0 1.0], 'LineWidth', 1.5);
end
for i=6:9
    scatter3(keyx(i), keyy(i), 20, 350, 'o', 'MarkerEdgeColor','k', 'MarkerFaceColor',[1.0 1.0 1.0], 'LineWidth', 1.5);
end

for i=1:5
    t = text(keyx(i)+labels(end,1)-7,keyy(i)+labels(end,2)-2,21, strcat("\textbf{",num2str(lb(i)),"}"),'Interpreter','LaTex');
    t.FontSize = 21;
end
for i=6:9
    t = text(keyx(i)-7,keyy(i)-2,21, strcat("\textbf{",num2str(lb(i)),"}"),'Interpreter','LaTex');
    t.FontSize = 21;
end
%-------------------------------------------



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
set(gca,'XTickLabel',['  0';'180';'360']);
hx = xlabel('\fontsize{29}\bf{\theta} \fontsize{25}\rm{(degrees)}','Interpreter','tex','FontName','Helvetica');  hx.Position = hx.Position + [5, 5, 0];
set(gca,'YTickLabel',[]);
ylabel('','Interpreter','LaTex')

set(gca,'FontSize',24)
caxis([0 12]);
shading interp;
colormap jet(18);
textborder(310,330,30,namelist(5),'w','k', 0.5, 'Interpreter','tex', 'FontSize', 32);
%-------------------------------------------
labels=LB(:,:,5);
hold on
% plot3(labels(:,1)', labels(:,2)', ones(size(labels(:,1)))'*10, ':w', 'LineWidth', 1.5, 'MarkerSize', 7);
plot3(0:360, ones(1,361)* 90+labels(end,2), ones(1,361)'*15, '--w', 'LineWidth', 0.8, 'MarkerSize', 7);
plot3(0:360, ones(1,361)*180+labels(end,2), ones(1,361)'*15, '-w', 'LineWidth', 1.25, 'MarkerSize', 7);
plot3(0:360, ones(1,361)*270+labels(end,2), ones(1,361)'*15, '--w', 'LineWidth', 0.8, 'MarkerSize', 7);
plot3(ones(1,361)* 90+labels(end,1), 0:360, ones(1,361)'*15, '--w', 'LineWidth', 0.8, 'MarkerSize', 7);
plot3(ones(1,361)*180+labels(end,1), 0:360, ones(1,361)'*15, '-w', 'LineWidth', 1.25, 'MarkerSize', 7);
plot3(ones(1,361)*270+labels(end,1), 0:360, ones(1,361)'*15, '--w', 'LineWidth', 0.8, 'MarkerSize', 7);

scatter3(labels(1,1),labels(1,2),20, 180, 'o', 'MarkerEdgeColor','k', 'MarkerFaceColor','y', 'LineWidth', 1.2);
scatter3(labels(2,1),labels(2,2),20, 140, '^', 'MarkerEdgeColor','k', 'MarkerFaceColor','y', 'LineWidth', 1.2);
scatter3(labels(3,1),labels(3,2),20, 380, 'p', 'MarkerEdgeColor','k', 'MarkerFaceColor','y', 'LineWidth', 1.0);

for i=1:5
    scatter3(keyx(i)+labels(end,1), keyy(i)+labels(end,2), 20, 350, 'o', 'MarkerEdgeColor','k', 'MarkerFaceColor',[1.0 1.0 1.0], 'LineWidth', 1.5);
end
for i=6:9
    scatter3(keyx(i), keyy(i), 20, 350, 'o', 'MarkerEdgeColor','k', 'MarkerFaceColor',[1.0 1.0 1.0], 'LineWidth', 1.5);
end

for i=1:5
    t = text(keyx(i)+labels(end,1)-7,keyy(i)+labels(end,2)-2,21, strcat("\textbf{",num2str(lb(i)),"}"),'Interpreter','LaTex');
    t.FontSize = 21;
end
for i=6:9
    t = text(keyx(i)-7,keyy(i)-2,21, strcat("\textbf{",num2str(lb(i)),"}"),'Interpreter','LaTex');
    t.FontSize = 21;
end
%-------------------------------------------


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
set(gca,'XTickLabel',['  0';'180';'360']);
hx = xlabel('\fontsize{29}\bf{\theta} \fontsize{25}\rm{(degrees)}','Interpreter','tex','FontName','Helvetica');  hx.Position = hx.Position + [5, 5, 0];
set(gca,'YTickLabel',[]);
ylabel('','Interpreter','LaTex')
set(gca,'FontSize',24)
caxis([0 12]);
shading interp;
colormap jet(18);
textborder(310,330,30,namelist(6),'w','k', 0.5, 'Interpreter','tex', 'FontSize', 32);
%t=text(310,330,30,namelist(6),'Interpreter','tex');
%t.FontSize=32;
%t.Color='w';
%-------------------------------------------
labels=LB(:,:,6);
hold on
plot3(0:360, ones(1,361)* 90+labels(end,2), ones(1,361)'*15, '--w', 'LineWidth', 0.8, 'MarkerSize', 7);
plot3(0:360, ones(1,361)*180+labels(end,2), ones(1,361)'*15, '-w', 'LineWidth', 1.25, 'MarkerSize', 7);
plot3(0:360, ones(1,361)*270+labels(end,2), ones(1,361)'*15, '--w', 'LineWidth', 0.8, 'MarkerSize', 7);
plot3(ones(1,361)* 90+labels(end,1), 0:360, ones(1,361)'*15, '--w', 'LineWidth', 0.8, 'MarkerSize', 7);
plot3(ones(1,361)*180+labels(end,1), 0:360, ones(1,361)'*15, '-w', 'LineWidth', 1.25, 'MarkerSize', 7);
plot3(ones(1,361)*270+labels(end,1), 0:360, ones(1,361)'*15, '--w', 'LineWidth', 0.8, 'MarkerSize', 7);

scatter3(labels(1,1),labels(1,2),20, 180, 'o', 'MarkerEdgeColor','k', 'MarkerFaceColor','y', 'LineWidth', 1.2);
scatter3(labels(2,1),labels(2,2),20, 140, '^', 'MarkerEdgeColor','k', 'MarkerFaceColor','y', 'LineWidth', 1.2);
scatter3(labels(3,1),labels(3,2),20, 380, 'p', 'MarkerEdgeColor','k', 'MarkerFaceColor','y', 'LineWidth', 1.0);

for i=1:5
    scatter3(keyx(i)+labels(end,1), keyy(i)+labels(end,2), 20, 350, 'o', 'MarkerEdgeColor','k', 'MarkerFaceColor',[1.0 1.0 1.0], 'LineWidth', 1.5);
end
for i=6:9
    scatter3(keyx(i), keyy(i), 20, 350, 'o', 'MarkerEdgeColor','k', 'MarkerFaceColor',[1.0 1.0 1.0], 'LineWidth', 1.5);
end

for i=1:5
    t = text(keyx(i)+labels(end,1)-7,keyy(i)+labels(end,2)-2,21, strcat("\textbf{",num2str(lb(i)),"}"),'Interpreter','LaTex');
    t.FontSize = 21;
end
for i=6:9
    t = text(keyx(i)-7,keyy(i)-2,21, strcat("\textbf{",num2str(lb(i)),"}"),'Interpreter','LaTex');
    t.FontSize = 21;
end
%-------------------------------------------


% scatter3(labels(1,1),labels(1,2),20, 320, 'h', 'MarkerEdgeColor','k', 'MarkerFaceColor','y', 'LineWidth', 1.2);
% scatter3(labels(2,1),labels(2,2),20, 120, '^', 'MarkerEdgeColor','k', 'MarkerFaceColor','y', 'LineWidth', 1.2);
% scatter3(labels(3,1),labels(3,2),20, 350, 'p', 'MarkerEdgeColor','k', 'MarkerFaceColor','y', 'LineWidth', 1.0);
%-----------------------------------------------------------------------------------------------------------------
% scatter3(keyx(1)+labels(end,1), keyy(1)+labels(end,2), 20, 120, '^', 'MarkerEdgeColor','k', 'MarkerFaceColor',[1.0 1.0 1.0], 'LineWidth', 1.5);
% scatter3(keyx(2)+labels(end,1), keyy(2)+labels(end,2), 20, 120, 'd', 'MarkerEdgeColor','k', 'MarkerFaceColor',[1.0 1.0 1.0], 'LineWidth', 1.5);
% scatter3(keyx(3)+labels(end,1), keyy(3)+labels(end,2), 20, 120, 'o', 'MarkerEdgeColor','k', 'MarkerFaceColor',[1.0 1.0 1.0], 'LineWidth', 1.5);
% scatter3(keyx(4)+labels(end,1), keyy(4)+labels(end,2), 20, 175, 's', 'MarkerEdgeColor','k', 'MarkerFaceColor',[1.0 1.0 1.0], 'LineWidth', 1.8); 
% scatter3(keyx(5)+labels(end,1), keyy(5)+labels(end,2), 20, 120, 'v', 'MarkerEdgeColor','k', 'MarkerFaceColor',[1.0 1.0 1.0], 'LineWidth', 1.5);

%{
for i=1:length(labels)
    t = text(labels(i,1),labels(i,2),10,num2str(i-1),'Interpreter','LaTex');
    t.FontSize = 11;
end
%}
%-------------------------------------------


hc = axes('Units','normalized', 'Position', [0.12, 0.00, 0.5, 0.18], 'XTickLabel', '', 'YTickLabel', '');
axis off;
map = jet(25); map = map(1:24,:);
colormap(map);
caxis([0 12]);
h = colorbar('Position',[0.92, 0.10, 0.015, 0.87], 'location', 'Eastoutside');
ylabel(h,'\fontsize{28}\bf{E_{rel}} \fontsize{25}\rm{(kcal/mol)}','Interpreter','tex','FontName','Helvetica');
h.Label.Position = [3.0, 6.0, 0.0];
set(h,'YTick',[0,2,4,6,8,10,12]);
set(h,'YTickLabel',[' 0';' 2';' 4';' 6';' 8';'10';'12']);
set(gca,'FontSize',27)

set(gcf, 'Position', [0, 0, 1650, 2000]);

print('~/2a-2f', '-dpng', '-r300');