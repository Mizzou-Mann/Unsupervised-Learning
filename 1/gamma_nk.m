function [ Gamma ] = gamma_nk( X, prior, mu, Sigma )
% GAMMA_NK - Compute gamma n,k for all K in the E-Step of EM algorithm
%            is defined as P(z_n = k|x_n, Theta)
%   where
%       Theta = < prior, mu, Sigma >

    [~, K] = size(prior);
    [N, d] = size(X);
    Gamma = zeros(N, K);
    for k=1:K
        S = sigma_d(Sigma(:,k), d);
        Gamma(:, k) = prior(k) * mvnpdf(X, mu(:,k), S);
    end
end