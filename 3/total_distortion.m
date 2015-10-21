function [ distortion ] = total_distortion( X, Theta )
% total_distortion - compute total distortion

[N,~] = size(X);
[~,m] = size(Theta);
distance = zeros(N,m);

for i=1:N
    x = X(i,:)';
    distance(i,:) = point_distance(x, Theta);
end
distortion = sum( min(distance, [], 2) );