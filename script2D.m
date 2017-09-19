m = 4;
n = 4;
P = 0.2*ones(m,n);
A = ASP2D_Matrix(m,n,P)
t = 1;
M = 100;
[T,L] = MinTime2D(A,t,M);
% keys(T)
% values(T)
% keys(L)
% values(L)
cells = [];
for i = 1:m
    for j = 1:n
        cells = [cells,(i-1)*n+j];
    end
end
T(char(strjoin(string(cells))))
e = m*n;
S = zeros(1,m*n);
S = Sequence2D(S,L,cells,e)