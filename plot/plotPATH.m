clc, clear, close all;
n = 36;

system = '1101';
method = '_RIMP2';

A = dlmread(strcat('../qchem_path_', system, method, '_None_aug-cc-pVDZ/energies'));

E = (A(:,3)-min(A(:,3)))'*627.509;
E(end+1) = E(1);

plot(1:length(E), E);
xlabel('config');
ylabel('kcal/mol');
xticks(1:length(E));
xticklabels(string([0:length(E)-2,0]));