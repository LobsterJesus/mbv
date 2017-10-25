function level = modeThresh(IM_orig)
    
    h = imhist(IM_orig);
    
    % detect maxima
    isMax = islocalmax(h);
    
    % remove non-max elements
    maxima = h(h & isMax);
    
    % create index matrix and remove non-max indices
    maximaIndices = (1:256).';
    maximaIndices = maximaIndices(maximaIndices & isMax);

    % sort maxima array, get indices of 2 highest local maxima
    [maxima, I] = sort(maxima, 'descend');
    m1 = maximaIndices(I(1));
    m2 = maximaIndices(I(2));
    
    % get index of minimum between m1 and m2
    if m1 <= m2
        [m, minI] = min(h(m1:m2));
        minI = minI + m1;
    else
        [m, minI] = min(h(m2:m1));
        minI = minI + m2;
    end
       
    % normalize and return
    level = minI / 255;
    
end