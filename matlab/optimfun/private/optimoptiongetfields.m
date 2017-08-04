function optimfields = optimoptiongetfields
%OPTIMOPTIONGETFIELDS returns fieldnames of options in Optimization Toolbox.
%
% This function returns fieldnames of options in Optimization Toolbox 
% but not in MATLAB.
%
% This is a helper function for OPTIMSET and OPTIMGET.

%   OPTIMFIELDS = OPTIMOPTIONGETFIELDS returns a cell array OPTIMFIELDS of the 
%   fieldnames of options in the Optimization Toolbox but not in MATLAB. 
%
%   See also OPTIMSET, OPTIMGET.

%   Copyright 1990-2012 The MathWorks, Inc. 

optimfields =   {...
    'ActiveConstrTol'; ...
    'Algorithm'; ...
    'AlwaysHonorConstraints'; ...
    'BranchStrategy'; ...
    'DerivativeCheck'; ...
    'Diagnostics'; ...
    'DiffMaxChange'; ...
    'DiffMinChange'; ...
    'FinDiffRelStep'; ...
    'FinDiffType'; ...
    'GoalsExactAchieve'; ...
    'GradConstr'; ...
    'GradObj'; ...
    'HessFcn'; ...
    'Hessian'; ...
    'HessMult'; ...
    'HessPattern'; ...
    'HessUpdate'; ...
    'InitialHessType'; ...
    'InitialHessMatrix'; ...
    'InitBarrierParam'; ...
    'InitTrustRegionRadius'; ...
    'Jacobian'; ...
    'JacobMult'; ...
    'JacobPattern'; ...
    'LargeScale'; ...
    'MaxNodes'; ...
    'MaxPCGIter'; ...
    'MaxProjCGIter'; ...    
    'MaxRLPIter'; ...
    'MaxSQPIter'; ...
    'MaxTime'; ...
    'MeritFunction'; ...
    'MinAbsMax'; ...
    'NodeDisplayInterval'; ...
    'NodeSearchStrategy'; ...
    'NoStopIfFlatInfeas'; ... 
    'ObjectiveLimit'; ...
    'PhaseOneTotalScaling'; ...
    'Preconditioner'; ...
    'PrecondBandWidth'; ...
    'RelLineSrchBnd'; ...
    'RelLineSrchBndDuration'; ...
    'ScaleProblem'; ...
    'Simplex'; ...
    'SubproblemAlgorithm'; ...
    'TolCon'; ...
    'TolConSQP'; ...    
    'TolGradCon'; ...
    'TolPCG'; ...
    'TolProjCG'; ...
    'TolProjCGAbs'; ...
    'TolRLPFun'; ...
    'TolXInteger'; ...
    'TypicalX'; ...
    'UseParallel'};