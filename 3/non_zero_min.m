function [ v ] = non_zero_min( X )
% NON_ZERO_MIN - Get a single non zero min in X

% vectorize
v = X(:);
% remove all zero
v(v==0) = [];
v = min(v);