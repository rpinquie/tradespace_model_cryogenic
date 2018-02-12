function eff = objfun(x,fluid)
    
    % Map design variables
    LP = x(1); % Condenser pressure [kPa]
    HP = x(2); % Boiler pressure [kPa]
    T3 = x(3);
    %x4 = x(4);

    % Turbine inlet
    h3 = refpropm('H','T',T3,'P',HP,fluid); % Enthalpy [J/kg]
    s3 = refpropm('S','P',HP,'H',h3,fluid); % Entropy [J/(kg.K]

    % Turbine outlet
    s4=s3; % Entropy remains the same through turbine (ideal)
    h4 = refpropm('H','P',LP,'S',s4,fluid); % Enthalpy [J/kg]
    x4 = refpropm('X','P',LP,'S',s4,fluid); % Steam quality 

    % Condenser outlet
    T1 = refpropm('T','P',LP,'Q',0,fluid)*0.8; % Saturation temperature [K]
    h1 = refpropm('H','P',LP,'Q',0,fluid); % Saturated liquid enthalpy [J/kg]
    v1 = 1/refpropm('D','P',LP,'Q',0,fluid); % Specific volume of saturated liquild [J/kg]

    % Boiler inlet
    Wp = v1*(HP-LP)*1e3;
    h2 = h1 + Wp; % calculating enthalpy [J/kg] from pump work assuming the fluid is icompressible 

    % Themal energy
    Wp_in = (h2 - h1)*1e-3; % Pump work [kJ/kg]
    Qe_in = (h3 - h2)*1e-3; % Evaporator heat input [kJ/kg]
    Wt_out = (h3 - h4)*1e-3; % Turbine work [kJ/kg]

    Wnet = Wt_out - Wp_in; % Cycle net specific work

    % Termal efficiency
    eff = Wnet/Qe_in;

    % maximize f is equivalent to minimize -f
    eff = -eff;
end