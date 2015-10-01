% load data
X = load('../1/GMD.dat');

% initialization
[~, d] = size(X);
k = 4;
Mu = 11*rand(d, k) - 1;
display(Mu);

% run k-mean clustering
[I, Mu, D] = k_mean(X, Mu);

% print centroids and total distortion
display(Mu);
display(D);

% plot clusters
colors = 'bgrm';
figure;
hold on;
for i=1:k
    Xk = X(I==i,:);
    scatter(Xk(:,1), Xk(:,2), 'filled', colors(i));
end
plot(Mu(1,:), Mu(2,:), '+k');
hold off;
title('K-mean clustering');

% plot total distortion
figure;
plot(1:length(D), D);
title('Total distortion');
xlabel('Iterations');
ylabel('scores');