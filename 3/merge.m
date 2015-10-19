function [ R ] = merge( R, r, s )
% merge - Merge two clusters r and s

Cq = [R{r} R{s}];
% remove cluster r and s
R([r s]) = [];
% prepend Cq to R
R =  [Cq R];