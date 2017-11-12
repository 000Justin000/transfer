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

rcoord  = 1.0:0.01:3.0;
EE(1,:) = pchipd(1:3, E(1,:), [0.0, 0.0, 0.0], rcoord);
EE(2,:) = pchipd(1:3, E(2,:), [0.0, 0.0, 0.0], rcoord);
EE(3,:) = pchipd(1:3, E(3,:), [0.0, 0.0, 0.0], rcoord);
EE(4,:) = pchipd(1:3, E(4,:), [0.0, 0.0, 0.0], rcoord);
EE(5,:) = pchipd(1:3, E(5,:), [0.0, 0.0, 0.0], rcoord);
EE(6,:) = pchipd(1:3, E(6,:), [0.0, 0.0, 0.0], rcoord);

hx = tight_subplot(1,2,[0.040, 0.020],[0.06, 0.03],[0.08 0.01]);

axes(hx(1)); 
plot(rcoord, EE(1,:),  ':r', rcoord, EE(2,:),  '-.r',  rcoord, EE(3,:),  '-r', 'linewidth', 1.5); hold on;
set(gca,'TickLabelInterpreter','latex')
scatter(1:3, E(1,:), 'ro', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'r');
scatter(1:3, E(2,:), 'ro', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'r');
scatter(1:3, E(3,:), 'ro', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'r');
set(gca, 'fontSize', 15)

xlim([0.7,3.3]);
xlabel('');
xticks([1:3]); 
xticklabels(["\textbf{LM1}", "\textbf{TS}", "\textbf{LM2}"]);
ylim([0,10]);
ylabel('\textbf{relative energy (kcal/mol)}', 'Interpreter', 'latex', 'FontSize', 18);
yticks(0:10);
yticklabels([" 0","  "," 2","  "," 4","  "," 6","  "," 8","  ","10"])
legend(["2a", "2b", "2c"]); hold on; 


axes(hx(2)); 
plot(rcoord, EE(4,:),  ':b', rcoord, EE(5,:),  '-.b',  rcoord, EE(6,:),  '-b', 'linewidth', 1.5); hold on;
set(gca,'TickLabelInterpreter','latex')
scatter(1:3, E(4,:), 'bo', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'b');
scatter(1:3, E(5,:), 'bo', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'b');
scatter(1:3, E(6,:), 'bo', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'b');
set(gca, 'fontSize', 15)

xlim([0.7,3.3]);
xlabel('');
xticks([1:3]); 
xticklabels(["\textbf{LM1}", "\textbf{TS}", "\textbf{LM2}"]);
ylim([0,10]); 
ylabel('');
yticks(0:10);
yticklabels([])
legend(["2d", "2e", "2f"]); hold on; 

set(gcf, 'Position', [0, 0, 800, 550]);

% axes(hx(1)); plot(1:3, E(4,:),  '-b^', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k','MarkerSize', 7, 'linewidth', 1.5); xlim([0.7,3.3]); ylim([0,6]); xticks([1:3]); xticklabels(['[        ]'; '[        ]'; '[        ]']);                  legend('1d'); hold on; ylabel('\textbf{kcal/mol}', 'Interpreter', 'latex', 'FontSize', 15);
% axes(hx(2)); plot(1:3, E(5,:),  '-bo', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k','MarkerSize', 7, 'linewidth', 1.0); xlim([0.7,3.3]); ylim([0,6]); xticks([1:3]); xticklabels(['[        ]'; '[        ]'; '[        ]']); yticklabels([]); legend('1e'); hold on;
% axes(hx(3)); plot(1:3, E(6,:),  '-bs', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k','MarkerSize', 9, 'linewidth', 1.0); xlim([0.7,3.3]); ylim([0,6]); xticks([1:3]); xticklabels(['[        ]'; '[        ]'; '[        ]']); yticklabels([]); legend('1f'); hold on;
% set(gcf, 'Position', [0, 0, 1200, 400]);
