function h = imagesc_normal(x, y, N)

% h = imagesc_normal(x, y, N)
%
% This function will return an imagesc-style plot, but with the y-axis
% running from smallest number at the bottom to largest number at the top.
% x is a vector of i values for the x-axis bins, y is a vector of j values
% for the y-axis bins, and N is an i x j array of bin values.
%
% An example of its use would be to plot the output of hist3 e.g.
%   [N, xy] = hist3(randn(1000,2), [20 20]);
%   imagesc_normal(xy{1}, xy{2}, N);

% transpose N
N = N.';

% plot image
h = imagesc(x, y, N);

% set y-axis to correct orientation
set(gca, 'YDir', 'normal');