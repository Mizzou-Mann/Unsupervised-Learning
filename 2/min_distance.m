function [ d, k ] = min_distance( x, C )
% distance - Compute min distance from x to all clusters = min d(x, C)
%   C - clusters representative

    [m,~] = size(C);
    D = zeros(1, m);
    for i=1:m
        D(i) = d2(x, C(i,:));
    end
    [d, k] = min(D);
end

% Euclidean distance between x and y
function [ d ] = d2(x, y)
    x_tilte = x - y;
    d = sqrt(x_tilte * x_tilte');
end