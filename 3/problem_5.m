% load data
X = load('GKlines.dat');

% design parameters
% number of cluster
m = 2;
% number of iterations
T = 5;
% fuzzifier
q = 2;

% initialization
c = [[-1 0]' [0 1]'];
Sigma = [sigma2vec(eye(2)) sigma2vec(eye(2))];

% Gustafson-Kessel clustering
[C, SIGMA, total_distance] = gustafson_kessel(X, c, Sigma, q, T);

% result
fprintf('c = \n\n');
disp(C{T});
fprintf('Sigma = \n\n');
disp(SIGMA{T});
display(total_distance);

% plot data samples
color = 'bg';
for t=[1 5]
    c = C{t};
    I = gk_cluster_assignment(X, C{t}, SIGMA{t});
    figure; hold on;
    for k=unique(I)'
        Ck = X(I==k,:);
        scatter(Ck(:,1), Ck(:,2), 'filled', color(k));
    end
    plot(c(1,:), c(2,:), 'rx');
    hold off;
    title(['Gustafson-Kessel clustering (iteration: ' num2str(t) ')']);
end