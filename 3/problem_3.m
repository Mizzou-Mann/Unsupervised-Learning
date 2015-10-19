% dissimilarity matrix
prox_mat = [0 2 4.2 6.6 9.2 12 15 300 340 420
            2 0 2.2 4.6 7.2 10 13 280 320 400
            4.2 2.2 0 2.4 5 7.8 10.8 270 310 390
            6.6 4.6 2.4 0 2.6 5.4 8.4 260 300 380
            9.2 7.2 5.0 2.6 0 2.8 5.8 262 296 388
            12 10 7.8 5.4 2.8 0 3 316 280 414
            15 13 10.8 8.4 5.8 3 0 380 326 470
            300 280 270 260 262 316 380 0 4 4.4
            340 320 310 300 296 280 326 4 0 9
            420 400 390 380 388 414 470 4.4 9 0];

% single linkage algorithm
[ Zs, ls ] = linkage(prox_mat, 'single');
display('Single linkage:');
N = length(ls);
for i=1:N
    print_cluster(Zs{i}, ls(i));
end

% complete linkage algorithm
[ Zc, lc ] = linkage(prox_mat, 'complete');
N = length(lc);
display('Complete linkage:');
for i=1:N
    print_cluster(Zc{i}, lc(i));
end