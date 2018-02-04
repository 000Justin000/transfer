addpath('../plot')

n = 72;

% system = '1101';
method = '_B3LYP';
labels = [];

if (strcmp(method, '_B3LYP'))
    A = dlmread(strcat('../qchem_scan_', system, method, '_d3_op_6-311++G**/energies'));
end
    
X = reshape(A(:,1), [n,n])';
Y = reshape(A(:,2), [n,n])';
P = reshape(A(:,3), [n,n])';

% X=Xf(1:2:end,1:2:end);
% Y=Yf(1:2:end,1:2:end);
% P=Pf(1:2:end,1:2:end)/607.509;
% n = 36;

P = (P-min(min(P)));

B=floyd_warshall_max(P);

%{
[Xe,Ye,Ve] = meshBoard(X,Y,reshape(B(23*36+10,:),[n,n]));
surf(Xe,Ye,Ve*627.509);
view(0,90);
set_range
xlabel('$\mathbf{\theta}$','Interpreter','LaTex')
ylabel('$\mathbf{\phi}$','Interpreter','LaTex')
set(gca,'FontSize',30)
set(gcf, 'Position', [0, 0, 1000, 850]);
h = colorbar;
ylabel(h,'kcal/mol')
set(h,'YTick',[0,4,8,12]);
caxis([0 12]);
shading interp;
colormap jet(24);
%}