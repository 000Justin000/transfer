clc, clear, close all;

E(1,:) = [-765.8625284, -765.8593637, -765.8626253];
E(2,:) = [-805.1941033, -805.1899081, -805.1983216];
E(3,:) = [-844.5291226, -844.5235069, -844.5292216];
E(4,:) = [-688.2160957, -688.2143823, -688.2165736];
E(5,:) = [-727.5472373, -727.5412896, -727.5466693];
E(6,:) = [-766.8750755, -766.8725223, -766.8762837];

E = fliplr(E);

E(1,:) = (E(1,:)-min(E(1,:)))*627.509;
E(2,:) = (E(2,:)-min(E(2,:)))*627.509;
E(3,:) = (E(3,:)-min(E(3,:)))*627.509;
E(4,:) = (E(4,:)-min(E(4,:)))*627.509;
E(5,:) = (E(5,:)-min(E(5,:)))*627.509;
E(6,:) = (E(6,:)-min(E(6,:)))*627.509;

E(2,:) = E(2,:) + max(E(1,:)-E(2,:));
E(3,:) = E(3,:) + max(E(2,:)-E(3,:));
E(5,:) = E(5,:) + max(E(4,:)-E(5,:));
E(6,:) = E(6,:) + max(E(5,:)-E(6,:));

% E = E([4,5,6,1,2,3],:);

rcoord  = 1.0:0.01:3.0;
EE(1,:) = pchipd(1:3, E(1,:), [0.0, 0.0, 0.0], rcoord);
EE(2,:) = pchipd(1:3, E(2,:), [0.0, 0.0, 0.0], rcoord);
EE(3,:) = pchipd(1:3, E(3,:), [0.0, 0.0, 0.0], rcoord);
EE(4,:) = pchipd(1:3, E(4,:), [0.0, 0.0, 0.0], rcoord);
EE(5,:) = pchipd(1:3, E(5,:), [0.0, 0.0, 0.0], rcoord);
EE(6,:) = pchipd(1:3, E(6,:), [0.0, 0.0, 0.0], rcoord);

hx = tight_subplot(1,2,[0.030, 0.050],[0.085, 0.03],[0.075 0.01]);

yn = 7;

axes(hx(1));
%set(gca, 'fontSize', 28);
plot(rcoord, EE(1,:),  ':r', rcoord, EE(2,:),  '-.r',  rcoord, EE(3,:),  '-r', 'linewidth', 3); hold on;
set(gca,'TickLabelInterpreter','tex')
scatter(1:3, E(1,:), 120, 'ro', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'r', 'LineWidth', 2.0);
scatter(1:3, E(2,:), 120, 'ro', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'r', 'LineWidth', 2.0);
scatter(1:3, E(3,:), 120, 'ro', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'r', 'LineWidth', 2.0);
set(gca, 'fontSize', 28)

xlim([0.7,3.3]);
xlabel('');
xticks([1:3]); 
xticklabels(["M1", "TS", "M2"]);
ylim([0,yn-0.5]);
h=ylabel('\bf{E_{rel}} \rm{(kcal/mol)}', 'Interpreter', 'tex', 'FontSize', 28); h.Position = h.Position + [0.22, 0, 0];
yticks(0:yn);
yticklabels(["0",  " ", "2", " ", "4", " ", "6", " "])
legend(["2a", "2b", "2c"]); hold on; 
ax = gca;
ax.LineWidth = 1.5;

axes(hx(2)); 
% set(gca, 'fontSize', 28);
plot(rcoord, EE(4,:),  ':b', rcoord, EE(5,:),  '-.b',  rcoord, EE(6,:),  '-b', 'linewidth', 3); hold on;
set(gca,'TickLabelInterpreter','tex')
scatter(1:3, E(4,:), 120, 'bo', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'b', 'LineWidth', 2.0);
scatter(1:3, E(5,:), 120, 'bo', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'b', 'LineWidth', 2.0);
scatter(1:3, E(6,:), 120, 'bo', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'b', 'LineWidth', 2.0);
set(gca, 'fontSize', 28)

xlim([0.7,3.3]);
xlabel('');
xticks([1:3]); 
xticklabels(["M1", "TS", "M2"]);
ylim([0,yn-0.5]); 
ylabel('');
yticks(0:yn);
yticklabels([])
legend(["2d", "2e", "2f"]); hold on;
ax = gca;
ax.LineWidth = 1.5;

set(gcf, 'Position', [0, 0, 1400, 550]);

% axes(hx(1)); plot(1:3, E(4,:),  '-b^', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k','MarkerSize', 7, 'linewidth', 1.5); xlim([0.7,3.3]); ylim([0,6]); xticks([1:3]); xticklabels(['[        ]'; '[        ]'; '[        ]']);                  legend('1d'); hold on; ylabel('\textbf{kcal/mol}', 'Interpreter', 'latex', 'FontSize', 15);
% axes(hx(2)); plot(1:3, E(5,:),  '-bo', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k','MarkerSize', 7, 'linewidth', 1.0); xlim([0.7,3.3]); ylim([0,6]); xticks([1:3]); xticklabels(['[        ]'; '[        ]'; '[        ]']); yticklabels([]); legend('1e'); hold on;
% axes(hx(3)); plot(1:3, E(6,:),  '-bs', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k','MarkerSize', 9, 'linewidth', 1.0); xlim([0.7,3.3]); ylim([0,6]); xticks([1:3]); xticklabels(['[        ]'; '[        ]'; '[        ]']); yticklabels([]); legend('1f'); hold on;
% set(gcf, 'Position', [0, 0, 1200, 400]);
