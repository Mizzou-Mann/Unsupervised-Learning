% distance matrix
D = [0 1 sqrt(5) sqrt(5) 2
     1 0 sqrt(2) 2 sqrt(5)
     sqrt(5) sqrt(2) 0 sqrt(2) sqrt(5)
     sqrt(5) 2 sqrt(2) 0 1
     2 sqrt(5) sqrt(5) 1 0];

[n,~] = size(D);
% Classical multidimensional scaling algorithm (MDS)
D2 = D.^2;
% double centering
J = eye(n) - (1/n * ones(n,n));
B_delta = -0.5 * J*D2*J;
% eigen analysis
[V,A] = eig(B_delta);
a = diag(A);
[I,~] = find(a>0);
a = a(I);
% numbers of coordinate to keep
k = 2;
[~,J] = sort(a, 'descend');
A_plus = diag( a(J(1:k)) );
V_plus = V(:,I(J(1:k)));
display(A_plus);
display(V_plus);
% compute coordinate matrix
X_hat = V_plus * sqrt(A_plus);
display(X_hat);

% verify X_hat is centered
z = mean(X_hat);
display(z);
% recover distance matrix from estimated coordinate
D_hat = zeros(n,n);
for i=1:n
    for j=1:n
        d = X_hat(i,:) - X_hat(j,:);
        D_hat(i,j) = sqrt(d*d');
    end
end
display(D_hat);