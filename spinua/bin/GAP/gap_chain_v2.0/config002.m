%-------------------------
% USER PARAMETERS
%-------------------------

UserPrms.Method='FINE'; % 'FAST', 'STANDARD' or 'FINE'

UserPrms.WorkingVelocityPrecision_mmy = 2.5;
UserPrms.WorkingDEMErrorPrecision_m = 15;

UserPrms.MaxDEMError_m = 60;
UserPrms.MaxVelocity_mmy = 60;

UserPrms.icvTH=NaN;
UserPrms.iicTH=NaN;
UserPrms.meanCohTH=0.45;
UserPrms.deltaIIC_product=-0.10;

UserPrms.maxNproc=100;

% UserPrms.dataset_diff_suffix='orig';
UserPrms.dataset_diff_suffix='det004';
