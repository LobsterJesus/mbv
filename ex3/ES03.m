%% ITF
IM = rgb2gray(imread('castle.jpg'));

subplot(2, 2, 1);
imshow(IM);
title('original');

subplot(2, 2, 2);
imshow(applyITF(IM, window(220, 20)));
title('window ITF');

subplot(2, 2, 3);
imshow(applyITF(IM, gammaITF(0.5)));
title('gamma ITF');

subplot(2, 2, 4);
imshow(applyITF(IM, sigmoidITF(100, 20)));
title('sigmoid ITF');

%% Contrast Enhancement
clear;
IM_orig = rgb2gray(imread('contrast.jpg'));
subplot(2, 2, 1);
imshow(IM_orig);
title('original');

subplot(2, 2, 3);
plot(imhist(IM_orig) / numel(IM_orig));
title('histogram original');

IM_enhanced = applyITF(IM_orig, gammaITF(0.5));
subplot(2, 2, 2);
imshow(IM_enhanced);
title('enhanced');

subplot(2, 2, 4);
plot(imhist(IM_enhanced) / numel(IM_enhanced));
title('histogram enhanced');

%% Posterize
clear;
IM_orig = rgb2gray(imread('castle.jpg'));

subplot(2, 2, 1);
imshow(IM_orig);
title('original');

subplot(2, 2, 3);
plot(imhist(IM_orig) / numel(IM_orig));
title('histogram original');

%IM_post = posterize(IM_orig, 3);
IM_post = posterize(IM_orig, [0.3 0.5 0.9]);
subplot(2, 2, 2);
imshow(IM_post);
title('posterized');

subplot(2, 2, 4);
plot(imhist(IM_post) / numel(IM_post));
title('histogram posterized');

%% ITF effects
clear;

% original
IM_orig = imread('plants.jpg');

subplot(2, 3, 1);
imshow(IM_orig);
title('original');

subplot(2, 3, 4);
plot(imhist(IM_orig(:, :, 1)) / numel(IM_orig(:, :, 1)), 'r');
hold on;
plot(imhist(IM_orig(:, :, 2)) / numel(IM_orig(:, :, 2)), 'g');
hold on;
plot(imhist(IM_orig(:, :, 3)) / numel(IM_orig(:, :, 3)), 'b');

title('histogram original');

% effect
IM_effect = imread('plants_effect.jpg');
subplot(2, 3, 2);
imshow(IM_effect);
title('effect "Palma"');

subplot(2, 3, 5);
plot(imhist(IM_effect(:, :, 1)) / numel(IM_effect(:, :, 1)), 'r');
hold on;
plot(imhist(IM_effect(:, :, 2)) / numel(IM_effect(:, :, 2)), 'g');
hold on;
plot(imhist(IM_effect(:, :, 3)) / numel(IM_effect(:, :, 3)), 'b');
title('histogram effect');

% approximated
IM_approx = IM_orig;
% IM_approx(:, :, 1) = applyITF(IM_approx(:, :, 1), gammaITF(1.3));
% IM_approx(:, :, 2) = applyITF(IM_approx(:, :, 2), gammaITF(1.3));
% IM_approx(:, :, 3) = applyITF(IM_approx(:, :, 3), gammaITF(1.0));
% 
% IM_approx(:, :, 1) = applyITF(IM_approx(:, :, 1), gammaITF(0.5, 200, 50));
% IM_approx(:, :, 2) = applyITF(IM_approx(:, :, 2), gammaITF(0.4, 200, 50));
% IM_approx(:, :, 3) = applyITF(IM_approx(:, :, 3), gammaITF(1, 200, 50));

IM_approx(:, :, 1) = applyITF(IM_approx(:, :, 1), sigmoidITF(150, 80));
IM_approx(:, :, 2) = applyITF(IM_approx(:, :, 2), sigmoidITF(150, 60));
IM_approx(:, :, 3) = applyITF(IM_approx(:, :, 3), sigmoidITF(150, 40));

IM_approx(:, :, 1) = applyITF(IM_approx(:, :, 1), gammaITF(0.8));
IM_approx(:, :, 2) = applyITF(IM_approx(:, :, 2), gammaITF(0.8));

subplot(2, 3, 3);
imshow(IM_approx);
title('approximated');

subplot(2, 3, 6);
plot(imhist(IM_approx(:, :, 1)) / numel(IM_approx(:, :, 1)), 'r');
hold on;
plot(imhist(IM_approx(:, :, 2)) / numel(IM_approx(:, :, 2)), 'g');
hold on;
plot(imhist(IM_approx(:, :, 3)) / numel(IM_approx(:, :, 3)), 'b');
title('histogram approximated');


%% White Balance
clear;
IM_orig = imread('whitebalance.png');

subplot(2, 2, 1);
w = impixel(IM_orig);
title('original');

subplot(2, 2, 3);
plot(imhist(IM_orig) / numel(IM_orig));
title('histogram original');

IM_wbal = IM_orig;

IM_wbal(:, :, 1) = (255 / w(1)) .* IM_wbal(:, :, 1) ;
IM_wbal(:, :, 2) = (255 / w(2)) .* IM_wbal(:, :, 2) ;
IM_wbal(:, :, 3) = (255 / w(3)) .* IM_wbal(:, :, 3) ;

subplot(2, 2, 2);
imshow(IM_wbal);
title('white balanced');

subplot(2, 2, 4);
plot(imhist(IM_wbal) / numel(IM_wbal));
title('histogram white balanced');