function [condenser] = condenser(Tchaud, Tfroid)

M_ethane = 30; % Masse molaire de l'éthane [g/mol]
Cp_ethane_liq = 68.68; % Chaleur spécifique de l'éthane liquide [J/(mol.k)]
Qm_chaud = 0.04; % Débit massique de l'éthane (kg/sec)

Cm_ethane_liq = Cp_ethane_liq/M_ethane;
Pechangee = Qm_chaud*Cm_ethane_liq*(Tchaud-Tfroid);

condenser.Pechangee = Pechangee;

% Rho_ethane_liquide = 545.49; % Masse volumique de l'éthane liquide (kg/m^3)
% Rho_methane_liquide = 422.62; % Masse volumique méthane liquide (kg/m^3)





