% Initialization
prior = [0.25 0.2 0.25 0.3];
Mu = [ [1; 2], [4; 8], [8; 6.5], [13.5; 3] ];
Sigma = [[1; 0; 1], [1; 0; 1], [1; 0; 1], [1; 0; 1] ];

[Prior, MU, SIGMA, scores] = EM(X, T, prior, Mu, Sigma);

% Estimated parameters
display(Prior{T});
display(MU{T});
display(SIGMA{T});