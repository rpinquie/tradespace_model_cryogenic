x0 = [1;1] % Initial guess (vector of size equal to the # of variables in the optimization problem)

% No need to define A, b, Aeq and beq as it is not a linear constraints
% problem
A = [];
b = [];
Aeq = [];
beq = [];

LB = [-5;-5]; % vector that contains the lower bounds on the variable x1
UB = [5;5]; % vector that contains the upper bounds on the variable x2

options = optimoptions('fmincon','Algorithm','interior-point','Display','iter');

[xopt, fopt] = fmincon('fun', x0, A, b, Aeq, beq, LB, UB,'nonlcon')

