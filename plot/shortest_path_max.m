function B = shortest_path_max(V, i, j)
    n = size(V,1);
    
    if (V(i,j) ~= min(min(V)))
       disp('source is not minimum');
       disp(V(i,j));
    end
    
    B = inf(n,n);
    B(i,j) = V(i,j);
    
    while (true)
        B_ = B;
        
        Be = zeros(n+2,n+2);
        Be(2:n+1, 2:n+1) = B;
        
        Be(  1, 2:n+1) = B(end, :);  % ^
        Be(end, 2:n+1) = B(  1, :);  % v
        Be(2:n+1,   1) = B(:, end);  % <
        Be(2:n+1, end) = B(:,   1);  % >
        
        Be(  1,   1) = B(end, end); % < ^
        Be(  1, end) = B(end,   1); % > ^
        Be(end,   1) = B(  1, end); % < v
        Be(end, end) = B(  1,   1); % > v
        
        Be = ordfilt2(Be, 1, [0,1,0; 1,1,1; 0,1,0], 'zeros');
        
        B = max(Be(2:n+1, 2:n+1), V);
        
        if(isequal(B, B_))
            break;
        end
    end
    
    
end