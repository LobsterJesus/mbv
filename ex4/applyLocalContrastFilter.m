function IM = applyLocalContrastFilter(IM_orig, area)

    fun = @(x) max(x(:)) - min(x(:));
    
    IM = nlfilter(IM_orig, area, fun);

end
