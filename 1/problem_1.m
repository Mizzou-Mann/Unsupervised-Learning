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
mu = { [10; 2], [5; 6], [0; 1], [4; 3] };
Sigma = { eye(2), eye(2), eye(2), eye(2) };

[prior, mu, Sigma] = EM(X, T, prior, mu, Sigma);

display(prior);
display(cell2mat(mu));
display(cell2mat(Sigma));