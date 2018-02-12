echangeur(evaporateur,cocourant,Tfroid_e,Tfroid_s,Tchaud_e)

if evaporateur
    m_froid = 0.04; % D�bit massique du fluide froid (�thane) [kg/s]
    m_chaud = ; % D�bit massique du fluide chaud (air) [kg/s]
    Cp_froid = ; % Capacit� thermique massique du fluide froid (GNL) [J/(kg.K]
    Cp_chaud = ; % Capacit� thermique massique du fluide chaud (�thane) [J/(kg.K]
   
    C_froid = m_froid*Cp_froid; % D�bit de capacit� thermique du fluide chaud (�thane)
    C_chaud = m_chaud*Cp_chaud; % D�bit de capacit� thermique du fluide chaud (air)

    Flux = C_froid*(Tfroid_s-Tfroid_e); % Flux de chaleur gagn� par le fluide froid (�thane liquide)
    Tchaud_s = ((C_chaud*Tchaud_e)-Flux)/Cchaud; % Temp�rautre de sortie du fluide chaud (air)
else
    m_froid = ; % D�bit massique du fluide froid (GNL) [kg/s]
    m_chaud = 0.04; % D�bit massique du fluide chaud (�thane) [kg/s]
    Cp_froid = ; % Capacit� thermique massique du fluide froid (GNL) [J/(kg.K]
    Cp_chaud = ; % Capacit� thermique massique du fluide chaud (�thane) [J/(kg.K]

    C_froid = m_froid*Cp_froid; % D�bit de capacit� thermique du fluide froid (GNL)
    C_chaud = m_chaud*Cp_chaud; % D�bit de capacit� thermique du fluide chaud (�thane)
    
    Flux = C_chaud*(Tchaud_e-Tchaud_s); % Flux de chaleur gagn� par le fluide froid (�thane liquide)
    Tfroid_s = (Flux+C_froid*Tfroid_e)/C_froid; % Temp�rautre de sortie du fluide froid (gaz naturel)
end

if cocourant
    DTa = Tchaud_e_Tfroid_e;
    DTb = Tchaud_s-Tfroid_s;
else
    DTa = Tchaud_e_Tfroid_s;
    DTb = Tchaud_s-Tfroid_e;    
end

   DTml = (DTa-DTb)/ln(DTa/DTb);

   S = Flux/(K*DTml); % Surface d'�change

