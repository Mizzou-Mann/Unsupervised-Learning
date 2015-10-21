function [ C, SIGMA, total_distance ] = gustafson_kessel( X, c, Sigma, q, T )
% gustafson_kessel - Run Gustafson-Kessel (G-K) clustering algorithm
%
%           X       - Dataset
%           C       - Cluster centers
%           Sigma   - Cluster covariances
%           q       - Fuzzifier
%           T       - Number of iterations

[N,l] = size(X);
[~,m] = size(c);
p = 1/(q-1);

C = cell(1,T);
SIGMA = cell(1,T);
total_distance = zeros(1,T);

for t=1:T
    U = zeros(N, m);
    for i=1:N
        D = gk_distance(X(i,:)', c, Sigma);
        for j=1:m
            U(i,j) = 1/(sum( (D(j)./D).^p ));
        end
    end
    % parameter update
    denominator = sum(U.^q);
    for j=1:m
         c(:,j) = sum((U(:,j).^q*ones(1,l)) .* X) / denominator(j);
         X_tilde = X' - c(:,j)*ones(1,N);
         S = (ones(l,1)*U(:,j)'.^q) .* X_tilde * X_tilde' ./ denominator(j);
         Sigma(:,j) = sigma2vec(S);
    end
    total_distance(t) = gk_total_distance(X, c, Sigma);
    C{t} = c;
    SIGMA{t} = Sigma;
end