%% Iterative optimal thresholding

segregateAndShow('cuphead.jpg');
segregateAndShow('castle.jpg');
segregateAndShow('seagull.jpg');

%% Thresholding
clear;
compareThresholds('ean.jpg', 0.8);
compareThresholds('page.jpg', 0.3);
compareThresholds('cameraman.jpg', 0.4);

% Conclusion:
% With 'ean.jpg', mode thresholding arguably yielded the best results, 
% though all methods produced a readable barcode.
% The Otsu and iterative method, when applied to 'page.jpg', resulted in 
% almost the same segmentation while the mode method cut off some of the
% text.
% Again, Otsu and the iterative method were almost indistinguishable when 
% applied to 'cameraman.jpg' and calculated the closest level to ground
% truth.
% Generally, Otsu and iterative levels were next to identical in the tests
% while the mode method over- or undershot the ground truth level
% significantly.

%% Region Growing
% -