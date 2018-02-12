function [results] = main(LPmin, LPmax, HPmin, HPmax)

% Intitialization
optimums = [];

% Design variables
fluids = {'propane','ethane','R41','R125','R143a','R134a','R245fa','R32','propylen','water'};

LPmin = LPmin*1e2;
LPmax = LPmax*1e2;
LP_x0 = (LPmin+(LPmax-LPmin)/2)*1.2;

HPmin = HPmin*1e2; % bar
HPmax = HPmax*1e2;
HP_x0 = (HPmin+(HPmax-HPmin)/2)*1e2;

%x4min = 0.88;
%x4max = 1;
%x4_x0 = 1;

% Set optization options
options = optimoptions('fmincon','Algorithm','interior-point','Display','iter');

% Run optimization for each fluid
for fluid = 1:length(fluids)
    
    % Critical temperature
    Tc = refpropm('T','C',0,' ',0,fluids{fluid});
    
    T3min = refpropm('T','P',HPmin,'Q',1,fluids{fluid});
    T3max = refpropm('T','P',HPmax,'Q',1,fluids{fluid});
    T3_x0 = T3min+(T3max-T3min)/2;
    Tambiant = convtemp(-20,'C','K')*0.98; % 25 % margin between Tsat and Tambiant

    if(T3max < Tc) && (T3min < T3max) && (T3max < Tambiant)
               
        % Initial guess: LP;HP;T3
        %x0 = [LPmin;HPmax;x0_T3;x4_x0]; % Initial guess vector is of size equal to the # of variables in the optimization problem)
        x0 = [LP_x0;HP_x0;T3_x0];
        
        % No need to define A, b, Aeq and beq if it is not a linear constraints problem
        A = []; % 
        b = []; % 
        Aeq = [];
        beq = [];

        % Set vectors corresponding to lower (LB) and upper (UP) bounds on the variables [x1;x2;x3;...]
        %LB = [LPmin;HPmin;minT3]; 
        %UB = [LPmax;HPmax;maxT3]; 
        LB = [LPmin;HPmin;T3min]; 
        UB = [LPmax;HPmax;T3max]; 

        % Local optimization
        %[xopt, fopt] = fmincon(@(x)objfun(x,fluids{fluid}), x0, A, b, Aeq, beq, LB, UB,'nonlcon');  
        
        % Global obtimization
        gs = GlobalSearch;
        ms = MultiStart;
        opts = optimoptions(@fmincon,'Algorithm','interior-point');
        options.Display = 'iter';
        f = @(x)objfun(x,fluids{fluid});
        problem = createOptimProblem('fmincon','x0',x0,'objective',f,'lb',LB,'ub',UB,'options',opts);
        [xopt, fopt, flagg, outptg, manyminsg] = run(gs,problem); % Run with GlobalSearch algorithm
        %[xopt, fopt, flagg, outptg, manyminsg] = run(ms,problem,50); % Run with MultiStart algorithm
         
        optimums(fluid,1) = abs(fopt*100); % Optimum Eff
        optimums(fluid,2) = xopt(1)*1e-2; % Optimum LP
        optimums(fluid,3) = xopt(2)*1e-2; % Optimum HP
        optimums(fluid,4) = convtemp(xopt(3),'K','C'); % Optimum T3
        optimums(fluid,5) = fluid; % Optimum fluid
    end
end

optimums

optimumEffIdx = find(optimums(:,1) == max(optimums(:,1)));
results.Eff = roundn(optimums(optimumEffIdx,1),-1);
results.LP = roundn(optimums(optimumEffIdx,2),-1);
results.HP = roundn(optimums(optimumEffIdx,3),-1);
results.T3 = roundn(optimums(optimumEffIdx,4),-1);
results.Fluid = fluids{optimums(optimumEffIdx,5)};
results.Tsat_LP = roundn(convtemp(refpropm('T','P',results.LP*1e2,'Q',0,results.Fluid),'K','C'),-1);

structure = IdealRankine(results.LP*1e2,results.HP*1e2,convtemp(results.T3,'C','K'),results.Fluid); % Modify

results.LT = roundn(structure.LT,-1);
results.x4 = roundn(structure.x4,-1);
results.Wp_in = roundn(structure.Wp_in,-1);
results.Qe_in = roundn(structure.Qe_in,-1);
results.Wt_out = roundn(structure.Wt_out,-1);
results.Qc_out = roundn(structure.Qc_out,-1);
results.Wnet = roundn(structure.Wnet,-1);

%% PLOT BAR CHART FLUID VS RANKINE EFFICIENCY

 barChart = bar(optimums(:,1));
 set(gca,'xticklabel',{'propane','ethane','R41','R125','R143a','R134a','R245fa','R32','propylene','water'});
 [max_val,max_id] = max(optimums(:,1));
 optimalFluidName = fluids{max_id}; % Name of optimal fluid
 hold on
 bar(max_id,max(optimums(:,1)),'red') % Plot optimal fluid bar in red
 hold off

