function [considering2, T, L] = AddCell(adj,cells,considering2,T,L,oldT,A,m,n,t,M)
new = sort([adj cells]);
adjRow = ceil(adj/n);
adjCol = adj-(adjRow-1)*n;
% cells is already sorted

if size(considering2,1) ~= 0 && not(ismember(new,considering2,'rows'))
    considering2 = [new;considering2];
end

if size(considering2,1) == 0
    considering2 = [new;considering2];
end

newstr = char(strjoin(string(new)));
newT = max(oldT, A(adjRow,adjCol))+t;
                
if ismember(adj-1,cells) && ismember(adj+1,cells) && adjCol ~= 1 && adjCol ~= n
    newT = newT + M;
end
                
if ismember(adj-n,cells) && ismember(adj+n,cells) && adjRow ~= 1 && adjRow ~= m
    newT = newT + M;
end               
                
if ismember(newstr,keys(T)) == 0
    T(newstr) = newT;
    L(newstr) = adj;
else
    if newT < T(newstr)
        T(newstr) = newT;
        L(newstr) = adj;
    end
end