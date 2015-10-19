function [ C ] = vec2cell( v )
% vec2cell - Convert each element of the vector to cell

l = length(v);
C = cell(1, l);

for i=1:l
    C{i} = v(i);
end