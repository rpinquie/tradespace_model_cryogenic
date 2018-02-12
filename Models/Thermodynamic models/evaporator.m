function [evaporator] = evaporator(Tchaud, Tfroid)

M_ethane = 30; % Masse molaire de l'�thane [g/mol]
Cp_ethane_gaz = 52.49; % Chaleur sp�cifique de l'�thane gazeux [J/(mol.k)]
Qm_chaud = 0.04; % D�bit massique de l'�thane (kg/sec)

Cm_ethane_gaz = Cp_ethane_gaz/M_ethane;
Pechangee = Qm_chaud*Cm_ethane_gaz*(Tchaud-Tfroid);

evaporator.Pechangee = Pechangee;
















