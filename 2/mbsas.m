function [ C ] = mbsas( X, Theta, q )
% mbsas - Modified Basic Sequential Clustering Algorithm
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

% class determination
for i=2:N
    [d,~] = min_distance(X(i,:), R);
    if d > Theta && m < q
        m = m + 1;
        C{m} = i;
        R(m,:) = X(i,:);
    end
end

% pattern classification
classified = cell2mat(C);
for i=1:N
   if ~nnz(classified == i)
       [~, ck] = min_distance(X(i,:), R);
       nc = length(C{ck});
       C{ck} = [C{ck} i];
       % update representative
       % mc_new = (nc*mc+x) / (nc+1)
       R(ck,:) = (nc*R(ck,:) + X(i,:)) / (nc+1);
   end
end