function print_cluster(C, level)
% print_cluster - print cluster values
%   C     - set of clusters (cell array)
%   level - level that form the clusters

disp(['level(' num2str(level) ') = ']);
disp(' ');
m = length(C);
fprintf('  {');
for i=1:m
    fprintf([' {' sprintf(' x%d ', C{i}) '} ']);
end
fprintf('}');
disp(' ');
disp(' ');
