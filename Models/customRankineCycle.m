% Sree Prasanna Rajagopal, 
% [Mechanical Engineering Department, IIT Guwahati] February 2013
% XSteam.m by Magnus Holmgren, www.x-eng.com 
% used for all property calculation purposes

% IDEAL RANKINE CYCLE

% Fluids: ethane, R41, R125, R143a, R32, propylen, propane, R134q

function [ x2,eff,Wt,Wp,Qin ] = customRankineCycle(P1,P2,T1,fluid)

T1 = convtemp(T1,'C','K');
P1 = P1*100;
P2 = P2*100;

% ideal rankine cycle analysis

% subscripts and associated states
% 1 - turbine inlet
% 2 - turbine outlet
% 3 - condensor outlet
% 4 - boiler inlet

% P1 - condenser pressure
% P2 - boiler pressure

% Units
    % P   Pressure [kPa]
    % H   Enthalpy [J/kg]
    % S   Entropy [J/(kg K)]
    % T   Temperature [K]
    % x   Quality (vapor fraction) (kg/kg)
    
% Assumptions
    % Pump and turbine are adiabatic and reversible (sentropic) compression
    % and expansion, respectively

% turbine inlet
h1 = refpropm('H','T',T1,'P',P2,fluid);
s1 = refpropm('S','P',P2,'H',h1,fluid);

% entropy remains the same through turbine ( ideal )
s2=s1;
h2 = refpropm('H','P',P1,'S',s2,fluid);
x2 = refpropm('Q','P',P1,'S',s2,fluid);

if (x2 < 0.88 )
    disp('Steam quality less than 88%.');
    fprintf('\n\n\n');
end

% condenser outlet
T3 = refpropm('T','P',P1,'Q',0,fluid); % Saturation temperature
h3 = refpropm('H','P',P1,'Q',0,fluid); % Saturated liquid enthalpy
v3 = refpropm('H','P',P1,'Q',1,fluid); % Saturated vapour enthalpy

% calculating h4 from pump work
h4 = h3 + v3*(P2-P1)*1e2;

% calculating pump work, turbine work and heat input
Wt = h1 - h2;
Wp = h4 - h3;
Qin = h1 - h4;

% calculating efficiency
eff = (Wt - Wp)/Qin;




    