function [C,Ceq] = nonlcon(x)
    % Vector of inequaliy constraints
    C(1) = -2*x(1) - 2*x(2) + 8;
    %C(2)
    %C(n)
    
    % Vector of equality constraints
    Ceq = [];