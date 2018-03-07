From Matlab
cd <ThisDirector>
addpath(genpath(pwd))
L5RootDir = '/misc/2StorageDell/GEP_TestSpinua/L5_SPP/786ee3b5-0dfe-4513-8558-8ab8c0c542f2/IW2_VV/LAT37.01_37.09LON14.20_14.35/out';
inPrmFileName = './Prm_SPINUA_GEP_TemplatePhase1.m';
outPrmFileName = 'Prm_SPINUA_GEP_OperationalPhase1_prova.m';
disableMvDirs = '0';
runLinkL5ToL7_SPINUA_GEP(L5RootDir,inPrmFileName,outPrmFileName,disableMvDirs)

From Bash
Configure and execute runLinkL5ToL7_SPINUA_GEP.rc 