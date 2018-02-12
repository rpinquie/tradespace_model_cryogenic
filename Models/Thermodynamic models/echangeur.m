echangeur(evaporateur,cocourant,Tfroid_e,Tfroid_s,Tchaud_e)

if evaporateur
    m_froid = 0.04; % Débit massique du fluide froid (éthane) [kg/s]
    m_chaud = ; % Débit massique du fluide chaud (air) [kg/s]
    Cp_froid = ; % Capacité thermique massique du fluide froid (GNL) [J/(kg.K]
    Cp_chaud = ; % Capacité thermique massique du fluide chaud (éthane) [J/(kg.K]
   
    C_froid = m_froid*Cp_froid; % Débit de capacité thermique du fluide chaud (éthane)
    C_chaud = m_chaud*Cp_chaud; % Débit de capacité thermique du fluide chaud (air)

    Flux = C_froid*(Tfroid_s-Tfroid_e); % Flux de chaleur gagné par le fluide froid (éthane liquide)
    Tchaud_s = ((C_chaud*Tchaud_e)-Flux)/Cchaud; % Tempérautre de sortie du fluide chaud (air)
else
    m_froid = ; % Débit massique du fluide froid (GNL) [kg/s]
    m_chaud = 0.04; % Débit massique du fluide chaud (éthane) [kg/s]
    Cp_froid = ; % Capacité thermique massique du fluide froid (GNL) [J/(kg.K]
    Cp_chaud = ; % Capacité thermique massique du fluide chaud (éthane) [J/(kg.K]

    C_froid = m_froid*Cp_froid; % Débit de capacité thermique du fluide froid (GNL)
    C_chaud = m_chaud*Cp_chaud; % Débit de capacité thermique du fluide chaud (éthane)
    
    Flux = C_chaud*(Tchaud_e-Tchaud_s); % Flux de chaleur gagné par le fluide froid (éthane liquide)
    Tfroid_s = (Flux+C_froid*Tfroid_e)/C_froid; % Tempérautre de sortie du fluide froid (gaz naturel)
end

if cocourant
    DTa = Tchaud_e_Tfroid_e;
    DTb = Tchaud_s-Tfroid_s;
else
    DTa = Tchaud_e_Tfroid_s;
    DTb = Tchaud_s-Tfroid_e;    
end

   DTml = (DTa-DTb)/ln(DTa/DTb);

   S = Flux/(K*DTml); % Surface d'échange

