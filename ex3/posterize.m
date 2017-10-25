function IM = posterize(IM_orig, parts)
    
    if (size(parts, 2) == 1)

        cvals = repelem(256 / parts, parts);
        cvals = cvals .* (1:parts);
        cvals = uint8(cvals);
   
    else
       
        cvals = parts .* 256;
        parts = numel(parts);
        
    end
    
    if mod(256, parts) ~= 0
        itf = [repelem(cvals, floor(256 / parts)), repelem(0, mod(256, parts))];
    else
        itf = repelem(cvals, floor(256 / parts));
    end

    IM = uint8(itf(IM_orig + 1));

end