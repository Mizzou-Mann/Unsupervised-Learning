function [ D ] = point_distance( x, c )
% distance - Compute distance from x to set of points c
%            d = (x-c)'A(x-c) by assuming that A = I

[l,m] = size(c);
A = eye(l);
D = zeros(m,1);

for j=1:m
    x_tilde = x - c(:,j);
    D(j) = x_tilde'*A*x_tilde;
end