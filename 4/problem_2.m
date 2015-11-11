% data
docs = {'what is the time' 'what is the day' 'what time is the meeting' 'cancel the meeting'};
words = {'what' 'is' 'the' 'time' 'day' 'meeting' 'cancel' 'when'};

m = length(words);
N = length(docs);

% numbers of word_i occurred in doc_j
C = zeros(m,N);
% normalized entropy
e = zeros(1,m);
for i=1:m
    for j=1:N
        C(i,j) = sum( strcmp(strsplit(docs{j}), words{i}) );
    end
    p = C(i,:)/sum(C(i,:));
    I = p.*log2(p);
    % cancel the effect of non-existing words
    e(i) = -1/log2(N) * sum(I(~isnan(I)));
end

% W matrix (words by documents)
W = zeros(m, N);
for j=1:N
    nj = length( strsplit(docs{j}) );
    for i=1:m
        W(i,j) =  (1-e(i)) * C(i,j)/nj;
    end
end

% SVD decomposition
[U,S,V] = svd(W);
display(U);
display(S);
display(V);

% scaled document vectors
SR = diag( diag(S) );
R = length(SR);
% numbers of dimensions to keep
k = 2;
V_bar = SR*V(:,1:R)';
V_bar_2 = V_bar(:,1:k);
display(V_bar_2);