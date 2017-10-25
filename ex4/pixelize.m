function IM = pixelize(IM_orig, mask, pixelSize)

    fun = @(x) uint8(ones(size(x.data))) * mean(x.data(:));
    IM = blockproc(IM_orig, pixelSize, fun);

    IM = IM .* uint8(mask);
    
    IM = imadd(IM_orig .* (1 - uint8(mask)), IM);
    
%     fun = @(x) median(x(:));
%     IM = nlfilter(IM_orig, area, fun);

end