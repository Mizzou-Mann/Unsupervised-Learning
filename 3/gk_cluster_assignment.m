function [ I ] = gk_cluster_assignment( X, c, Sigma )
% gk_cluster_assignment - Gustafson-Kessel cluster assignment

[N,~] = size(X);
[~,m] = size(c);
distance = zeros(N,m);

for i=1:N
    x = X(i,:)';
    distance(i,:) = gk_distance(x, c, Sigma);
end
[~, I] = min(distance, [], 2);