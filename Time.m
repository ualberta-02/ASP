% Hien Le
% Sep 6
% We calculate the time, T, it take to finish the modular construction if 
% we follow a specific sequence, S
% Given that the time it takes to put a module in place is t

function T = Time(S,t)
n = length(S);
T = 0;
for i = 1:n
    T = T + max(0,S(i)-T) + t;
end
end
