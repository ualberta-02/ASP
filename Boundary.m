function [U,D,Le,Ri] = Boundary(cells, m, n)

% Return the boundary of a list of cells in a mxn matrix
% Cells are sorted ascendingly 

frow = ceil(cells(1)/n);
lrow = ceil(cells(length(cells))/n);
iU = 1;
iD = 1;
iL = 1;
iR = 1;
ind = 1;
lcrow = frow - 1;
%last considering row

for cell = cells
    
    rowInd = ceil(cell/n);
    
    if rowInd > lcrow
        Le(iL) = cell;
        iL = iL+1;
        if ind - 1 > 0 
            Ri(iR) = cells(ind-1);
            iR = iR+1;
        end 
        lcrow = rowInd;
    end
    
    if ind == length(cells)
        Ri(iR) = cells(ind);
        iR = iR+1;
    end   
    
    if rowInd == frow
        U(iU) = cell;
        iU = iU + 1;
    end
    
    if rowInd == lrow
        D(iD) = cell;
        iD = iD + 1;
    end
    
    ind = ind + 1;
    
end

end
