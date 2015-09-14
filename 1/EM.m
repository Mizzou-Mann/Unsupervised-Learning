function [ prior, Mu, Sigma, scores ] = EM( X, T, prior, Mu, Sigma )
%EM - run EM algorithm for T iterations

[~, K] = size(prior);
[N, ~] = size(X);
% Log likelihood scores
scores = zeros(1, T);

t = 0;
while t < T
    for k=1:K
        % Expectation step
        g = gamma_nk(X, k, prior, Mu, Sigma);
        Nk = sum(g);
        
        % Maximization step
        Mu(:,k) = 1/Nk * sum(g*ones(1, 2) .* X)';
        X_tilde = X' - Mu(:,k)*ones(1,N);
        Sigma(:,k) = vectorize_sigma( 1/Nk *  (ones(2,1)*g' .* X_tilde * X_tilde') );
        prior(k) = Nk / N;
    end

    % Check for convergence
    % We're assuming that EM algorithm will converge in T iteration
    t = t + 1;
    scores(t) = log_P(X, prior, Mu, Sigma);
end


