function [ k ] = classify( K, X, prior, Mu, Sigma )
% CLASSIFY - Hard boundary classification for X
%   so that each data point is belong to only one class.
%   Find k* = argmax_k P(z_n = k|x_n; \Theta').

[N, d] = size(X);
P = zeros(N, length(K));

for j=K
    S = sigma_d( Sigma(:,j), d );
    P(:,j) = prior(j) * mvnpdf(X, Mu(:,j), S);
end
% row-based max
[~, k] = max(P, [], 2);