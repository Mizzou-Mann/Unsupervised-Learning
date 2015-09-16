function [ p ] = bernoulli( X, theta )
% BERNOULLI - Bernoulli distribution density function

p = theta.^X(:,1) .* (1-theta).^X(:,2);