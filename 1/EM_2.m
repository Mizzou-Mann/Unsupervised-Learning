function [ Theta, P ] = EM_2( X, T, prior, theta )
% EM_2 - EM procedure for problem 2

% Paramaters for t = 1..T
Theta = zeros(T, length(theta));
% P(z,x;theta) - the joint probability of z and x
P = cell(1, T);

t = 0;
while t < T
    % Expectation
    g_A = 1./(1 + bernoulli(X, theta(2)) ./ bernoulli(X, theta(1)));
    g_B = 1./(1 + bernoulli(X, theta(1)) ./ bernoulli(X, theta(2)));
    
    % Maximization
    theta(1) = 1/10 * 1/sum(g_A) * g_A' * X(:,1);
    theta(2) = 1/10 * 1/sum(g_B) * g_B' * X(:,1);

    % Check for convergence
    % We're assuming that EM algorithm will converge in T iteration
    t = t + 1;
    
    % Store Theta(t=1..T)
    Theta(t,:) = theta;
    P{t} = prior * [bernoulli(X, theta(1)), bernoulli(X, theta(2))];
end