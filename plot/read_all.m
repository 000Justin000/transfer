system = '1001';
plotPES;
VE(:,:,1) = Ve;
VF(:,:,1) = Pf;
LB(1:size(labels,1),:,1) = labels;

system = '1101';
plotPES;
VE(:,:,2) = Ve;
VF(:,:,2) = Pf;
LB(1:size(labels,1),:,2) = labels;

system = '1111';
plotPES;
VE(:,:,3) = Ve;
VF(:,:,3) = Pf;
LB(1:size(labels,1),:,3) = labels;

system = '10n01';
plotPES;
VE(:,:,4) = Ve;
VF(:,:,4) = Pf;
LB(1:size(labels,1),:,4) = labels;

system = '11n01';
plotPES;
VE(:,:,5) = Ve;
VF(:,:,5) = Pf;
LB(1:size(labels,1),:,5) = labels;

system = '11n11';
plotPES;
VE(:,:,6) = Ve;
VF(:,:,6) = Pf;
LB(1:size(labels,1),:,6) = labels;