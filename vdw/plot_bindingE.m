%% 2a_2c
close all, clear all;

set(gca,'TickLabelInterpreter', 'latex');

distances = [3.0, 3.5, 4.0, 4.2, 4.4, 4.5, 4.6, 4.7, 4.8, 4.9, 5.0, 5.1, ...
             5.2, 5.3, 5.4, 5.6, 5.7, 5.8, 5.9, 6.0, 6.5, 7.0, 8.0, 10.0];

e1001  = dlmread('fix/qchem_1001_B3LYP_d3_op_6-311++G**/binding_energies',':');  e1001  = e1001(:,2)/2/29/4.184;
e1101  = dlmread('fix/qchem_1101_B3LYP_d3_op_6-311++G**/binding_energies',':');  e1101  = e1101(:,2)/2/32/4.184;
e1111  = dlmread('fix/qchem_1111_B3LYP_d3_op_6-311++G**/binding_energies',':');  e1111  = e1111(:,2)/2/35/4.184;

rg = [5,6,7,8,9,10,11,12,13,14,15,16,18,20,21,22,23,24];
dist = 4.3:0.02:10.0;
E1001  = interp1(distances, e1001, dist, 'spline');
E1101  = interp1(distances, e1101, dist, 'spline');
E1111  = interp1(distances, e1111, dist, 'spline');

plot(dist, E1001, ':r',  'LineWidth', 2.5); hold on;
plot(dist, E1101, '-.r', 'LineWidth', 2.5);
plot(dist, E1111, '-r',  'LineWidth', 2.5);

set(gca,'TickLabelInterpreter','tex')
scatter(distances(rg), e1001(rg), 50, 'ro', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'r', 'LineWidth', 1.0);
scatter(distances(rg), e1101(rg), 50, 'r^', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'r', 'LineWidth', 1.0);
scatter(distances(rg), e1111(rg), 50, 'rs', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'r', 'LineWidth', 1.0);
set(gca, 'fontSize', 19)

axis([4.6, 6.2, -0.15, -0.05]);
xticks([4.6:0.4:6.2]);
xticklabels(["4.6", "5.0", "5.4", "5.8", "6.2"]);
yticks([-0.15:0.05:-0.05]);
yticklabels(["-0.15", "-0.10", "-0.05"]);
set(gcf, 'Position', [0, 0, 500, 240]);
print('2a-2c_zoom','-dsvg')



legend(["2a", "2b", "2c"]);

axis([4.0, 10.0, -0.2, 0.4]);
xlabel('\textbf{distance (\AA)}', 'Interpreter', 'latex', 'FontSize', 21);
xticks([4:10]); 
xticklabels(["4", "5", "6", "7", "8", "9", "10"]);

ylabel('$\mathbf{E_{binding}}$ \textbf{(kcal/mol)}', 'Interpreter', 'latex', 'FontSize', 21);
yticks([-0.2:0.2:0.4]); 
yticklabels(["-0.2", "0.0", "0.2", "0.4"]);
grid on;
ax = gca;
ax.LineWidth = 1.0;
set(gcf, 'Position', [0, 0, 700, 500]);
print('2a-2c_original','-dsvg')




%% 2d_2f
close all, clear all;

set(gca,'TickLabelInterpreter', 'latex');

distances = [3.0, 3.5, 3.7, 3.9, 4.0, 4.1, 4.2, 4.3, 4.4, 4.5, 4.6, 4.7, 4.8, 4.9, ...
             5.0, 5.1, 5.2, 5.3, 5.4, 5.6, 5.7, 5.8, 5.9, 6.0, 6.5, 7.0, 8.0, 10.0];

e10n01 = dlmread('fix/qchem_10n01_B3LYP_d3_op_6-311++G**/binding_energies',':'); e10n01 = e10n01(:,2)/2/24/4.184;
e11n01 = dlmread('fix/qchem_11n01_B3LYP_d3_op_6-311++G**/binding_energies',':'); e11n01 = e11n01(:,2)/2/27/4.184;
e11n11 = dlmread('fix/qchem_11n11_B3LYP_d3_op_6-311++G**/binding_energies',':'); e11n11 = e11n11(:,2)/2/30/4.184;

rg = [1:19,20,22,24,25,26,27,28];
dist = 3.4:0.02:10.0;
E10n01 = interp1(distances, e10n01, dist, 'spline');
E11n01 = interp1(distances, e11n01, dist, 'spline');
E11n11 = interp1(distances, e11n11, dist, 'spline');

plot(dist, E10n01, ':b',  'LineWidth', 2.5); hold on;
plot(dist, E11n01, '-.b', 'LineWidth', 2.5);
plot(dist, E11n11, '-b',  'LineWidth', 2.5);

set(gca,'TickLabelInterpreter','tex')
scatter(distances(rg), e10n01(rg), 50, 'bo', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'b', 'LineWidth', 1.0);
scatter(distances(rg), e11n01(rg), 50, 'b^', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'b', 'LineWidth', 1.0);
scatter(distances(rg), e11n11(rg), 50, 'bs', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'b', 'LineWidth', 1.0);
set(gca, 'fontSize', 19)

axis([3.7, 5.7, -0.09, -0.03]);
xticks([3.7:0.4:5.7]);
xticklabels(["3.7", "4.1", "4.5", "4.9", "5.3", "5.7"]);
yticks([-0.09:0.03:-0.03]);
yticklabels(["-0.09", "-0.06", "-0.03"]);
set(gcf, 'Position', [0, 0, 500, 280]);
print('2d-2f_zoom','-dsvg')



legend(["2d", "2e", "2f"]);

axis([3.0, 10.0, -0.1, 0.2]);
xlabel('\textbf{distance (\AA)}', 'Interpreter', 'latex', 'FontSize', 21);
xticks([3:10]); 
xticklabels(["3", "4", "5", "6", "7", "8", "9", "10"]);

ylabel('$\mathbf{E_{binding}}$ \textbf{(kcal/mol)}', 'Interpreter', 'latex', 'FontSize', 21);
yticks([-0.1:0.1:0.4]); 
yticklabels(["-0.1", "0.0", "0.1", "0.2", "0.3", "0.4"]);
grid on;
ax = gca;
ax.LineWidth = 1.0;
set(gcf, 'Position', [0, 0, 700, 500]);
print('2d-2f_original','-dsvg')
