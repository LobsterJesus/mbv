function IM = applyRotatingMaskFilter(IM_orig, area, mask)

    function m = getRotMaskMean(x)
        
        areas = mat2cell(x, mask, mask);
        minDiff = 255;
        minDiffMean = 0;
        
        for i = 1:size(areas(:), 1)
            
            d = max(areas{i}(:)) - min(areas{i}(:));
            
            if d < minDiff
                minDiff = d;
                minDiffMean = mean(areas{i}(:));
            end
                        
        end
        
        m = uint8(minDiffMean);
        
    end

    fun = @(x) getRotMaskMean(x);
    
    IM = nlfilter(IM_orig, area, fun);

end
