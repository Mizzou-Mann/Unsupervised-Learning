function [ Prior, MU, SIGMA, scores ] = EM( X, T, prior, Mu, Sigma )
%EM - run EM algorithm for T iterations

[~, K] = size(prior);
[N, d] = size(X);
% Theta(t=1..T)
Prior = cell(1, T);
MU = cell(1, T);
SIGMA = cell(1, T);
% Log likelihood scores
scores = zeros(1, T);

t = 0;
while t < T
    Gamma = gamma_nk(X, prior, Mu, Sigma);
    for k=1:K
        % Expectation step
        g = Gamma(:,k) ./ sum(Gamma, 2);
        Nk = sum(g);
        
        % Maximization step
        Mu(:,k) = 1/Nk * X' * g;
        X_tilde = X' - Mu(:,k)*ones(1,N);
        Sigma(:,k) = vectorize_sigma( 1/Nk *  (ones(d,1)*g' .* X_tilde * X_tilde') );
        prior(k) = Nk / N;
    end

    % Check for convergence
    % We're assuming that EM algorithm will converge in T iteration
    t = t + 1;
    % Store Theta(t=1..T)
    Prior{t} = prior;
    MU{t} = Mu;
    SIGMA{t} = Sigma;
    
    scores(t) = log_P(X, prior, Mu, Sigma);
end