function [ C ] = bsas( X, Theta, q )
% bsas - Basic Sequential Clustering Algorithm
%
%       X       : sequential dataset
%       Theta   : clustering threshold
%       q       : maximum number of allowed clusters

[N,~] = size(X);

% numbers of cluster
m = 1;
C = {1};
% clusters representative
R = X(C{m},:);
for i=2:N
    [d, ck] = min_distance(X(i,:), R);
    if d > Theta && m < q
        m = m + 1;
        C{m} = i;
        R(m,:) = X(i,:);
    else
        nc = length(C{ck});
        C{ck} = [C{ck} i];
        % update representative
        % mc_new = (nc*mc+x) / (nc+1)
        R(ck,:) = (nc*R(ck,:) + X(i,:)) / (nc+1);
    end
end