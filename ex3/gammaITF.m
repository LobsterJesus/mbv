function itf = gammaITF(gamma, center, width)

    itf = linspace(0, 1, 255);
    
    if nargin == 3
        
        itf(center - width : center + width - 1) = itf(center - width : center + width - 1) .^ gamma;
        itf = itf * 255 + 1;
        
    else
        
        itf = itf .^ gamma * 256 + 1;
        
    end
        
end

