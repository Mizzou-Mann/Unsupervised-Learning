function print_cluster(C, seq)
% print_cluster - print cluster values
%   C   - set of clusters (cell array)
%   seq - sequence of x

disp([inputname(1) ' =']);
disp(' ');
m = length(C);
for i=1:m
    fprintf(['     {' sprintf(' x%d ', seq(C{i})) '}']);
end
disp(' ');
disp(' ');
