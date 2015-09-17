function [ y ] = mvnpdf( X, mu, Sigma )
% NORMAL - Multivariate normal density N(x; mu, Sigma)
    
    [N, d] = size(X);
%     y = zeros(N, 1);
    denominator = sqrt((2*pi)^d*det(Sigma));
    X_tilde = X' - mu * ones(1, N);
    y = 1/denominator * exp(-0.5 .* diag(X_tilde'/Sigma*X_tilde));
%     for n=1:N
%         x = X(n, :)';
%         x_tilde = x - mu;
%         y(n) = 1/denominator * exp(-0.5 * x_tilde'/Sigma*x_tilde);
%     end
end

