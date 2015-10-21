function [ distortion, I ] = total_distortion( X, Theta )
% total_distortion - compute total distortion

[N,d] = size(X);
[~,m] = size(Theta);
S = zeros(N,d);
I = cluster_assignment(X, Theta);

for j=1:m
    S(I==j,:) = ones(nnz(I==j),1) * Theta(:,j)';
end
distortion = sum( sum( (X-S).^2 ) );


function [ I ] = cluster_assignment( X, Theta )
% cluster_assignment - assign X to clusters

[N,~] = size(X);
[~,m] = size(Theta);
D = zeros(N, m);

for j=1:m
    theta = ones(N,1) * Theta(:,j)';
    D(:, j) = sum((X - theta).^2, 2);
end
[~,I] = min(D, [], 2);