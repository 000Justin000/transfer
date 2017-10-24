system = '1001';
plotPES;
VE(:,:,1) = Ve;
LB(1:size(labels,1),:,1) = labels;

system = '1301';
plotPES;
VE(:,:,2) = Ve;
LB(1:size(labels,1),:,2) = labels;

system = '1331';
plotPES;
VE(:,:,3) = Ve;
LB(1:size(labels,1),:,3) = labels;

system = '10d01';
plotPES;
VE(:,:,4) = Ve;
LB(1:size(labels,1),:,4) = labels;

system = '11d01';
plotPES;
VE(:,:,5) = Ve;
LB(1:size(labels,1),:,5) = labels;

system = '11d11';
plotPES;
VE(:,:,6) = Ve;
LB(1:size(labels,1),:,6) = labels;