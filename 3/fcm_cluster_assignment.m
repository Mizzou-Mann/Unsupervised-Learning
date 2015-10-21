function [ I ] = fcm_cluster_assignment( X, Theta )
% cluster_assignment - assign X to clusters

[N,~] = size(X);
[~,m] = size(Theta);
distance = zeros(N,m);

for i=1:N
    x = X(i,:)';
    distance(i,:) = point_distance(x, Theta);
end
[~,I] = min(distance, [], 2);