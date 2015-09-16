% Observations: X = [x_1 ... x_n]', x_n = [n_H, n_T]
X = [5 5; 9 1; 8 2; 4 6; 7 3];
T = 10; % 10 iterations
[N, ~] = size(X);

% Initialization
% theta = [theta_A, theta_B]
theta_0 = [0.6 0.4];
prior = 0.5;
[Theta, P] = EM_2(X, T, prior, theta_0);

% Learned parameters t=1..10
display(Theta);

% Posterior probabilities
for t=[1 10]
    p = P{t};
    p_zA = p(:,1) ./ sum(p, 2);
    p_zB = p(:,2) ./ sum(p, 2);
    
    display(['Posterior prob. at t=' num2str(t)]);
    display(p_zA);
    display(p_zB);
end

% log P(X; theta') for t=1..10
p_x = zeros(N, T);
for t=1:T
    p_x(:,t) = sum(P{t}, 2);
end

log_p_X = sum( log(p_x) );
display(log_p_X);

figure;
plot(1:T, log_p_X);
title('The log probabilities P(X;\theta^{(t)})');
xlabel('Iteration');
ylabel('log P(X;\theta^{(t)})');