function [boxes, numRed, numGreen, numBlue, numCirc, numRect] = ...
    findBlocks(IM)

    % Init parameters
    boxes = [];
    numRed = 0;
    numGreen = 0;
    numBlue = 0;
    numCirc = 0;
    numRect = 0;

    % Create grayscale image
    IM_gray = rgb2gray(IM);
    
    % Calculate threshold using Otsu's method
    level = graythresh(IM_gray);
    
    % Create binary image
    BW = 1 - im2bw(IM_gray, level);
    
    % Use morphological functions to clean up binary image 
    BW_morph = imfill(BW);
    
    % Find connected components in the image
    [L, num] = bwlabeln(BW_morph);
    
    % Read region properties
    stats = regionprops(L, 'Area', 'BoundingBox', 'PixelIdxList', ...
        'Eccentricity', 'Centroid', 'Perimeter', 'Orientation');
    
    % Discard structure elements with small areas
    stats = stats([stats.Area] > 10000);

    % Separate RGB channels
    R = IM(:, :, 1);
    G = IM(:, :, 2);
    B = IM(:, :, 3);

    % Iterate areas
    for i = 1:size(stats, 1)
    
        % Skip areas with invalid width/height ratio
        if abs(stats(i).BoundingBox(3) / stats(i).BoundingBox(4)) >= 10
            continue;
        end
        
        % Find dominant color
        idx = stats(i).PixelIdxList;

        meanR = mean(R(idx));
        meanG = mean(G(idx));
        meanB = mean(B(idx));
        maxMean = max([meanR, meanG, meanB]);

        if maxMean == meanR
            colorLabel = 'red';
            numRed = numRed + 1;
        elseif maxMean == meanG
            colorLabel = 'green';
            numGreen = numGreen + 1;
        else
            colorLabel = 'blue';
            numBlue = numBlue + 1;
        end

        % Determine shape
        if stats(i).Eccentricity <= 0.6
            shapeLabel = 'circle';
            numCirc = numCirc + 1;
        else
            shapeLabel = 'rectangle';
            numRect = numRect + 1;
        end

        % Get label position (center)
        labelPos = stats(i).Centroid;

        % Deaw label
        text(labelPos(1), labelPos(2), ...
            strcat(colorLabel, ', ', shapeLabel), ...
            'HorizontalAlignment', 'center', ...
            'VerticalAlignment', 'middle', ...
            'Color', 'black');

        % Draw bounding box
        rectangle('Position', stats(i).BoundingBox, ...
            'EdgeColor', 'r', 'LineWidth', 1);
        
        % Add bounding box to array
        boxes = [boxes, stats(i).BoundingBox];

    end

end