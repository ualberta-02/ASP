function [T,L] = MinTime2D(A,t,M)

T = containers.Map();
L = containers.Map();
[m,n] = size(A);
considering2 = [];

for i = 1:m
    for j = 1:n
        str = char(string((i-1)*n+j));
        new = str2num(str);
        considering2 = [new;considering2];
        T(str) = A(i,j)+t;
        L(str) = new;
    end
end

for i = 2:(m*n)
    considering1 = considering2;
    considering2 = [];
    
    for j = 1:size(considering1,1)
       
        cells = considering1(j,:);
        strcells = char(strjoin(string(cells)));
        oldT = T(strcells);
        
        [U,D,Le,Ri] = Boundary(cells,m,n);
        
        for cell = U
            if cell > n
                
                adj = cell-n;
                [considering2, T, L] = AddCell(adj,cells,considering2,T,L,oldT,A,m,n,t,M);
          
            end
        end
        
        for cell = D
            if cell < m*(n-1)
                
                adj = cell + n;
                [considering2, T, L] = AddCell(adj,cells,considering2,T,L,oldT,A,m,n,t,M);
                
            end
        end
            
        
        for cell = Le
           
            colInd = cell-(ceil(cell/n)-1)*n;
            
            if colInd > 1
                
                adj = cell - 1;
                [considering2, T, L] = AddCell(adj,cells,considering2,T,L,oldT,A,m,n,t,M);
                
            end
        end
        
        
        for  cell = Ri
            
            colInd = cell-(ceil(cell/n)-1)*n;
            
            if colInd < n
                
                adj = cell + 1;
                [considering2, T, L] = AddCell(adj,cells,considering2,T,L,oldT,A,m,n,t,M);
                
            end
        end
    end
end

    
       

            
        
%         for cell = cells
%             
%             adjs = [];
%             rowInd = ceil(cell/n);
%             colInd = cell-(rowInd-1)*n;
%             
%             if (colInd - 1 >= 1 && not(ismember(cell - 1, cells)))
%                 adjs = [cell-1,adjs];
%             end
%                 
%             if (colInd + 1 <= n && not(ismember(cell + 1, cells)))
%                 adjs = [cell+1,adjs];
%             end
%                 
%             if (rowInd + 1 <= m && not(ismember(cell + n, cells)))
%                 adjs = [cell+n,adjs];
%             end   
%              
%             if (rowInd - 1 >= 1 && not(ismember(cell - n, cells)))
%                 adjs = [cell-n,adjs];
%             end
%             
%             for adj = adjs
%                
%                 new = sort([adj cells]);
%                 adjRow = ceil(adj/n);
%                 adjCol = adj-(adjRow-1)*n;
%                 % cells is already sorted
%                 considering2 = [new;considering2];
%                 
%                 newstr = char(strjoin(string(new)));
%                 newT = max(oldT, A(adjRow,adjCol))+t;
%                 
%                 if ismember(adj-1,cells) && ismember(adj+1,cells) && adjCol ~= 1 && adjCol ~= n
%                     newT = newT + M;
%                 end
%                 
%                 if ismember(adj-n,cells) && ismember(adj+n,cells) && adjRow ~= 1 && adjRow ~= m
%                     newT = newT + M;
%                 end
%                     
%                 
%                 if ismember(newstr,keys(T)) == 0
%                         T(newstr) = newT;
%                         L(newstr) = adj;
%                 else
%                     if newT < T(newstr)
%                         T(newstr) = newT;
%                         L(newstr) = adj;
%                     end
%                 end
%             
%             end
%         end
%     end
                           
end

