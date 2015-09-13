function [ g ] = gamma_nk( X, k_i, prior, mu, Sigma )
% GAMMA_NK - gamma n,k in the E-Step of EM algorithm
%            is defined as P(z_n = k|x_n, Theta)
%   where
%       Theta = < prior, mu, Sigma >

    [~, K] = size(prior);
    [N, d] = size(X);
    denominators = zeros(N, K);
    for k=1:K
        S = sigma_d(Sigma(:,k), d);
        denominators(:, k) = prior(k) * mvnpdf(X, mu(:,k), S);
    end
    g = denominators(:, k_i) ./ sum(denominators, 2);
end