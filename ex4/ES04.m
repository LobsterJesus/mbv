%% Noise and Filters
IM = rgb2gray(imread('castle.jpg'));

% create noise images
IM_noise = imnoise(IM, 'salt & pepper');
IM_noise2 = imnoise(IM, 'gaussian', 0, 0.01);
IM_noise3 = imnoise(IM, 'gaussian', 0, 0.05);
IM_noise4 = imnoise(IM, 'gaussian', 0, 0.1);

% create some filters * * * * * * * * * * * * * * * * * * * * * * * * * * *
% average (smoothing)
filterAvg3x3 = reshape(repelem(1/9, 9), 3, 3);
filterAvg5x5 = reshape(repelem(1/25, 25), 5, 5);
filterAvg7x7 = reshape(repelem(1/49, 49), 7, 7);

% unsharp
filterUnsharp3x3 = zeros(3);
filterUnsharp3x3(2, 2) = 2;
filterUnsharp3x3 = filterUnsharp3x3 - filterAvg3x3;

% gaussian
filterGauss = fspecial('gaussian', [7 7], 1.5);
filterGauss2 = fspecial('gaussian', [7 7], 2);
filterGauss3 = fspecial('gaussian', [8 8], 2.1);
% * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

% apply nonlinear median filter for s&p noise
fun = @(x) median(x(:));
IM_median = nlfilter(IM_noise, [3 3], fun);
%IM_median = IM;

% salt & petter + denoise
subplot(2, 4, 1);
imshow(IM_noise);
title('salt & pepper noise');

subplot(2, 4, 5);
imshow(IM_median, []);
title('\uparrow 3 x 3 median filter');

% gaussian 1 + denoise
subplot(2, 4, 2);
imshow(IM_noise2);
title('gaussian noise (variance = 0.01)');

subplot(2, 4, 6);
imshow(conv2(IM_noise2, filterGauss), []);
title('\uparrow 7 x 7 gaussian blurring filter (\sigma = 1.5)');

% gaussian 2 + denoise
subplot(2, 4, 3);
imshow(IM_noise3);
title('gaussian noise (variance = 0.05)');

subplot(2, 4, 7);
imshow(conv2(IM_noise3, filterGauss2), []);
title('\uparrow 7 x 7 gaussian blurring filter (\sigma = 2)');

% gaussian 3 + denoise
subplot(2, 4, 4);
imshow(IM_noise4);
title('gaussian noise (variance = 0.1)');

subplot(2, 4, 8);
imshow(conv2(IM_noise4, filterGauss3), []);
title('\uparrow 8 x 8 gaussian blurring filter (\sigma = 2.1)');

%% Comic
clear;

IM = rgb2gray(imread('kim.png'));

filterLoG = ...
    [0.4038 0.8021 0.4038
    0.8021 -4.8233 0.8021
    0.4038 0.8021 0.4038];

subplot(1, 3, 1);
imshow(IM);
title('original');

IM_LoG = conv2(IM, filterLoG);

subplot(1, 3, 2);
imshow(IM_LoG, []);
title('Logarithm-of-Gaussian');

IM_sobel = edge(IM, 'Sobel', 0.03);

subplot(1, 3, 3);
imshow(255 - IM_sobel, []);
title('Sobel, inverted');

%% Non-linear filters
clear;

IM = rgb2gray(imread('kim.png'));

subplot(1, 2, 1);
imshow(IM);
title('original');

subplot(1, 2, 2);
imshow(applyMedianFilter(IM, [5 5]));
title('median');

figure;

subplot(1, 2, 1);
imshow(IM);
title('original');

subplot(1, 2, 2);
imshow(applyRotatingMaskFilter(IM, [4 4], [2 2]));
title('rotating mask');

figure;

subplot(1, 2, 1);
imshow(IM);
title('original');

subplot(1, 2, 2);
imshow(applyLocalContrastFilter(IM, [4 4]));
title('local contrast');

%% Pixelize
clear;

IM = rgb2gray(imread('kim.png'));

mask = roipoly(IM);

subplot(1, 2, 1);
imshow(IM);
title('original');

subplot(1, 2, 2);
imshow(pixelize(IM, mask, [5 5]));
title('pixelized image');
