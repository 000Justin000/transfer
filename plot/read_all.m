system = '1001';
plotPES;
VE(:,:,1) = Ve;
LB(1:length(labels),:,1) = labels;

system = '1101';
plotPES;
VE(:,:,2) = Ve;
LB(1:length(labels),:,2) = labels;

system = '1111';
plotPES;
VE(:,:,3) = Ve;
LB(1:length(labels),:,3) = labels;

system = '10n01';
plotPES;
VE(:,:,4) = Ve;
LB(1:length(labels),:,4) = labels;

system = '11n01';
plotPES;
VE(:,:,5) = Ve;
LB(1:length(labels),:,5) = labels;

system = '11n11';
plotPES;
VE(:,:,6) = Ve;
LB(1:length(labels),:,6) = labels;