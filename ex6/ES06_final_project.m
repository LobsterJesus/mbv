%% Final Project: Block-Counting

% Read sample images
images = {
    imread('BLOCKS/BLOCKS_001.jpg')
    imread('BLOCKS/BLOCKS_002.jpg')
    imread('BLOCKS/BLOCKS_003.jpg')
    imread('BLOCKS/BLOCKS_004.jpg')
};

% Iterate and plot images with object information
for i = 1:4
   
    subplot(2, 2, i);
    imshow(images{i});
    hold on;
    
    [boxes, numRed, numGreen, numBlue, numCirc, numRect] = ...
        findBlocks(images{i});
    
    title(sprintf('%i red, %i green, %i blue, %i circ, %i rect', ...
        numRed, numGreen, numBlue, numCirc, numRect));
    
end



