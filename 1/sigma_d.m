function [ Sigma ] = sigma_d ( v, d )
% SIGMA_D( v, d ) - Convert a vector into d * d symmetric matrix

if d*(d+1)/2 ~= length(v)
    error('The required elements mismatch with the dimensionalty.');
end

Sigma = zeros(d, d);

index = 1;
for i=1:d
    for j=i:d
        Sigma(i, j) = v(index);
        index = index + 1;
    end
end

Sigma = Sigma + triu(Sigma, 1)';