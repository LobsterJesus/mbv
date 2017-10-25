function IM = growRegion(IM_orig, seedPx)

    open = [];
    closed = seedPx;
    region = ...
        [1 1 1
        1 1 1
        1 1 1];
    
    
    
    for i = 1:size(closed, 1)
        
        open = ...
            [open
            closed(i, 1) - 1, closed(i, 2) - 1
            closed(i, 1) - 0, closed(i, 2) - 1
            closed(i, 1) + 1, closed(i, 2) - 1
            closed(i, 1) - 1, closed(i, 2) - 0
            closed(i, 1) + 1, closed(i, 2) - 0
            closed(i, 1) - 1, closed(i, 2) + 1
            closed(i, 1) - 0, closed(i, 2) + 0
            closed(i, 1) + 1, closed(i, 2) + 1];
        
    end
   
    open

    %closed = seedPx(:, 1);
    %open = [];
    
    
    
    %size(closed, 1)
    
    IM = IM_orig;

end