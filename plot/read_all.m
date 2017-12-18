systems = ["1001", "1101", "1111", "10n01", "11n01", "11n11"];

for i=1:6
    system = systems(i);
    plotPES;
    VE(:,:,i) = Ve;
    VF(:,:,i) = Pf;
    LB(1:size(labels,1),:,i) = labels;
end