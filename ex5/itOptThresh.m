function level = itOptThresh(IM_orig)
    
    % create grayscale image
    IM = rgb2gray(IM_orig);
    
    % create logical matrix for corners
    corners = zeros(size(IM, 1), size(IM, 2));
    corners(1, 1) = 1;
    corners(1, size(corners, 2)) = 1;
    corners(size(corners, 1), 1) = 1;
    corners(size(corners, 1), size(corners, 2)) = 1;
    
    % init back- and foreground set
    meanBg = mean(IM(IM & corners));
    meanFg = mean(IM(IM & ~corners));
    
    if isnan(meanBg)
        meanBg = 0;
    end
    
    if isnan(meanFg)
        meanFg = 0;
    end
    
    % init t
    t = 0.5 * (meanBg + meanFg);
    tOld = t;
     
    % calculate t until diff to old t < 1
    for i = 1:10

        t = 0.5 * (mean(IM(IM < t)) + mean(IM(IM > t)));
        
        if abs(t - tOld) < 1 
           break; 
        end
        
        tOld = t;
        
    end
   
    % normalize and return
    level = t / 255;
   
    
end