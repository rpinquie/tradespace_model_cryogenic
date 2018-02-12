function [evaporator] = evaporator(Tchaud, Tfroid)

M_ethane = 30; % Masse molaire de l'éthane [g/mol]
Cp_ethane_gaz = 52.49; % Chaleur spécifique de l'éthane gazeux [J/(mol.k)]
Qm_chaud = 0.04; % Débit massique de l'éthane (kg/sec)

Cm_ethane_gaz = Cp_ethane_gaz/M_ethane;
Pechangee = Qm_chaud*Cm_ethane_gaz*(Tchaud-Tfroid);

evaporator.Pechangee = Pechangee;
















