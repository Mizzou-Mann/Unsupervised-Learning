% load data
X = load('../1/GMD.dat');

% number of clusters
m = 4;
% fuzzifier
q = 2;

[~,d] = size(X);
% initialization
% Theta = rand(d,m);
Theta = [0.7802    0.6079    0.1048    0.5495 
    			0.3376    0.7413    0.1279    0.4852];
display('Random initialization:');
display(Theta);

[I, Theta, distortion] = fuzzy_c_mean(X, Theta, q);

% result
display('Result:');
display(Theta);
display(distortion);
% plot data
K = unique(I)';
color = 'bgrm';
figure; hold on;
for k=K
    Ck = X(I==k,:);
    scatter(Ck(:,1), Ck(:,2), 'filled', color(k));
end
plot(Theta(1,:), Theta(2,:), 'k+');
hold off;
title('Fuzzy c-means clustering');
% plot distortion
figure;
plot(distortion);
title('Total distortion');
xlabel('Iterations');
ylabel('Score');