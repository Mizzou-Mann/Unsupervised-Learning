% ----------------------------------------
% CS 8735: Supervised Learning Fall (2015)
%     Unversity of Missouri-Columbia
%           Chanmann Lim
%          September 2015
% ----------------------------------------
clc;
clear;
close all;

%% Problem 1
% Load data
X = load('GMD.dat');

% EM algorithm
tic;
problem_1_a
toc
% problem_1_b