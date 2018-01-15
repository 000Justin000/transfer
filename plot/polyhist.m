ebins = 0.0:0.1:14.0;
ebinf = 0.0:0.1:14.0;

ccumfs = zeros(6,length(ebinf));

for i=1:6
   e = VE(:,:,i); e = e(:);
   h = histogram(e, ebins); 
   ccumfs(i,:) = interp1(ebins, cumsum([0 h.Values])/length(e), ebinf, 'linear');
   ccumfs(i,ccumfs(i,:)<0) = 0;
   ccumfs(i,ccumfs(i,:)>1) = 1;
end

close all;

ha = tight_subplot(1,2,[0.00, 0.052],[0.19, 0.03],[0.10 0.02]);

axes(ha(1));
plot(ebinf, ccumfs(1,:), ':r', ebinf, ccumfs(2,:), '-.r', ebinf, ccumfs(3,:), '-r', 'LineWidth', 3.0);
set(gca, 'fontSize', 23)
xlim([0 14])
xlabel('\bf{E_{thresh}} \rm{(kcal/mol)}','Interpreter','tex', 'FontSize', 23, 'FontName','Helvetica');
xticks(0:2:14);
set(gca,'TickLabelInterpreter','tex');
xticklabels(["0","  ","4","  ","8","  ","12","  "])
ylim([0 1])
% ylabel('\textbf{fraction}','Interpreter','LaTex', 'FontSize', 30);
yticks(0.0:0.25:1.0)
yticklabels(["0.0", "   ", "0.5", "   ", "1.0"]);
legend(["2a", "2b", "2c"], 'Location', 'southeast');
ax = gca;
ax.LineWidth = 1.5;
grid on

axes(ha(2));
plot(ebinf, ccumfs(4,:), ':b', ebinf, ccumfs(5,:), '-.b', ebinf, ccumfs(6,:), '-b', 'LineWidth', 3.0);
set(gca, 'fontSize', 23)
xlim([0 14])
xlabel('\bf{E_{thresh}} \rm{(kcal/mol)}','Interpreter','tex', 'FontSize', 23, 'FontName','Helvetica');
xticks(0:2:14);
set(gca,'TickLabelInterpreter','tex');
xticklabels(["0","  ","4","  ","8","  ","12","  "])
ylim([0 1])
% ylabel('\textbf{fraction}','Interpreter','LaTex', 'FontSize', 30);
yticks(0.0:0.25:1.0)
yticklabels([]);
legend(["2d", "2e", "2f"], 'Location', 'southeast');
ax = gca;
ax.LineWidth = 1.5;
grid on
    
%%
hc = axes('Units','normalized', 'Position', [0.05, 0.10, 0.00, 0.90], 'XTickLabel', '', 'YTickLabel', '');
axis off;
ylabel('Region  below  \bf{E_{thresh}}','Interpreter','tex', 'FontSize', 26, 'visible','on');

set(gcf, 'Position', [0, 0, 1200, 500]);

print('fractional_occupation', '-dpng', '-r300');