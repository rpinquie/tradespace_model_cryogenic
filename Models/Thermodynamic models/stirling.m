function [] = stirling(Tchaud)
     
    %% Constantes
       
    Chaleur_latente_methane = 510; % Chaleur latente de vaporisation du m�thane [kJ/kg]
    Chaleur_latente_azote = 198.38; % Chaleur latente de vaporisation de l'azote [kJ/kg]

    % Propri�t�s de l'air
    Rho_air = 1.394; % Masse volumique de l'air � 20 �C kg/m^3
    Cp_air = 1.004; %  [kJ/(kg.k)]
    Delta_T = 20; % Variation temp�rature de l'air [�C]

    % Constantes
    Tref = 20 + 273; % Temp�rature de r�f�rence [k]
    Pref = 100000; % Pression de r�f�rence [Pa]
    R = 8.31; % 

    M_azote = 28.013; % Masse molaire de l'azote [g/mol]
    M_methane = 16;% Masse molaire du m�thane [g/mol]

    Rho_methane_liq = 422.62; % Masse volumique du m�thane liquide (kg/m^3)
    Rho_methane_gaz = 0.6; % Masse volumique du m�thane gazeux (kg/m^3)
    Rho_azote_liq = 808.607; % Masse volumique de l'azote liquide (kg/m^3)

    % Rendements
    Rendement_Stirling = 0.2; % Rendement de la machine thermique
    Rendement_elec = 0.85; % Rendement de l'alternateur

    PCS_methane = 11; % Pouvoir calorifique sup�rique du m�thane [kWh/m^3]

    %% Sc�nario 1 : D�potage d'une cuve de 40 m^3 de GNL en 1 mois ou 30 jours avec 1 journ�e = 12 heures, soit 12*30 heures

    Volume_gaz_1 = 40;
    Temps_vaporisation_1 = 12*25; % Temps de d�potage [heures
    Qm1_methane = (Volume_gaz_1*Rho_methane_liq)/(Temps_vaporisation_1*3600); % D�bit massique de GNL sc�nario 1 [kg/sec]
    Qm1_azote = (Volume_gaz_1*Rho_azote_liq)/(Temps_vaporisation_1*3600); % D�bit massique de GNL sc�nario 1 [kg/sec]

    %% Sc�nario 2 : D�potage d'une cuve de 40 m^3 de GNL en 1 semaine ou 7 jours avec 1 journ�e = 12 heures, soit 12*7 heures

    Volume_gaz_2 = 40; % Volume � d�poter [m^3]
    Temps_vaporisation_2 = 12*7; % Temps de d�potage [heures]
    Qm2_methane = (Volume_gaz_2*Rho_methane_liq)/(Temps_vaporisation_2*3600); % D�bit massique de GNL sc�nario 2 [kg/sec]
    Qm2_azote = (Volume_gaz_2*Rho_azote_liq)/(Temps_vaporisation_2*3600); % D�bit massique de GNL sc�nario 1 [kg/sec]

    %%  Sc�nario 3 : D�potage d'une cuve de 40 m^3 de GNL en une journ�e = 12 heures

    Volume_gaz_3 = 40; % Volume � d�poter [m^3]
    Temps_vaporisation_3 = 12; % Temps de d�potage [heures]
    Qm3_methane = (Volume_gaz_3*Rho_methane_liq)/(Temps_vaporisation_3*3600); % D�bit massique de GNL sc�nario 3 [kg/sec]
    Qm3_azote = (Volume_gaz_3*Rho_azote_liq)/(Temps_vaporisation_3*3600); % D�bit massique de GNL sc�nario 3 [kg/sec]

    %% Sc�nario 4 : D�potage d'une cuve de 20 m^3 de GNL avec un d�bit de vaporisation de 15 000 m^3/h

    % Calcul du d�bit massique de gaz liquide �quivalent � un d�bit volumique de 15 000 m^3/h de gaz
    Volume_gaz_4 = 15000; % Volume de gaz d�bit� par heure (m^3)

    n_15000 = (Pref*Volume_gaz_4)/(R*Tref); % Quantit� de mati�re [mol]

    m_azote_15000 = (n_15000*M_azote)/1000; % Masse d'azote liquide d�bit�e par heure [kg]
    m_methane_15000 = (n_15000*M_methane)/1000; % Masse de m�thane d�bit�e par heure [kg]

    Qm4_azote = m_azote_15000/3600; % D�bit massique d'azote liquide [kg/sec]
    Qm4_methane = m_methane_15000/3600; % D�bit massique de m�thane liquide [kg/sec]

    % Calcul du temps de d�potage d'une cuve de 20 m^3 de gaz
    % liquide
    Volume_cuve = 20; % Volume d'une cuve de gaz liquide [m^3]

    m_cuve_azote = Volume_cuve*Rho_azote_liq; % Masse d'azote liquide dans une cuve de 20 m^3 (kg)
    m_cuve_methane = Volume_cuve*Rho_methane_liq; % Masse d'azote liquide dans une cuve de 20 m^3 (kg)

    t_vap_azote_15000 = m_cuve_azote/Qm4_azote; % Temps de d�potage d'une cuve de 20 m^3 d'azote (sec)
    t_vap_methane_15000 = m_cuve_methane/Qm4_methane; % Temps de d�potage d'une cuve de 20 m^3 d'azote (sec)

    %% Sc�nario 5 : D�potage d'une cuve de 20 m^3 de GNL avec une chute du d�bit de vaporisation � 2 000 m^3/h

    % Calcul du d�bit massique de gaz liquide �quivalent � un d�bit
    % volumique de 2 000 m^3/h de gaz
    Volume_gaz_5 = 2000; % Volume de gaz liquide d�bit� par heure (m^3)

    n_2000 = (Pref*Volume_gaz_5)/(R*Tref); % Quantit� de mati�re [mol]

    m_azote_2000 = (n_2000*M_azote)/1000; % Masse d'azote liquide d�bit�e par heure [kg]
    m_methane_2000 = (n_2000*M_methane)/1000; % Masse de m�thane d�bit�e par heure [kg]

    Qm5_azote = m_azote_2000/3600; % D�bit massique d'azote liquide [kg/sec]
    Qm5_methane = m_methane_2000/3600; % D�bit massique de m�thane liquide [kg/sec]

    % Calcul du temps de d�potage d'une cuve de 20 m^3 de gaz
    % liquide
    Volume_cuve = 20; % Volume d'une cuve de gaz liquide [m^3]

    m_cuve_azote = Volume_cuve*Rho_azote_liq; % Masse d'azote liquide dans une cuve de 20 m^3 (kg)
    m_cuve_methane = Volume_cuve*Rho_methane_liq; % Masse d'azote liquide dans une cuve de 20 m^3 (kg)

    t_vap_azote_2000 = m_cuve_azote/Qm5_azote; % Temps de d�potage d'une cuve de 20 m^3 d'azote (sec)
    t_vap_methane_2000 = m_cuve_methane/Qm5_methane; % Temps de d�potage d'une cuve de 20 m^3 d'azote (sec)

    Qm = [Qm1_methane,Qm2_methane,Qm3_methane,Qm4_methane,Qm5_methane,Qm1_azote,Qm2_azote,Qm3_azote,Qm4_azote,Qm5_azote];
    Tchaud = convtemp(Tchaud,'c','k');

    
    results = [];

    %% Calcul des performances pour le m�thane

    for idx = 1:5

        Tfroid = convtemp(-161.5,'c','k');

        Rendement_Carnot = (Tchaud - Tfroid) / Tchaud;

        Qm_x = Qm(idx);

        % Puisance thermique disponible � la source froide methane
        Puissance_thermique_disponible_src_froide = Qm_x*Chaleur_latente_methane; % kW
        results(idx,1) = Puissance_thermique_disponible_src_froide;

        % Puisance thermique n�cessaire � la source chaude
        Puissance_necessaire_src_chaude = Puissance_thermique_disponible_src_froide / (1-Rendement_Carnot); % kW
        results(idx,2) = Puissance_necessaire_src_chaude;

        % CALCUL CYCLE DE STIRLING
        Puissance_meca = Puissance_necessaire_src_chaude*Rendement_Stirling; % kWm
        Puissance_elec_brut = Puissance_meca*Rendement_elec; % kWe
        results(idx,3) = roundn(Puissance_elec_brut,-1);

        % CALCUL VENTILATION
        Debit_massique_air = Puissance_necessaire_src_chaude / (Cp_air*Delta_T); % D�bit massique d'air n�cessaire  kg/s
        Debit_volumique_air = (Debit_massique_air*3600)/Rho_air; % D�bit volumique d'air n�cessaire [m^3/h]
        results(idx,4) = Debit_volumique_air;                
    end
    %% Calcul des performances pour l'azote

    for idx = 5:10

        Tfroid = convtemp(-195.79,'c','k');

        Rendement_Carnot = (Tchaud - Tfroid) / Tchaud;

        Qm_x = Qm(idx);

        % Puisance thermique disponible � la source froide methane
        Puissance_thermique_disponible_src_froide = Qm_x*Chaleur_latente_azote; % kW
        results(idx,1) = Puissance_thermique_disponible_src_froide;

        % Puisance thermique n�cessaire � la source chaude
        Puissance_necessaire_src_chaude = Puissance_thermique_disponible_src_froide / (1-Rendement_Carnot); % kW
        results(idx,2) = Puissance_necessaire_src_chaude;

        % CALCUL CYCLE DE STIRLING
        Puissance_meca = Puissance_necessaire_src_chaude*Rendement_Stirling; % kWm
        Puissance_elec_brut = Puissance_meca*Rendement_elec; % kWe
        results(idx,3) = roundn(Puissance_elec_brut,-1);

        % CALCUL VENTILATION
        Debit_massique_air = Puissance_necessaire_src_chaude / (Cp_air*Delta_T); % D�bit massique d'air n�cessaire  kg/s
        Debit_volumique_air = (Debit_massique_air*3600)/Rho_air; % D�bit volumique d'air n�cessaire [m^3/h]
        results(idx,4) = Debit_volumique_air;                
    end

    %%
    for idx = 1:10
        results(idx,5) = Qm(idx);
    end

    %% 

    figure

    scenarios = {'40 m3/mois','40 m3/semaine','40 m3/jour','20 m3 nominal','20 m3 d�grad�'};  

    subplot(3,2,2)
    yyaxis left          % plot against left y-axis  
    plot(1:5,results(1:5,5),'*')
    axis([1 5 -1 3.5])
    for k=1:5
        txt = text(k+0.1,results(k,5),[num2str(roundn(results(k,5),-3))])
        txt(1).Color = 'blue'
    end
    yyaxis right         % plot against right y-axis
    plot(1:5,results(6:10,5),'*')
    axis([1 5 -0.75 5])
    legend('GNL','Azote','Location','northwest')
    for k=1:5
        txt = text(k+0.1,results(k+5,5),[num2str(roundn(results(k+5,5),-3))])
        txt(1).Color = 'red'
    end            
    set(gca, 'XTick',1:5, 'XTickLabel',scenarios)
    title('D�bit massique de gaz [kg/s]')

    %% 
    subplot(3,2,3)
    yyaxis left          % plot against left y-axis  
    plot(1:5,results(1:5,1),'*')
    axis([1 5 -500 1500])
    for k=1:5
        txt = text(k+0.1,results(k,1),[num2str(roundn(results(k,1),-1))])
        txt(1).Color = 'blue'
    end
    yyaxis right         % plot against right y-axis
    plot(1:5,results(6:10,1),'*')
    axis([1 5 -250 2000])
    legend('GNL','Azote','Location','northwest')
    for k=1:5
        txt = text(k+0.1,results(k+5,1),[num2str(roundn(results(k+5,1),-1))])
        txt(1).Color = 'red'
    end  
    set(gca, 'XTick',1:5, 'XTickLabel',scenarios)
    title('Puissance disponible source froide [kWth]')

    %% 
    subplot(3,2,4)
    yyaxis left          % plot against left y-axis  
    plot(1:5,results(1:5,2),'*')
    axis([1 5 -250 3750])
    for k=1:5
        txt = text(k+0.1,results(k,2),[num2str(roundn(results(k,2),-1))])
        txt(1).Color = 'blue'
    end
    yyaxis right         % plot against right y-axis
    plot(1:5,results(6:10,2),'*')
    axis([1 5 -500 4000])
    legend('GNL','Azote','Location','northwest')
    for k=1:5
        txt = text(k+0.1,results(k+5,2),[num2str(roundn(results(k+5,2),-1))])
        txt(1).Color = 'red'
    end  
    set(gca, 'XTick',1:5, 'XTickLabel',scenarios)
    title('Puissance n�cessaire source chaude [kWth]')

    %% 
    subplot(3,2,5)
    yyaxis left          % plot against left y-axis  
    plot(1:5,results(1:5,3),'*')
    axis([1 5 -25 700])
    for k=1:5
        txt = text(k+0.1,results(k,3),[num2str(roundn(results(k,3),-1))])
        txt(1).Color = 'blue'
    end  
    yyaxis right         % plot against right y-axis
    plot(1:5,results(6:10,3),'*')
    axis([1 5 -150 650])
    legend('GNL','Azote','Location','northwest')
    for k=1:5
        txt = text(k+0.1,results(k+5,3),[num2str(roundn(results(k+5,3),-1))])
        txt(1).Color = 'red'
    end 
    set(gca, 'XTick',1:5, 'XTickLabel',scenarios)
    title('Puissance �lectrique brute [kWe]')
    
    %% PUISSANCE ELECTRIQUE BRUTE
    subplot(3,2,6)
    yyaxis left          % plot against left y-axis  
    plot(1:5,results(1:5,4),'*')
    axis([1 5 -5e4 5.5e5])
    for k=1:5
        txt = text(k+0.1,results(k,4),[num2str(roundn(results(k,4),-1))])
        txt(1).Color = 'blue'
    end  
    yyaxis right         % plot against right y-axis
    plot(1:5,results(6:10,4),'*')
    axis([1 5 -1e5 5e5])
    legend('GNL','Azote','Location','northwest')
    for k=1:5
        txt = text(k+0.1,results(k+5,4),[num2str(roundn(results(k+5,4),-1))])
        txt(1).Color = 'red'
    end  
    set(gca, 'XTick',1:5, 'XTickLabel',scenarios)
    title('D�bit volumique de ventilation [m^3/h]')
    
    % CALCUL CONSOMMATION GAZ
%   Puissance_thermique_GNL = Puissance_necessaire_src_chaude/PCS_methane; % Puissance thermique en gaz [kW]
%   Masse_GNL_bruler = Puissance_thermique_GNL*Rho_methane_gaz*Temps_vaporisation; % Masse de GNL br�l� [kg]
%   Pourcentage_GNL_bruler = (Masse_GNL_bruler*100)/(Volume_GNL*Rho_methane_liquide); % Pourcentage de GNL br�l� [%]
end