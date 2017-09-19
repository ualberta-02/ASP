% Hien Le
% Sep 8

% This function will return matrix T that remember the time it takes to
% finish all modlules whose delay times are stored in vector A.

% Matrix T will be an nxn matrix where n is the length of vector A, which
% is also the number of modules that we have.

% T(i,j) will remember the time it takes to finish i consecutive modules
% start with module j in vector A.

% t is the time it takes to install a module

function T = MinTime1D(A,t)
n = length(A);
T = zeros(n,n);
T(1,:) = A + t;
for i = 2:n
    for j = 1:(n+1-i)
        T(i,j) = min(max(T(i-1,j),A(j+i-1))+1,max(T(i-1,j+1),A(j))+1);
    end
end