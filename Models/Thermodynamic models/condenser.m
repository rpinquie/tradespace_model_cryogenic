function [condenser] = condenser(Tchaud, Tfroid)

M_ethane = 30; % Masse molaire de l'�thane [g/mol]
Cp_ethane_liq = 68.68; % Chaleur sp�cifique de l'�thane liquide [J/(mol.k)]
Qm_chaud = 0.04; % D�bit massique de l'�thane (kg/sec)

Cm_ethane_liq = Cp_ethane_liq/M_ethane;
Pechangee = Qm_chaud*Cm_ethane_liq*(Tchaud-Tfroid);

condenser.Pechangee = Pechangee;

% Rho_ethane_liquide = 545.49; % Masse volumique de l'�thane liquide (kg/m^3)
% Rho_methane_liquide = 422.62; % Masse volumique m�thane liquide (kg/m^3)





