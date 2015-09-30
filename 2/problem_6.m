% clustering parameters
q = 14;
Theta = sqrt(2);

% run clustering algorithm
% a.
A = load_data(1:14);
C = bsas(A, Theta, q);
mbsas(A, Theta, q);

% b.
B = load_data([1 10 2 3 4 11 12 5 6 7 13 8 14 9]);
bsas(B, Theta, q);
mbsas(B, Theta, q);

% c.
C = load_data([1 10 5 2 3 11 12 4 6 7 13 14 8 9]);
bsas(B, Theta, q);
mbsas(B, Theta, q);