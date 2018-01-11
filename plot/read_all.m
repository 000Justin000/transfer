systems = ["1001"; "1101"; "1111"; "10n01"; "11n01"; "11n11"];

for idx=1:6
    system = systems(idx);
    plotPES;
    close all;
    VE(:,:,idx) = Ve;
    LB(1:size(labels,1),:,idx) = labels;
    
    [sorted_Vf, sorted_id] = sort(Vf(:));

    if (idx == 5)
        [min_v, min_id] = min(Vf(:));
        [min_i, min_j]  = ind2sub(size(Vf), min_id);
    else
        for id=1:length(sorted_Vf)
            [ii,jj] = ind2sub(size(Vf), sorted_id(id));
        
            if (Xf(ii,jj) > 180 && Xf(ii,jj) < 270 && Yf(ii,jj) > 180 && Yf(ii,jj) < 270)
                [min_i, min_j] = deal(ii,jj);            
                break;
            end
        end
    end
    
    Bf = shortest_path_max(Vf, min_i, min_j);
    Be = zeros(n+1, n+1);
    Be(1:n, 1:n) = Bf;
    Be(n+1, :) = Be(1,:);
    Be(:,n+1)  = Be(:,1);
    
    [YeF,XeF] = meshgrid(0:1:360,0:1:360);
    BeF = interp2(Ye,Xe,Be,YeF,XeF, 'spline');
    
    VE(:,:,idx) = Be;
end