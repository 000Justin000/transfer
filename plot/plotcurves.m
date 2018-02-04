E = dlmread("data");

for i=1:6
   [bins, vals] = del_zeros(E(i,:));
   EKC{i} = (vals - min(vals)) * 627.509;
   BINS{i} = bins;
end

rcoord  = 1.0:0.01:9.0;
for i=1:6
    EE(i,:) = pchipd(BINS{i}, EKC{i}, zeros(1,length(BINS{i})), rcoord);
end

hx = tight_subplot(2,1,[0.030, 0.050],[0.03, 0.03],[0.08 0.01]);

%------------------------------------------------------
axes(hx(1));
plot(rcoord, EE(1,:),  ':r', rcoord, EE(2,:),  '-.r',  rcoord, EE(3,:),  '-r', 'linewidth', 3); hold on;
for i=1:3
    scatter(BINS{i}, EKC{i}, 120, 'ro', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'r', 'LineWidth', 2.0);
end
set(gca,'TickLabelInterpreter','tex');
set(gca, 'fontSize', 22);
set(gca, 'LineWidth', 1.5);
%------------------------------------------------------
yn = 7;
xlim([1.0,9.0]);
xticks([]); 
ylim([0,yn]);
h=ylabel('E_{rel} (kcal/mol)', 'Interpreter', 'tex');
yticks(0:yn);
yticklabels(["0",  " ", "2", " ", "4", " ", "6", " "]);
legend(["2a", "2b", "2c"], 'location', 'northwest');
%------------------------------------------------------

%------------------------------------------------------
axes(hx(2));
plot(rcoord, EE(4,:),  ':b', rcoord, EE(5,:),  '-.b',  rcoord, EE(6,:),  '-b', 'linewidth', 3); hold on;
for i=4:6
    scatter(BINS{i}, EKC{i}, 120, 'bo', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'b', 'LineWidth', 2.0);
end
set(gca,'TickLabelInterpreter','tex');
set(gca, 'fontSize', 22);
set(gca, 'LineWidth', 1.5);
%------------------------------------------------------
yn = 7;
xlim([1.0,9.0]);
xticks([]); 
ylim([0,yn]);
h=ylabel('E_{rel} (kcal/mol)', 'Interpreter', 'tex');
yticks(0:yn);
yticklabels(["0",  " ", "2", " ", "4", " ", "6", " "]);
legend(["2d", "2e", "2f"], 'location', 'northwest');
%------------------------------------------------------

set(gcf, 'Position', [0, 0, 1100, 1000]);