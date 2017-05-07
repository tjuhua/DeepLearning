function [Z] = zca2(x)
epsilon = 1e-4;
% You should be able to use the code from your PCA/ZCA exercise
% Retain all of the components from the ZCA transform (i.e. do not do
% dimensionality reduction)

% x is the input patch data of size
% z is the ZCA transformed data. The dimenison of z = x.
[m, n] = size(x);
y = x - mean(x, 1);
cov = y * y.' / n;
[U, S, V] = svd(y);
y_rot = U.' * y;
y_whitened = diag(1./sqrt(diag(S) + epsilon));
z = U * y_whitened;