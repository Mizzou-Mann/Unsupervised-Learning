function [ p ] = bernoulli( X, theta )
% BERNOULLI 

p = theta.^X(:,1) .* (1-theta).^X(:,2);