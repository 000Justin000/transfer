function [bins, vals] = del_zeros(E)
    B = 1:length(E);
    bins = B(E ~= 0);
    vals = E(E ~= 0);
end