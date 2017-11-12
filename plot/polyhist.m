ebins = 0.0:2.0:14.0;
ebinf = 0.0:0.1:14.0;

ccumfs = zeros(6,length(ebinf));

for i=1:6
   e = VF(:,:,i); e = e(:);
   h = histogram(e, ebins); 
   ccumfs(i,:) = spline(ebins, cumsum([0 h.Values])/360^2, ebinf);
   ccumfs(i,ccumfs(i,:)<0) = 0;
   ccumfs(i,ccumfs(i,:)>1) = 1;
end

close all;

ha = tight_subplot(2,1,[0.07, 0.00],[0.10, 0.03],[0.20 0.03]);

axes(ha(1));
plot(ebinf, ccumfs(1,:), ':r', ebinf, ccumfs(2,:), '-.r', ebinf, ccumfs(3,:), '-r', 'LineWidth', 2.0);
set(gca, 'fontSize', 24)
xlim([0 14])
xlabel('');
xticks(0:2:14);
xticklabels([])
ylim([0 1])
% ylabel('\textbf{fraction}','Interpreter','LaTex', 'FontSize', 30);
yticks(0.0:0.25:1.0)
yticklabels(["0.0", "   ", "0.5", "   ", "1.0"]);
legend(["2a", "2b", "2c"], 'Location', 'southeast');
    


axes(ha(2));
plot(ebinf, ccumfs(4,:), ':b', ebinf, ccumfs(5,:), '-.b', ebinf, ccumfs(6,:), '-b', 'LineWidth', 2.0);
set(gca, 'fontSize', 24)
xlim([0 14])
xlabel('$\mathbf{E_{threshold}} \ \textbf{(kcal/mol)}$','Interpreter','LaTex', 'FontSize', 30);
xticks(0:2:14);
xticklabels([" 0","  "," 4","  "," 8","  ","12","  "])
ylim([0 1])
% ylabel('\textbf{fraction}','Interpreter','LaTex', 'FontSize', 30);
yticks(0.0:0.25:1.0)
yticklabels(["0.0", "   ", "0.5", "   ", "1.0"]);
legend(["2d", "2e", "2f"], 'Location', 'southeast');

%%
hc = axes('Units','normalized', 'Position', [0.08, 0.00, 0.10, 1.00], 'XTickLabel', '', 'YTickLabel', '');
axis off;
ylabel('\textbf{fractional region below} $\mathbf{E_{threshold}}$','Interpreter','LaTex', 'FontSize', 30, 'visible','on');

set(gcf, 'Position', [0, 0, 600, 900]);

print('fractional_occupation', '-dpng', '-r300');