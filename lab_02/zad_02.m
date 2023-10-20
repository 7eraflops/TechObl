% a)
n=5;
k=10;
M=randi([1,100],n,k)
M_max=max(max(M))
N=M./M_max

% b)
N_triangular_upper=istriu(N)