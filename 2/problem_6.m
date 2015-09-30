% load data
X = [[1 1]; [1 2]; [2 2]; [2 3]; [3 3]; [3 4]; [4 4]
    [4 5]; [5 5]; [5 6]; [-4 5]; [-3 5]; [-4 4]; [-3 4]];

% clustering parameters
q = 14;
Theta = sqrt(2);

% run clustering algorithm
% a.
seq = 1:14;
A = X(seq,:);
A_bsas = bsas(A, Theta, q);
A_mbsas = mbsas(A, Theta, q);
display(seq);
print_cluster(A_bsas, seq);
print_cluster(A_mbsas, seq);

% b.
seq = [1 10 2 3 4 11 12 5 6 7 13 8 14 9];
B = X(seq,:);
B_bsas = bsas(B, Theta, q);
B_mbsas = mbsas(B, Theta, q);
display(seq);
print_cluster(B_bsas, seq);
print_cluster(B_mbsas, seq);

% c.
seq = [1 10 5 2 3 11 12 4 6 7 13 14 8 9];
C = X(seq,:);
C_bsas = bsas(C, Theta, q);
C_mbsas = mbsas(C, Theta, q);
display(seq);
print_cluster(C_bsas, seq);
print_cluster(C_mbsas, seq);

% d. Plot the vectors
figure;
scatter(X(:,1), X(:,2), 'filled');
axis equal;
title('Plot of the vectors');

labels = num2str((1:size(X,1))','x%d');
text(X(:,1), X(:,2), labels, 'horizontal','left', 'vertical','bottom');