% Investment:
% Electrical power
% kWh_cost
% Margin_tank

function [results] = calculateIncome(Margin_tank,Electrical_power,kWh_cost)

%% Parameters

Investment = 1000000;
Tank_vol = 40000; % [kg]
LNG_flow_rate = 0.2;
Nb_tank = 30; % Number of tank consumed per week

%% Calculations

Vaporization_time = (Tank_vol/LNG_flow_rate)/3600; % [Hours] Time to evaporate a 40T tank
Vaporization_income = Vaporization_time*Electrical_power*kWh_cost; % [Euros] Income for the vaporization of a 40 T tank

Amortization = Investment/Margin_tank; % [] Number of tanks to sell to compensate investment
Nb_years = (Amortization/Nb_tank)/52; % Number of years to compensate investment

results.Vaporization_income = Vaporization_income;
results.Nb_years = Nb_years;

end
