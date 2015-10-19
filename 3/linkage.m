function [ R, l ] = linkage( D, algorithm )
% linkage - Agglomerative linkage algorithm
%
%       D           : dissimilarity matrix
%       algorithm   : 'single' or 'complete'

[N,~] = size(D);
R = cell(N,1);
l = zeros(N, 1);

% start with every point is a cluster by itself
R{1} = vec2cell(1:N);
for t=2:N-1
    % upper triangular
    U = triu(D);
    l(t) = non_zero_min(U);
    [r, s] = find(U == l(t));
    % merge r and s
    R{t} = merge(R{t-1}, r, s);
    D = update(D, r, s, algorithm);
end
R{N} = {1:N};
l(N) = non_zero_min(D);

function [ D ] = update(D, r, s, algorithm)
% update - Update distance matrix

dr = D(r,:);
dr([r s]) = [];
ds = D(s,:);
ds([r s]) = [];

% remove merge rows and columns
D([r s],:) = [];
D(:,[r s]) = [];

if strcmpi(algorithm, 'single')
    dq = min([dr;ds]);
elseif strcmpi(algorithm, 'complete')
    dq = max([dr;ds]);
end

D = [dq' D];
D = [0 dq; D];
