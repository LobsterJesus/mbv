function itf = sigmoidITF(center, width)

    itf = 1:256;
    itf = 255 ./ (1 + exp(-((itf - center) / width)));

end