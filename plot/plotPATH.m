clc, clear, close all;
n = 36;

system1 = '1001';
system2 = '1101';
system3 = '1111';
system4 = '10n01';
system5 = '11n01';
system6 = '11n11';

method = '_wB97M-V';

A(:,:,1) = dlmread(strcat('../qchem_path_', system1, method, '_None_aug-cc-pVTZ/energies'));
A(:,:,2) = dlmread(strcat('../qchem_path_', system2, method, '_None_aug-cc-pVTZ/energies'));
A(:,:,3) = dlmread(strcat('../qchem_path_', system3, method, '_None_aug-cc-pVTZ/energies'));
A(:,:,4) = dlmread(strcat('../qchem_path_', system4, method, '_None_aug-cc-pVTZ/energies'));
A(:,:,5) = dlmread(strcat('../qchem_path_', system5, method, '_None_aug-cc-pVTZ/energies'));
A(:,:,6) = dlmread(strcat('../qchem_path_', system6, method, '_None_aug-cc-pVTZ/energies'));

E(:,1) = (A(:,3,1)-min(A(:,3,1)))'*627.509;
E(:,2) = (A(:,3,2)-min(A(:,3,2)))'*627.509;
E(:,3) = (A(:,3,3)-min(A(:,3,3)))'*627.509;
E(:,4) = (A(:,3,4)-min(A(:,3,4)))'*627.509;
E(:,5) = (A(:,3,5)-min(A(:,3,5)))'*627.509;
E(:,6) = (A(:,3,6)-min(A(:,3,6)))'*627.509;

set(gcf, 'Position', [0, 0, 1000, 550]);

plot(1:9, E(:,1), ':ro',  ...
     1:9, E(:,4), ':bo',  ...
     1:9, E(:,2), '-ro',  ...
     1:9, E(:,5), '-bo',  ...
     1:9, E(:,3), '--ro', ...
     1:9, E(:,6), '--bo', ...
     'linewidth', 2);
columnlegend(3, cellstr(['102/1a'; '065/1d'; '121/1b'; '094/1e'; '096/1c'; '088/1f']),'Orientation','vertical','location', 'north', 'boxon');
ylim([0,5]);
xlabel('config');
ylabel('kcal/mol');
xticks(1:length(E));
xticklabels(string([0:length(E)-2,0]));
yticks(0:5);