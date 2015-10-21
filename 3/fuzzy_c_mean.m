function [ Theta, distortion ] = fuzzy_c_mean( X, Theta, q )
% fuzzy_c_mean - run fuzzy c-mean clustering algorithm on X
%
%       q : fuzzifier

[N,~] = size(X);
[l,m] = size(Theta);
p = 1/(q-1);

t = 0;
distortion = [];
Theta_t = zeros(l,m);
epsilon = 1e-3;

while true
    U = zeros(N, m);
    for i=1:N
        D = point_distance(X(i,:)', Theta);
        for j=1:m
            U(i,j) = 1/(sum( (D(j)./D).^p ));
        end
    end
    t = t + 1;
    % parameter update
    denominator = sum(U.^q);
    for j=1:m
         Theta_t(:,j) = sum((U(:,j).^q*ones(1,l)) .* X) / denominator(j);
    end
    
    % check for termination
    % : if change in Theta is smaller than epsilon
    c = Theta(:) - Theta_t(:);
    if sqrt(c'*c) < epsilon
        break;
    end
    Theta = Theta_t;
    % total distortion
    distortion(t) = total_distortion(X, Theta);
end