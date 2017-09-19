% Hien Le
% Sept 8
% This function returns the sequence S of A(s)...A(e) that has the smallest 
% installation time
% s is the first module.
% e is the last module.
% A is the vector of all modules.
% T is the matrix that remembers all the minimum time of installation.

function S = Sequence1D(S,A,T,t,s,e)
if e == s    
    S(1) = e;
else
    i = e-s+1;
    if T(i,s)-t == max(T(i-1,s),A(e))
        S(i) = e;
        S = Sequence1D(S,A,T,t,s,e-1);
    else
        S(i) = s;
        S = Sequence1D(S,A,T,t,s+1,e);
    end
end
end
