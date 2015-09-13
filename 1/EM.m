function [ prior, mu, Sigma ] = EM( X, T, prior, mu, Sigma )
%EM - run EM algorithm for T iterations

[~, K] = size(prior);
[N, ~] = size(X);

t = 0;
while t < T
    for k=1:K
        % Expectation step
        g = gamma_nk(X, k, prior, mu, Sigma);
        Nk = sum(g);
        
        % Maximization step
        mu{k} = 1/Nk * sum(g*ones(1, 2) .* X)';
        X_tilde = X' - mu{k}*ones(1,N);
        Sigma{k} = 1/Nk *  (ones(2,1)*g' .* X_tilde * X_tilde');
        prior(k) = Nk / N;
    end

    % Check for convergence
    % We're assuming that EM algorithm will converge in T iteration
    t = t + 1;
end


