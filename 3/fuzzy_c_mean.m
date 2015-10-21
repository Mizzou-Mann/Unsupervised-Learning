function [ I, Theta, distortion ] = fuzzy_c_mean( X, Theta, q )
% fuzzy_c_mean - run fuzzy c-mean clustering algorithm on X
%
%       q : fuzzifier

[N,~] = size(X);
[d,m] = size(Theta);
p = 1/(q-1);

t = 0;
distortion = [];
Theta_t = zeros(d,m);
epsilon = 1e-3;

while true
    U = zeros(N, m);
    for i=1:N
        D = distance(X(i,:)', Theta);
        for j=1:m
            U(i,j) = 1/(sum( (D(j)./D).^p ));
        end
    end
    t = t + 1;
    % parameter update
    denominator = sum(U.^q);
    for j=1:m
         Theta_t(:,j) = sum((U(:,j).^q*ones(1,2)) .* X) / denominator(j);
    end
    
    % total distortion
    [distortion(t), I] = total_distortion(X, Theta_t);
    % check for termination
    % : if the total distortion can only be decreased
%     if t > 1 && distortion(t) > distortion(t-1)
%         break;
%     end
    % : if change in Theta is smaller than epsilon
    c = Theta(:) - Theta_t(:);
    if sqrt(c'*c) < epsilon
        break;
    end
    Theta = Theta_t;
end



function [ D ] = distance( x, Theta )
% distance - compute distance (x-theta)'A(x-theta)

A = eye(2);
[~,m] = size(Theta);

x_tilde = x*ones(1,m) - Theta;
D = diag(x_tilde'*A*x_tilde)';