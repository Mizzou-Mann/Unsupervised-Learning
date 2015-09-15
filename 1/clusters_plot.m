function clusters_plot( X, k, t )
% CLUSTERS_PLOT - Plot of clusters in X
%   Where
%       X - dataset
%       k - clusters
%       t - t variable for the plot title

colors = 'bgrm';
figure;
hold on;
for j=unique(k)'
    x1 = X(:,1); x1 = x1(k == j);
    x2 = X(:,2); x2 = x2(k == j);
    scatter(x1, x2, 'filled', colors(j));
end
hold off;
title(['Plot of clusters at t=' num2str(t)]);
xlabel('X1');
ylabel('X2');