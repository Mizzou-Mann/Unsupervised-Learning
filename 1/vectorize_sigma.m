function [ v ] = vectorize_sigma( Sigma )
% VECTORIZE_SIGMA( Sigma ) - Vectorize covariance \Sigma for 
%   memory efficiency.

% Get upper-triangle
S = triu(Sigma);
% Vectorize matrix S
v = S(:);
% Remove all zeros from v
v(v==0) = [];

