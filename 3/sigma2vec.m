function [ v ] = sigma2vec( S )
% sigma2vec - Vectorized form of covariance matrix

l = length(S);
v = zeros(l*(l+1)/2, 1);
ind = 1;

for i=1:l
    for j=i:l
        v(ind) = S(i, j);
        ind = ind + 1;
    end
end
