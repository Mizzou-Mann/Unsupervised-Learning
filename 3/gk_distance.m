function [ D ] = gk_distance( x, c, Sigma )
% distance - Compute gustafson-kessel distance d^2_GK(x, \Theta_j)

[l,m] = size(c);
D = zeros(m,1);

for j=1:m
    x_tilde = x - c(:,j);
    S = vec2sigma(Sigma(:,j), l);
    D(j) = det(S)^(1/l) * x_tilde'/S*x_tilde;
end