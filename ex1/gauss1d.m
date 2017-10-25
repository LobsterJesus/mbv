function f = gauss1d(x, sigma)
%GAUSS1D Problem 3 Gauss function

f = (1 / sqrt(2 * pi * sigma)) .* exp(-(x .^ 2) / (2 * sigma ^ 2));

end

