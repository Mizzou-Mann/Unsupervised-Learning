% ----------------------------------------
% CS 8735: Supervised Learning Fall (2015)
%     Unversity of Missouri-Columbia
%           Chanmann Lim
%          September 2015
% ----------------------------------------
clc;
clear;
close all;

%% Load data
X = load('GMD.dat');

%% EM algorithm
T = 100; % 100 iterations

% Initialization
prior = 1/4 * ones(1, 4);
Mu = [ [10; 2], [5; 6], [0; 1], [4; 3] ];
Sigma = [[1; 0; 1], [1; 0; 1], [1; 0; 1], [1; 0; 1] ];

tic;
[prior, Mu, Sigma, scores] = EM(X, T, prior, Mu, Sigma);
toc

% Estimated parameters
display(prior);
display(Mu);
display(Sigma);

% Plot of log likelihood scores
figure;
plot(1:T, scores);
title(['Log likelihood (' num2str(T) ') iterations']);
xlabel('Iteration');
ylabel('log P(X|\Theta)');