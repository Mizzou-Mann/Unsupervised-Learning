function [I, Mu, D] = k_mean( X, Mu )
% k_mean - run k-mean algorithm
%       X   - dataset
%       Mu  - clusters center (centroids)
%       D   - total distortion

    D = [];
    t = 1;

    while true
        I  = cluster_assignment(X, Mu);
        Mu = centroid_update(X, I);
        D(t) = distortion(X, Mu, I);
        if t > 1 && D(t) == D(t-1)
            break;
        end
        t = t + 1;
    end
end

function [ I ] = cluster_assignment( X, Mu )
% cluster_assignment in k-mean algorithm

    [~, m] = size(Mu);
    [N, ~] = size(X);
    D = zeros(N, m);
    for i=1:m
        mu = ones(N,1) * Mu(:,i)';
        D(:, i) = sum((X-mu).^2, 2);
    end
    [~, I] = min(D, [], 2);
end

function [ Mu ] = centroid_update( X, I )
% centroid_update in k-mean algorithm
%       X - dataset
%       I - clusters assignment

    [~, d] = size(X);
    K = unique(I)';
    Mu = zeros(d, length(K));
    
    for i=1:length(K)
        Mu(:,i) = mean(X(I == K(i), :))';
    end
end

function [ D ] = distortion( X, Mu, I )
% distortion - total distortion of the predicted clusters center
%       X  - dataset
%       Mu - clusters centroid
%       I  - clusters assignment

    [~, m] = size(Mu);
    [N, d] = size(X);
    
    S = zeros(N, d);
    for i=1:m
        S(I==i,:) = ones(nnz(I==i), 1) * Mu(:, i)';
    end
    D = sum( sum( (X-S).^2 ) );
end
