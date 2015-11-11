% class labels
Y = [1 1 1 1 1 2 2 2 2 2 2 2];
% clusters labels
a = [2 2 2 2 2 1 1 1 1 1 1 1];
b = [2 2 1 1 1 2 2 2 2 2 2 2];
c = [1 1 1 2 2 2 2 2 2 2 1 1];

% compute P_ij, Pi and Pj
[Pa_ij, Pa_j, Pi, I] = Prob(Y, a);
[Pb_ij, Pb_j] = Prob(Y, b);
[Pc_ij, Pc_j] = Prob(Y, c);

% compute mutual information (MI)
Qa = Pa_ij./(Pi*ones(1,2))./(Pa_j*ones(1,2))'; Qa(Qa==0) = 1;
Qb = Pb_ij./(Pi*ones(1,2))./(Pb_j*ones(1,2))'; Qb(Qb==0) = 1;
Qc = Pc_ij./(Pi*ones(1,2))./(Pc_j*ones(1,2))'; Qc(Qc==0) = 1;

MI_a = sum( sum(Pa_ij .* log2(Qa)) );
MI_b = sum( sum(Pb_ij .* log2(Qb)) );
MI_c = sum( sum(Pc_ij .* log2(Qc)) );

% compute normalized mutual information (NMI)
NMI_a = MI_a / sqrt(entropy(Pi)*entropy(Pa_j));
NMI_b = MI_b / sqrt(entropy(Pi)*entropy(Pb_j));
NMI_c = MI_c / sqrt(entropy(Pi)*entropy(Pc_j));
display(NMI_a);
display(NMI_b);
display(NMI_c);