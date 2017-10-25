function itf = window(center, width)

    itf = zeros(1, 256);
    itf(center - width : center + width - 1) = linspace(1, 256, width * 2);

end

