function [ y ] = mvnpdf( X, mu, Sigma )
% NORMAL - Multivariate normal density N(x; mu, Sigma)
    
    [N, d] = size(X);
    y = zeros(N, 1);
    denominator = sqrt((2*pi)^d*det(Sigma));
    for n=1:N
        x = X(n, :)';
        x_tilde = x - mu;
        y(n) = 1/denominator * exp(-0.5 * x_tilde'/Sigma*x_tilde);
    end
end

