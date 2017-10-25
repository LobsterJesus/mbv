function compareThresholds(filename, groundTruthLevel)

    IM = imread(filename);

    figure;

    subplot(2, 3, 1);
    imshow(IM);
    title('original');

    levelIntOpt = itOptThresh(IM);
    levelOtsu = graythresh(IM);
    levelMode = modeThresh(IM);

    subplot(2, 3, 2);

    [h, e] = imhist(IM);
    plot(e / 255, h);
    line([levelIntOpt levelIntOpt], [1 max(h)], 'Color', 'r');
    line([levelOtsu levelOtsu], [1 max(h)], 'Color', 'g');
    line([levelMode levelMode], [1 max(h)], 'Color', 'm');
    line([groundTruthLevel groundTruthLevel], [1 max(h)], 'Color', 'c');

    legend('histogram', 'iterative optimal', 'Otsu', 'Mode', 'ground truth');
    title('thresholds');

    subplot(2, 3, 3);
    imshow(im2bw(IM, groundTruthLevel));
    title('ground truth');

    subplot(2, 3, 4);
    imshow(im2bw(IM, levelIntOpt));
    title('Iterative (optimal)');

    subplot(2, 3, 5);
    imshow(im2bw(IM, levelOtsu));
    title('Otsu');

    subplot(2, 3, 6);
    imshow(im2bw(IM, levelMode));
    title('Mode');

end