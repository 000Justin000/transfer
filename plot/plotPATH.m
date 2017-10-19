clc, clear, close all;
n = 36;

E(1,:) = [-765.8625284, -765.8593637, -765.8626253];
E(2,:) = [-805.1941033, -805.1899081, -805.1983216];
E(3,:) = [-844.5291226, -844.5235069, -844.5292216];
E(4,:) = [-688.2160957, -688.2143823, -688.2165736];
E(5,:) = [-727.5472373, -727.5412896, -727.5466693];
E(6,:) = [-766.8750755, -766.8725223, -766.8762837];

E(1,:) = (E(1,:)-min(E(1,:)))*627.509;
E(2,:) = (E(2,:)-min(E(2,:)))*627.509;
E(3,:) = (E(3,:)-min(E(3,:)))*627.509;
E(4,:) = (E(4,:)-min(E(4,:)))*627.509;
E(5,:) = (E(5,:)-min(E(5,:)))*627.509;
E(6,:) = (E(6,:)-min(E(6,:)))*627.509;

hx = tight_subplot(1,3,[0.040, 0.020],[0.10, 0.03],[0.05 0.01]);
% axes(hx(1)); plot(1:3, E(1,:),  '-r^', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k','MarkerSize', 7, 'linewidth', 1.5); xlim([0.7,3.3]); ylim([0,8]); xticks([1:3]); xticklabels(['[        ]'; '[        ]'; '[        ]']);                  legend('1a'); hold on; ylabel('\textbf{kcal/mol}', 'Interpreter', 'latex', 'FontSize', 15);
% axes(hx(2)); plot(1:3, E(2,:),  '-ro', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k','MarkerSize', 7, 'linewidth', 1.0); xlim([0.7,3.3]); ylim([0,8]); xticks([1:3]); xticklabels(['[        ]'; '[        ]'; '[        ]']); yticklabels([]); legend('1b'); hold on;
% axes(hx(3)); plot(1:3, E(3,:),  '-rs', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k','MarkerSize', 9, 'linewidth', 1.0); xlim([0.7,3.3]); ylim([0,8]); xticks([1:3]); xticklabels(['[        ]'; '[        ]'; '[        ]']); yticklabels([]); legend('1c'); hold on;
% set(gcf, 'Position', [0, 0, 1200, 516]);

axes(hx(1)); plot(1:3, E(4,:),  '-b^', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k','MarkerSize', 7, 'linewidth', 1.5); xlim([0.7,3.3]); ylim([0,6]); xticks([1:3]); xticklabels(['[        ]'; '[        ]'; '[        ]']);                  legend('1d'); hold on; ylabel('\textbf{kcal/mol}', 'Interpreter', 'latex', 'FontSize', 15);
axes(hx(2)); plot(1:3, E(5,:),  '-bo', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k','MarkerSize', 7, 'linewidth', 1.0); xlim([0.7,3.3]); ylim([0,6]); xticks([1:3]); xticklabels(['[        ]'; '[        ]'; '[        ]']); yticklabels([]); legend('1e'); hold on;
axes(hx(3)); plot(1:3, E(6,:),  '-bs', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k','MarkerSize', 9, 'linewidth', 1.0); xlim([0.7,3.3]); ylim([0,6]); xticks([1:3]); xticklabels(['[        ]'; '[        ]'; '[        ]']); yticklabels([]); legend('1f'); hold on;
set(gcf, 'Position', [0, 0, 1200, 400]);
