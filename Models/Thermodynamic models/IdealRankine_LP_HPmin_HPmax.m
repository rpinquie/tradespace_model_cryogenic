% Run analysis
function runAnalysis(LP, HPmin, HPmax)
    clf % Clear current figure
    
    fluids = {'propane','ethane','R41','R125','R143a','R134a','R245fa','R32','propylen','water','d};

    HP = HPmin:HPmax;
    
    % figure('name','Rankine thermal efficiency vs. Boiler pressure');
    for fluid = 1:length(fluids)
        for HP_i = 1:length(HP)
            efficiencies(fluid,HP_i) = calculateRankineEfficiency(LP,HP(HP_i), fluids{fluid});
        end
        plotEfficiencyVsPressure(HP, efficiencies, fluids, fluid);
    end
    
    % Fin optimum optimum fluid index and optimum HP index from optimum efficiency
    [optimumFluid, optimumHP] = find(efficiencies == max(efficiencies(:))); % Optimum fluid and HP index

    optimum = [HP(optimumHP), efficiencies(optimumFluid,optimumHP)]; % Optimum boiler pressure and efficiency values
    optimumFluid = fluids{optimumFluid}; % Optimum working fluid name
    
    % Plot optimum
    plot(optimum(1),optimum(2),'-s','MarkerSize',10,'MarkerEdgeColor','red','MarkerFaceColor',[1 .6 .6]); % Plot optimum point
    
    % Append text to optimum
    text(optimum(1)+0.25,optimum(2)+0.01, strcat('Fluid =',optimumFluid))    
    text(optimum(1)+0.25,optimum(2)+0.005, strcat('P =',num2str(optimum(1)),' bars'))
    text(optimum(1)+0.25,optimum(2)+0.0, strcat('Eff =',num2str(round(optimum(2),3)*100),' %'))

    % Return properties of the best ideal Rankine cycle
    %[eff,m_dot,steam,Wt,Wp,Qin,Qout,Wnet] = calculateRankineEfficiency(optimum(1),LP,optimumFluid)
   
    % T_boiling = convtemp(refpropm('T','P',101.325,'Q',0,optimumFluid),'K','C')
    % T_solidification = -183.3;
end

% Thermodynamic analysis of an ideal Rankine cycle
function [eff,T3] = calculateRankineEfficiency(LP,HP,fluid)

    % Convert pressures from [bar] to [kPa]
    HP = HP*1e2; % Condenser pressure [kPa]
    LP = LP*1e2; % Boiler pressure [kPa]
    
    % Condenser temperature set as the boiling temperature [°C] of the selected
    % working fluid at a given condenser pressure [kPa]
    T3 = refpropm('T','P',HP,'Q',1,fluid);
    %T3 = convtemp(200,'C','K');
       
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

    eff = (Wnet/Qe_in)*1e2; % Efficiency

    m_dot = Wnet/((h1-h2)-(h4-h3)); % Mass flow rate
end

% Plot Rankine thermal efficiency against boiler pressure for a set of working fluids
function [] = plotEfficiencyVsPressure(pressureV, efficiencyM, fluids, fluid)
    
    plot(pressureV,efficiencyM(fluid,:),'DisplayName',fluids{fluid});

    hold on;
       
    xlabel('Boiler pressure (bar)');
    ylabel('Rankine thermal efficiency');
    legend('show');
    legend('orientation','vertical');
	lgd = legend('Location','southeast');
    title(lgd,'Working fluid:');
end

function [] = checkConstraints()

    % The solidification temperature of the working fluid shall be 20 %
    % higher than the ambient temperature
    % assert(T_solidification_fluid >= 1.2*convtem(T_mini,'C','K')

    % Le titre de vapeur de détente ne doit pas être trop faible faute de quoi
    % il se forme des goutelletes de liquide trop grosses qui constituent un
    % abrasif dangeureux pour la tenue mécanique des aubages
    % assert(0.7 < steam_quality_x4 < 0.85, 'vapor quality not good', )

    % The pressure of condensation / evaporation shall be greater than 1 bar
    % to prevent air infiltration within the system

    % Environmental constraints: comply with standards, Ozone Depletion Potential (ODP) = 0,
    % Global Warming Potential as low as possible

    % Safety constraints : non-toxic, non-inflammable
end




