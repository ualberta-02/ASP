% HienLe
% Created Sep 5
% Modified Sep 6
% This will return a mxn matrix of delay times of modules
% Matrix P represents the probability of delay of modules


function A = ASP2D_Matrix(m,n,P)

A = zeros(m,n);

for i = 1:m
    for j = 1:n
        r = rand;
        if r >= P(i,j)
            A(i,j) = randi([1 5],1,1);
        end
    end
end
        
end
            
