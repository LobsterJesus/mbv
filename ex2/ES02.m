%% Problem 1.a: Restore the original version (see Fig. 2) and save it to 
%  file 15-puzzle_restored.jpg.
IM = imread('15-puzzle_scrambled.jpg');

% Rotate
IM = imrotate(IM, -35);

% Crop
IM = IM(700:2168, 700:2168);

% Shift
IM = circshift(IM, -400, 2);
IM = circshift(IM, -592, 1);

% Save
imwrite(IM, '15-puzzle_restored.jpg');

%% Problem 1.b: Save a cropped version containing only the puzzle without 
%  the background and save it to file 15-puzzle_cropped.png.
IM2 = IM(211:1287, 189:1276);

imwrite(IM2, '15-puzzle_cropped.png');

%% Problem 1.c: Extract all individual tiles and save them to files 
% tile_1.png, tile_2.png``, ...tile_15.png‘ with size 64x64

% Crop to include tiles only
IM3 = IM2(46:1032, 49:1032);

% Resize to 64 * 4 x 64 * 4
IM3 = imresize(IM3, [256 256]);

% Create tile array with 64 x 64 subarrays
tiles = mat2cell(IM3, [64 64 64 64], [64 64 64 64]);

% Save tiles (no loops! arrayfunc?)
imwrite(tiles{1}, 'tile_1.png');
imwrite(tiles{2}, 'tile_5.png');
imwrite(tiles{3}, 'tile_9.png');
imwrite(tiles{4}, 'tile_13.png');
imwrite(tiles{5}, 'tile_2.png');
imwrite(tiles{6}, 'tile_6.png');
imwrite(tiles{7}, 'tile_10.png');
imwrite(tiles{8}, 'tile_14.png');
imwrite(tiles{9}, 'tile_3.png');
imwrite(tiles{10}, 'tile_7.png');
imwrite(tiles{11}, 'tile_11.png');
imwrite(tiles{12}, 'tile_15.png');
imwrite(tiles{13}, 'tile_4.png');
imwrite(tiles{14}, 'tile_8.png');
imwrite(tiles{15}, 'tile_12.png');

%% Problem 1.d: Create a new image 15-puzzle_reversed.jpg with all tiles 
% of the puzzle in reversed order
IM4 = cell2mat(rot90(tiles, 2));

imwrite(IM4, '15-puzzle_reversed.jpg');

%% Problem 1.e: Create a plot of the intensity values on the main diagonal 
% in 15-puzzle_scrambled.jpg.
IM = imread('15-puzzle_scrambled.jpg');

% Get intensity values of diagonal
d = diag(IM);

plot(d);
xlabel('position in diagonal');
ylabel('intensity value');

%% Problem 1.f: Create a plot of the minimum, maximum, mean and median 
% (gray-)values of the individual tiles. Include a title, proper 
% annotations of axes, etc.

minValues = [
    min(tiles{1}(:)), min(tiles{2}(:)), min(tiles{3}(:)), min(tiles{4}(:)), ...
    min(tiles{5}(:)), min(tiles{6}(:)), min(tiles{7}(:)), min(tiles{8}(:)), ...
    min(tiles{9}(:)), min(tiles{10}(:)), min(tiles{11}(:)), min(tiles{12}(:)), ...
    min(tiles{13}(:)), min(tiles{14}(:)), min(tiles{15}(:)), min(tiles{16}(:))
    ];

maxValues = [
    max(tiles{1}(:)), max(tiles{2}(:)), max(tiles{3}(:)), max(tiles{4}(:)), ...
    max(tiles{5}(:)), max(tiles{6}(:)), max(tiles{7}(:)), max(tiles{8}(:)), ...
    max(tiles{9}(:)), max(tiles{10}(:)), max(tiles{11}(:)), max(tiles{12}(:)), ...
    max(tiles{13}(:)), max(tiles{14}(:)), max(tiles{15}(:)), max(tiles{16}(:))
    ];

meanValues = [
    mean(tiles{1}(:)), mean(tiles{2}(:)), mean(tiles{3}(:)), mean(tiles{4}(:)), ...
    mean(tiles{5}(:)), mean(tiles{6}(:)), mean(tiles{7}(:)), mean(tiles{8}(:)), ...
    mean(tiles{9}(:)), mean(tiles{10}(:)), mean(tiles{11}(:)), mean(tiles{12}(:)), ...
    mean(tiles{13}(:)), mean(tiles{14}(:)), mean(tiles{15}(:)), mean(tiles{16}(:))
    ];

medianValues = [
    median(tiles{1}(:)), median(tiles{2}(:)), median(tiles{3}(:)), median(tiles{4}(:)), ...
    median(tiles{5}(:)), median(tiles{6}(:)), median(tiles{7}(:)), median(tiles{8}(:)), ...
    median(tiles{9}(:)), median(tiles{10}(:)), median(tiles{11}(:)), median(tiles{12}(:)), ...
    median(tiles{13}(:)), median(tiles{14}(:)), median(tiles{15}(:)), median(tiles{16}(:))
    ];

figure;
plot(minValues);
title("Min/Max/Mean/Median Values of Individual Tiles");
xlabel("tile index");
ylabel("grayscale value");
hold on;
plot(maxValues);
hold on;
plot(meanValues);
hold on;
plot(medianValues);
legend("min", "max", "mean", "median");

%% Problem 2: Color Images
clear;

% Load and display a color image
figure;
IM = imread('castle.jpg');
imshow(IM);

% Separate the RGB channels and separate them separately 
% (in the same figure)
channelRed = IM(:,:,1);
channelGreen = IM(:,:,2);
channelBlue = IM(:,:,3);
blank = zeros(size(IM, 1), size(IM, 2));

figure;
subplot(2, 2, 1);
imshow(cat(3, channelRed, blank, blank));
title("\color{red}red channel");

hold on;
subplot(2, 2, 2);
imshow(cat(3, blank, channelGreen, blank));
title("\color{green}green channel");

hold on;
subplot(2, 2, 3);
imshow(cat(3, blank, blank, channelBlue));
title("\color{blue}blue channel");

% Calculate grey scale image and display (in the same figure)
hold on;
subplot(2, 2, 4);
imshow(rgb2gray(IM));
title("grayscale image");

% Convert to indexed image, change the color map and display
[IM2, map] = rgb2ind(IM, 4);

map = [
    0.4431 0.5882 0.6235
    0 0.1921 0.3098
    0.8470 0.0980 0.1294
    0.9882 0.8941 0.6588];

figure;
imshow(ind2rgb(IM2, map));
title("changed color map");

% Convert to HSV, experiment
IM3 = rgb2hsv(IM);

% Intensify colors
IM3_sat = IM3;
IM3_sat(:, :, 2) = IM3_sat(:, :, 2) + 0.5;

% Intensify brightness
IM3_val = IM3;
IM3_val(:, :, 3) = IM3_val(:, :, 3) + 0.5;

% Shift colors
IM3_col = IM3;
IM3_col(:, :, 1) = IM3_col(:, :, 1) + 0.5;

% Intensify colors
figure;

subplot(1, 3, 1);
imshow(hsv2rgb(IM3_sat));
title("saturation intensified");

subplot(1, 3, 2);
imshow(hsv2rgb(IM3_val));
title("value intensified");

subplot(1, 3, 3);
imshow(hsv2rgb(IM3_col));
title("colors shifted");

%% Problem 3: Vignetting
% -

%% Problem 4: Color isolation
% -
