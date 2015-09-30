function [ D ] = load_data( seq )
% load_data - load data given a particular sequence

X = [[1 1]; [1 2]; [2 2]; [2 3]; [3 3]; [3 4]; [4 4]
    [4 5]; [5 5]; [5 6]; [-4 5]; [-3 5]; [-4 4]; [-3 4]];

[n, d] = size(X);
N = length(seq);
ex = nnz(seq > n);
if ex ~= 0
    error([num2str(ex) ' number(s) in the sequence exceed the range.']);
end

D = zeros(N, d);

for i=1:N
    D(i,:) = X(seq(i),:);
end