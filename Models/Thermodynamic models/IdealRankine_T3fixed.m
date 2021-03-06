function [results] = IdealORC(LP,HP,T3,fluid)

    LP = LP*1e2;
    HP = HP*1e2;
    T3 = convtemp(T3,'C','K');
    
    % Turbine inlet
    h3 = refpropm('H','T',T3,'P',HP,fluid); % Enthalpy [J/kg]
    s3 = refpropm('S','P',HP,'H',h3,fluid); % Entropy [J/(kg.K]

    % Turbine outlet
    s4=s3; % Entropy remains the same through turbine (ideal)
    h4 = refpropm('H','P',LP,'S',s4,fluid); % Enthalpy [J/kg]
    x4 = refpropm('X','P',LP,'S',s4,fluid); % Steam quality 
    
    % Condenser outlet
    T1 = refpropm('T','P',LP,'Q',0,fluid); % Saturation temperature [K]
    h1 = refpropm('H','P',LP,'Q',0,fluid); % Saturated liquid enthalpy [J/kg]
    v1 = 1/refpropm('D','P',LP,'Q',0,fluid); % Saturated liquild volume [J/kg]

    % Boiler inlet
    Wp = v1*(HP-LP)*1e3;
    h2 = h1 + Wp; % calculating enthalpy [J/kg] from pump work assuming the fluid is icompressible 

    % Results
    Wp_in = (h2 - h1)*1e-3; % Pump work [kJ/kg]
    Qe_in = (h3 - h2)*1e-3; % Evaporator heat input [kJ/kg]
    Wt_out = (h3 - h4)*1e-3; % Turbine work [kJ/kg]
    Qc_out = (h4 - h1)*1e-3; % Condenser heat out [kJ/kg]

    Wnet = Wt_out - Wp_in; % Cycle net specific work

    eff = Wnet/Qe_in % Efficiencyend
    
    results.T3 = T3;
    results.Eff = eff;
    results.x4 = x4;
    results.Wnet = Wnet;
