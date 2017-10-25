function IM = applyMedianFilter(IM_orig, area)

    if nargin == 1 
        area = [3 3];
    end

    fun = @(x) median(x(:));
    IM = nlfilter(IM_orig, area, fun);

end