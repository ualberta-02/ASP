function S = Sequence2D(S,L,cells,e)
if e > 0
    str = char(strjoin(string(cells)));
    L(str);
    S(e) = L(str);
    cells(cells==S(e))=[];
    e = e - 1;
    S = Sequence2D(S,L,cells,e);
end
end