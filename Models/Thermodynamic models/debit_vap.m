function [results] = debit()

    Tref = 20 + 273;
    Pref = 100000;
    R = 8.31; 
    
    M_azote = 28.013; % g/mol
    M_methane = 16;% g/ml
    
    Rho_methane_liq = 422.62; % Masse volumique du méthane liquide (kg/m^3)
    Rho_azote_liq = 808.607; % Masse volumique de l'azote liquide (kg/m^3)

    % CALCUL DEBIT DE GAZ LIQUIDE
    V_gaz = 2000; % Volume de gaz débité par heure (m^3)
    
    n = (Pref*V_gaz)/(R*Tref); % Quantité de matière (mol)
    
    m_azote = (n*M_azote)/1000; % Masse d'azote liquide (kg) débitée par heure
    m_methane = (n*M_methane)/1000; % Masse de GNL (kg)débitée par heure
    
    Qm_azote = m_azote/3600; % Débit massique d'azote liquide (kg/sec)
    Qm_methane = m_methane/3600; % Débit massique de GNL liquide (kg/sec)

    % CALCUL TEMPS DE DEPOTAGE D'UNE CUVE DE GAZ CRYO
    V_cuve = 20; % m^3
    
    m_cuve_azote = V_cuve*Rho_azote_liq; % Masse d'azote liquide dans une cuve de 20 m^3 (kg)
    m_cuve_methane = V_cuve*Rho_methane_liq; % Masse d'azote liquide dans une cuve de 20 m^3 (kg)
    
    t_vap_azote = m_cuve_azote/Qm_azote; % Temps de dépotage d'une cuve de 20 m^3 d'azote (sec)
    t_vap_methane = m_cuve_methane/Qm_methane; % Temps de dépotage d'une cuve de 20 m^3 d'azote (sec)
    
    results.n = n;
    results.m = m_methane;
    results.Qm_methane = Qm_methane;
    results.Qm_azote = Qm_azote;
    results.t_vap_azote = t_vap_azote/3600;
    results.t_vap_methane = t_vap_methane/3600;
end


