function [ score ] = log_P( X, prior, Mu, Sigma )
% LOG_P( X, prior, Mu, Sigma ) - Compute the log likelihood scores
%   log P( X|Theta ).
   
[~, K] = size(prior);
[N, d] = size(X);
P = zeros(N, K);

for k=1:K
    S = sigma_d(Sigma(:,k), d);
    P(:,k) = prior(k) * mvnpdf(X, Mu(:,k), S);
end
score = sum( log( sum(P, 2)));