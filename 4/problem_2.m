% data
docs = {'what is the time' 'what is the day' 'what time is the meeting' 'cancel the meeting'};
words = {'what' 'is' 'the' 'time' 'day' 'meeting' 'cancel' 'when'};

M = length(words);
N = length(docs);

% numbers of word_i occurred in doc_j
C = zeros(M,N);
% normalized entropy
e = zeros(M,1);
for i=1:M
    for j=1:N
        C(i,j) = sum( strcmp(strsplit(docs{j}), words{i}) );
    end
    p = C(i,:)/sum(C(i,:));
    I = p.*log2(p);
    % cancel the effect of non-existing words
    e(i) = -1/log2(N) * sum(I(~isnan(I)));
end

% W matrix (words by documents)
W = zeros(M, N);
for j=1:N
    nj = length( strsplit(docs{j}) );
    for i=1:M
        W(i,j) =  (1-e(i)) * C(i,j)/nj;
    end
end
display(W);

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
V_bar = SR*V';
V2 = V_bar(1:k,:);
display(V2);

% test with new document
d5 = 'when is the meeting';
w_d5 = strsplit(d5);
nj = length( w_d5 );
C_i5 = zeros(M,1);
for i=1:M
    C_i5(i) = sum( strcmp(w_d5, words{i}) );
end
w_i5 = (1-e).*(C_i5/nj);
v_bar_5 = U(:,1:k)' * w_i5;
display(v_bar_5);

% compute distance from d5
D = zeros(1,N);
for j=1:N
    distance = V2(:,j) - v_bar_5;
    D(j) = sqrt(distance' * distance);
end
display(D);

% plot
figure; hold on;
scatter(V2(1,:), V2(2,:), '^');
labels = num2str((1:N)','d-%d');
text(V2(1,:), V2(2,:), labels, 'horizontal','left', 'vertical','bottom');
scatter(v_bar_5(1), v_bar_5(2), 'filled', 'd');
text(v_bar_5(1), v_bar_5(2), 'd-5', 'horizontal','left', 'vertical','bottom');
hold off;
title('Plot of scaled document vectors in 2-dimension');
legend('Command', 'Test document', 'Location', 'east');