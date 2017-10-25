function segregateAndShow(filename)

    IM = imread(filename);

    figure;
    
    subplot(1, 2, 1);
    imshow(IM);

    level = itOptThresh(IM);
    IM_bin = im2bw(IM, level);

    subplot(1, 2, 2);
    imshow(IM_bin);

end