function [ y ] = mvnpdf( X, mu, Sigma )
% NORMAL - Multivariate normal density N(x; mu, Sigma)
    
    [N, d] = size(X);

    denominator = sqrt((2*pi)^d*det(Sigma));
    X_tilde = X' - mu * ones(1, N);
    y = 1/denominator * exp(-0.5 .* diag(X_tilde'/Sigma*X_tilde));
end

