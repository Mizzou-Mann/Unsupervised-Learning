function [ total_distance ] = gk_total_distance( X, c, Sigma )
% gk_total_distance - Compute gustafson-kessel total distance

[N,~] = size(X);
[~,m] = size(c);
distance = zeros(N,m);

for i=1:N
    x = X(i,:)';
    distance(i,:) = gk_distance(x, c, Sigma);
end
total_distance = sum( min(distance, [], 2) );