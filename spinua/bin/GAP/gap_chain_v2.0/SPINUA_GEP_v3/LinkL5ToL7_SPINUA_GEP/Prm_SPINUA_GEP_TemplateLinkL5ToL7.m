%-------------------------
% USER PARAMETERS
%-------------------------
UserPrms.Method='FINE'; 

UserPrms.WorkingVelocityPrecision_mmy = 2.55;
UserPrms.WorkingDEMErrorPrecision_m = 40;

UserPrms.MaxDEMError_m = 60;
UserPrms.MaxVelocity_mmy = 200;

UserPrms.icvTH=NaN;
UserPrms.iicTH=0.85;
UserPrms.meanCohTH=0.45;
UserPrms.deltaIIC_product=-0.10;

UserPrms.dataset_diff_suffix='orig';
% UserPrms.dataset_diff_suffix='det004';

UserPrms.maxNproc=100;
 
%======================================================================================================== 
% END SECTION "USER SETTINGS" 
%======================================================================================================== 

GLUE_CODE_SETTINGS.runPrefixID=0;
GLUE_CODE_SETTINGS.process='L7'; 
GLUE_CODE_SETTINGS.swathID='';
GLUE_CODE_SETTINGS.Xfact = 1; 
GLUE_CODE_SETTINGS.SetToNaN = NaN; 
GLUE_CODE_SETTINGS.InputPSMapSource = 'PSC'; 
GLUE_CODE_SETTINGS.EnableStitchPSCMaps = 0; 
GLUE_CODE_SETTINGS.enableOnlyEdgeEstimation = 0;
GLUE_CODE_SETTINGS.EnableInterClusterProcessing = 0;
GLUE_CODE_SETTINGS.APSR_Iter = 0;
GLUE_CODE_SETTINGS.SPVDEEImportStyle = 'IIPSTE';  
GLUE_CODE_SETTINGS.APSR_InDir = '/lustrehome/rsg01/storage/S1Data/D_orb124_TS0002/L13_IIPSTE/e3a2157e-b974-4228-9219-e3aec988b4e4/IW2_VV/LAT37.01_37.18LON14.20_14.45/43918454-b837-0825-6b8b-efc472db8d06/001/lastIt/out/r000_IIPSTE_It0_L8030_9740_P13120_20440';  
GLUE_CODE_SETTINGS.EnablePSReports = 0;  
GLUE_CODE_SETTINGS.IIPSTE_MergeAPSR.enable = 0;
% ------------------
% --- PROCESSES. ---
% ------------------
   SPEA_SettingStr.Enable       = strcmp(upper(GLUE_CODE_SETTINGS.process),'L6');
   SPSC_SettingStr.Enable       = strcmp(upper(GLUE_CODE_SETTINGS.process),'L7')|strcmp(upper(GLUE_CODE_SETTINGS.process),'L8')|strcmp(upper(GLUE_CODE_SETTINGS.process),'L9');
   SPSC_SettingStr.AS.Enable    = strcmp(upper(GLUE_CODE_SETTINGS.process),'L7');
   SPSC_SettingStr.PSP.Enable   = 0;
   SPSC_SettingStr.COH.Enable   = strcmp(upper(GLUE_CODE_SETTINGS.process),'L8');
   SPSC_SettingStr.RP.Enable    = strcmp(upper(GLUE_CODE_SETTINGS.process),'L9');
   SEARCH_DSC_SettingStr.Enable = 0;
   SPP2VDE_SettingStr.Enable    = strcmp(upper(GLUE_CODE_SETTINGS.process),'L10');
   if strcmp(upper(GLUE_CODE_SETTINGS.process),'L11')
      SPP2VDE_SettingStr.Enable    = GLUE_CODE_SETTINGS.EnableInterClusterProcessing;
   end
   DSC_SettingStr.Enable        = strcmp(upper(GLUE_CODE_SETTINGS.process),'L11');
   APSR_SettingStr.Enable       = strcmp(upper(GLUE_CODE_SETTINGS.process),'L12');
   IIPSTE_SettingStr.Enable     = strcmp(upper(GLUE_CODE_SETTINGS.process),'L13');
   SS_enable_PatchSelection     = 0;
   SS_enable_LAPSR              = 0;
   SS_enable_StitchPSMaps       = 0;
   SS_enable_BFLBNLTE           = 0;
   SS_enable_ReportsAndkmlGenerator = 0;
   SS_enable_patchinfo          = 0; 
   MR_StitchPSMaps_SettingsStr.PH_PATCHESPAIRS2VDE_Enable = 0;
   PH_CMP_LAPSR_SPP2VDEE_SettingStr.Enable = 0;
% ----------------------
% --- END PROCESSES. ---
% ----------------------
 
   runPrefix = ['r',num2str(GLUE_CODE_SETTINGS.runPrefixID,'%.3d'),'_']; 
   
   GBL_SettingsStr.MASTER_DATE_DD   = GLUE_CODE_SETTINGS.smDATE(7:8); 
   GBL_SettingsStr.MASTER_DATE_MM   = GLUE_CODE_SETTINGS.smDATE(5:6); 
   GBL_SettingsStr.MASTER_DATE_YYYY = GLUE_CODE_SETTINGS.smDATE(1:4); 
   GBL_SettingsStr.MASTER_NAME      = ['SLC',GLUE_CODE_SETTINGS.smDATE];
   GBL_SettingsStr.RAM_MB           = 600; 

   GBL_SettingsStr.TUNED_AZI = 0;
   GBL_SettingsStr.TUNED_RNG = 0;
   
   GBL_SettingsStr.SLC_DIFF_STACK_DIRECTORY = 'NOT_USED';
   GBL_SettingsStr.SLCHdrFilename           = fullfile(GBL_SettingsStr.SLC_DIFF_STACK_DIRECTORY,[GBL_SettingsStr.MASTER_NAME,'_Master'],'Master_rslc.hdr');
   GBL_SettingsStr.DiffHdrFilename          = fullfile(GBL_SettingsStr.SLC_DIFF_STACK_DIRECTORY,[GBL_SettingsStr.MASTER_NAME,'_Master'],[GBL_SettingsStr.MASTER_NAME,'_Master_DiffInt']);
   GBL_SettingsStr.LatLonHeightDir          = GBL_SettingsStr.SLC_DIFF_STACK_DIRECTORY; 
   GBL_SettingsStr.LatLonHeightFilenames(1) = cellstr(fullfile(GBL_SettingsStr.LatLonHeightDir,[GBL_SettingsStr.MASTER_NAME,'_LAT.bin']));
   GBL_SettingsStr.LatLonHeightFilenames(2) = cellstr(fullfile(GBL_SettingsStr.LatLonHeightDir,[GBL_SettingsStr.MASTER_NAME,'_LON.bin']));
   GBL_SettingsStr.LatLonHeightFilenames(3) = cellstr(fullfile(GBL_SettingsStr.LatLonHeightDir,[GBL_SettingsStr.MASTER_NAME,'_HEI.bin']));
    
   
   [tmpflag,tmpSensorPrm] = GetSensorInfo(GBL_SettingsStr.SensorMFileName,1);

   GBL_SettingsStr.LineSpacing_m = tmpSensorPrm.AzimuthSpacing_m;
   GBL_SettingsStr.RangeSpacing_m = tmpSensorPrm.RangeSpacing_m;
   GBL_SettingsStr.PixelSpacing_m = tmpSensorPrm.RangeSpacing_m/sin(tmpSensorPrm.meanincidangle_rad);
   GBL_SettingsStr.wavelength_m = tmpSensorPrm.wavelength_m;
   clear tmpSensorPrm

   GBL_SettingsStr.MP.MatlabCommand= {...
      'ssh matrixserver; export TERM=vt100; /mnt/sw/bin/matlab -nosplash -nodesktop -c /mnt/sw/licenses/license_clientdell1_161051_R2008a.lic';...
      'ssh terminator11; export TERM=vt100; /mnt/sw/bin/matlab -nosplash -nodesktop -c /mnt/sw/licenses/license_clientdell1_161051_R2008a.lic';...
      'ssh terminator21; export TERM=vt100; /mnt/sw/bin/matlab -nosplash -nodesktop -c /mnt/sw/licenses/license_clientdell1_161051_R2008a.lic'...
      };
   
   GBL_SettingsStr.MP.NProcessors = 0*[10;5;2];

   GBL_SettingsStr.MP.N_WORKERS = 4;
   GBL_SettingsStr.GEOCODE_SETTINGS.DELTA_LAT  = 3/30;
   GBL_SettingsStr.GEOCODE_SETTINGS.DELTA_LON  = 3/30;
   
   GBL_SettingsStr.WorkingVelocityPrecision_mmy = UserPrms.WorkingVelocityPrecision_mmy; 
   GBL_SettingsStr.WorkingDEMErrorPrecision_m = UserPrms.WorkingDEMErrorPrecision_m;
   GBL_SettingsStr.DEMErrorRange_m = UserPrms.MaxDEMError_m;
   GBL_SettingsStr.Velocity_mmy = UserPrms.MaxVelocity_mmy;
   GBL_SettingsStr.TrilinCoarseStepDEMError_m = 2; 
   GBL_SettingsStr.TrilinCoarseStepVelocity_mmy = 2;
   GBL_SettingsStr.TrilinCoarseStepDeltaxRange_m = 2;
   GBL_SettingsStr.UseDistributedScatterers = 0;
   
   GBL_SettingsStr.SilentProcessing = 1; 
   
      SPEA_SettingStr.WorkingIIC = UserPrms.iicTH;
   SS_ProcDirPrefixName             = 'FF_';
   SS_CalibrCoordFirstLastLine = [GLUE_CODE_SETTINGS.CROP_PSC.minL GLUE_CODE_SETTINGS.CROP_PSC.maxL];
   SS_CalibrCoordFirstLastPixel = [GLUE_CODE_SETTINGS.CROP_PSC.minP GLUE_CODE_SETTINGS.CROP_PSC.maxP];

    SPSC_SettingStr.AS.enableReadAlwaysInBinFile = 0;
   SPSC_SettingStr.AS.enableEqualization = 1; 
   
   SPSC_SettingStr.AS.CropAbsFLLines = SS_CalibrCoordFirstLastLine;
   SPSC_SettingStr.AS.CropAbsFLPixels = SS_CalibrCoordFirstLastPixel;
   SPSC_SettingStr.AS.OutFiles.Precision = 'float32';
   SPSC_SettingStr.AS.OutFiles.Format = 'l';
   SPSC_SettingStr.AS.OutFiles.Order = 'LINE';

   if isnan(UserPrms.icvTH)
      SPSC_SettingStr.AS.rule_NimgTh = [0   25  30  33  40  50  100  999]; 
      SPSC_SettingStr.AS.rule_ICVth = [5.0 5.0 4.5 4.0 3.5 3.0 2.5 2.5]; 
      SPSC_SettingStr.AS.ICVTh=round(interp1(SPSC_SettingStr.AS.rule_NimgTh,SPSC_SettingStr.AS.rule_ICVth,GLUE_CODE_SETTINGS.Nslc)*10)/10;
   else
      SPSC_SettingStr.AS.ICVTh=UserPrms.icvTH;
   end
   
   SPSC_SettingStr.AS.cohWinSizeLinePixel = [(ceil(50/GBL_SettingsStr.LineSpacing_m)*2)+1,(ceil(50/GBL_SettingsStr.PixelSpacing_m)*2)+1]; 
                                                           
	SPSC_SettingStr.AS.calibrImagePartionLinePixel = [1,1]; 
   SPSC_SettingStr.AS.EnableOnlyQualityCheck = 0;
   SPSC_SettingStr.AS.OutDir=[SS_ProcDirPrefixName,'L',num2str(SS_CalibrCoordFirstLastLine(1)),'_',num2str(SS_CalibrCoordFirstLastLine(2)),'P',...
         num2str(SS_CalibrCoordFirstLastPixel(1)),'_',num2str(SS_CalibrCoordFirstLastPixel(2))];
   SPSC_SettingStr.AS.AntiPSInputBinFileName = fullfile(GBL_SettingsStr.SPINUA_PROCESSING_DIRECTORY,SPSC_SettingStr.AS.OutDir,'PreProcessing','Search_PS_Results','AntiPSMask_ini.bin'); 
   
   SPSC_SettingStr.COH.CropAbsFLLines = SS_CalibrCoordFirstLastLine;
   SPSC_SettingStr.COH.CropAbsFLPixels = SS_CalibrCoordFirstLastPixel;

   SPSC_SettingStr.COH.InPSCRunDirName = SPSC_SettingStr.AS.OutDir;
   SPSC_SettingStr.COH.outDir = ['DiffCohPairs_L',num2str(SPSC_SettingStr.COH.CropAbsFLLines(1)),'_',num2str(SPSC_SettingStr.COH.CropAbsFLLines(2)),'P',...
         num2str(SPSC_SettingStr.COH.CropAbsFLPixels(1)),'_',num2str(SPSC_SettingStr.COH.CropAbsFLPixels(2))];
   SPSC_SettingStr.COH.outMatFileName = fullfile(SPSC_SettingStr.COH.outDir,'ComplexCoh_OutStruct.mat');
   SPSC_SettingStr.COH.outMatVarName = 'ComplexCoh_OutStruct';
   SPSC_SettingStr.COH.DBMatFileName = fullfile(SPSC_SettingStr.COH.InPSCRunDirName,'PreProcessing','Search_PS_Results','DataBaseStr.mat');
   SPSC_SettingStr.COH.InLatBinFileName = fullfile(SPSC_SettingStr.COH.InPSCRunDirName,'PreProcessing','Search_PS_Results','SPS_Latitude.bin');
   SPSC_SettingStr.COH.InLonBinFileName = fullfile(SPSC_SettingStr.COH.InPSCRunDirName,'PreProcessing','Search_PS_Results','SPS_Longitude.bin');
   SPSC_SettingStr.COH.InHeiFileName = fullfile(SPSC_SettingStr.COH.InPSCRunDirName,'PreProcessing','Search_PS_Results','SPS_Height.bin');
   SPSC_SettingStr.COH.OutFiles.Precision = 'float64';
   SPSC_SettingStr.COH.OutFiles.Format = 'l';
   SPSC_SettingStr.COH.OutFiles.Order = 'LINE';
   SPSC_SettingStr.COH.SkipExistingBinFiles = 0;
   SPSC_SettingStr.COH.doPlot = 0;

   SPSC_SettingStr.COH.PS_AntiPS_MaskInBinFileName = fullfile(SPSC_SettingStr.COH.InPSCRunDirName,'PreProcessing','Search_PS_Results','AntiPSMask.bin'); 

   SPSC_SettingStr.COH.BTempTh_d = 37;
   SPSC_SettingStr.COH.BPerpTh_m = 150;

   SPSC_SettingStr.COH.cohSizeRowCol = GT_nextOdd([ceil(50/GBL_SettingsStr.PixelSpacing_m),ceil(50/GBL_SettingsStr.LineSpacing_m)]);
   SPSC_SettingStr.COH.minPixelsPerCohComputation = round(0.9*prod(SPSC_SettingStr.COH.cohSizeRowCol));
   SPSC_SettingStr.COH.GenErrorIfMoreThanOneTree = 0;
   
   SPSC_SettingStr.COH.APSER.enable = 0;
   SPSC_SettingStr.COH.APSER.cohSizeRowCol = GT_nextOdd([ceil(2000/GBL_SettingsStr.PixelSpacing_m),ceil(2000/GBL_SettingsStr.LineSpacing_m)]);
   SPSC_SettingStr.COH.APSER.minPixelsPerCohComputation = 30;
   SPSC_SettingStr.COH.APSER.InCoherenceThreshold = 0.4; 
   
    SPSC_SettingStr.COH.ComputeMeanCoh = 1;
    SPSC_SettingStr.COH.StitchPSCMaps.Enable = 0;

   SPSC_SettingStr.COH.StitchPSCMaps.EnableASType = 1; 
   SPSC_SettingStr.COH.StitchPSCMaps.AS.ASTh = SPSC_SettingStr.AS.ICVTh; 
   SPSC_SettingStr.COH.StitchPSCMaps.AS.ASToIIC = 0.75;
    SPSC_SettingStr.COH.StitchPSCMaps.KML_IICTh = 0.85;
   DiffCohPairsGeneration_InPrmStr = SPSC_SettingStr.COH; 

   
   SPSC_SettingStr.PSP.CropAbsFLLines = SS_CalibrCoordFirstLastLine;
   SPSC_SettingStr.PSP.CropAbsFLPixels = SS_CalibrCoordFirstLastPixel;
   
   SPSC_SettingStr.PSP.SearchBoxSizeLinePixel = GT_nextOdd([17 11]);
   SPSC_SettingStr.PSP.MinNumberOfGoodPairsPerPS = 2;
   SPSC_SettingStr.PSP.PairCohTh = 0.7;

   SPSC_SettingStr.PSP.DEMErrorRange_m = [-GBL_SettingsStr.DEMErrorRange_m 1 GBL_SettingsStr.DEMErrorRange_m];
   SPSC_SettingStr.PSP.VelocityRange_mmyear = [-GBL_SettingsStr.Velocity_mmy 1 GBL_SettingsStr.Velocity_mmy];
   SPSC_SettingStr.PSP.DeltaxRange_m = [0 1 0];

   SPSC_SettingStr.PSP.doPlot = 1; 
   
   SPSC_tmpPSCDir = fullfile(GBL_SettingsStr.SPINUA_PROCESSING_DIRECTORY,MR_GenPSCMapPatchDirName(SS_ProcDirPrefixName,SS_CalibrCoordFirstLastLine,SS_CalibrCoordFirstLastPixel,'PSC'));
   
   SPSC_SettingStr.PSP.InputDiff.InputDir   = fullfile(SPSC_tmpPSCDir,'PreProcessing','Initial_Differentials');
   SPSC_SettingStr.PSP.InputDiff.Prefix     = '';
   SPSC_SettingStr.PSP.InputDiff.Suffix     = '_Diff';
    SPSC_SettingStr.PSP.InputDiff.Extension  = 'bin';
   SPSC_SettingStr.PSP.InputDiff.AbsFLLine  = SPSC_SettingStr.PSP.CropAbsFLLines;
   SPSC_SettingStr.PSP.InputDiff.AbsFLPixel = SPSC_SettingStr.PSP.CropAbsFLPixels;
   SPSC_SettingStr.PSP.InputDiff.LatBinFile    = fullfile(SPSC_tmpPSCDir,'PreProcessing','Search_PS_Results','SPS_Latitude.bin');
   SPSC_SettingStr.PSP.InputDiff.LonBinFile    = fullfile(SPSC_tmpPSCDir,'PreProcessing','Search_PS_Results','SPS_Longitude.bin');
   SPSC_SettingStr.PSP.InputDiff.HeightBinFile = fullfile(SPSC_tmpPSCDir,'PreProcessing','Search_PS_Results','SPS_Height.bin');
   SPSC_SettingStr.PSP.InputDiff.MeanSLCAmpl   = fullfile(SPSC_tmpPSCDir,'PreProcessing','Search_PS_Results','MeanSLCAmplitude.bin');
   SPSC_SettingStr.PSP.InputDiff.AntiPSMap     = fullfile(SPSC_tmpPSCDir,'PreProcessing','Search_PS_Results','AntiPSMask.bin');
   
   SPSC_SettingStr.PSP.OutDir = ['SPSC_PSP_Results',num2str(SPSC_SettingStr.PSP.CropAbsFLLines,'L%d_%d'),num2str(SPSC_SettingStr.PSP.CropAbsFLPixels,'P%d_%d')];
   SPSC_SettingStr.PSP.OutFiles.Precision = 'float32';
   SPSC_SettingStr.PSP.OutFiles.Format = 'l';
   SPSC_SettingStr.PSP.OutFiles.Order = 'LINE';
   
   SPSC_SettingStr.PSP.enableLoadEstimations = 1;
   
   SPSC_SettingStr.PSP.AmplStabilityMap.EnableIntegration = 1;
   SPSC_SettingStr.PSP.AmplStabilityMap.Th = 3.5;
   SPSC_SettingStr.RP.EnableSparsePatches = 1; 
   SPSC_SettingStr.RP.USE_TRY_CATCH = 0; 
   
   SPSC_SettingStr.RP.SparseCropAbsFLLine   = SS_CalibrCoordFirstLastLine(1)+[1 100]; 
   SPSC_SettingStr.RP.SparseCropAbsFLPixel  = SS_CalibrCoordFirstLastPixel(1)+[1 300];

   SPSC_SettingStr.RP.CropAbsFLLine   = SS_CalibrCoordFirstLastLine; 
   SPSC_SettingStr.RP.CropAbsFLPixel  = SS_CalibrCoordFirstLastPixel; 
      if (GBL_SettingsStr.wavelength_m < 0.0375)
         SPSC_SettingStr.RP.WinsSizeLine     = [ceil(350*GLUE_CODE_SETTINGS.Xfact/GBL_SettingsStr.LineSpacing_m)]; 
          SPSC_SettingStr.RP.WinsSizePixel    = [ceil(350*GLUE_CODE_SETTINGS.Xfact/GBL_SettingsStr.PixelSpacing_m)];
      else
          SPSC_SettingStr.RP.WinsSizeLine     = [ceil(500*GLUE_CODE_SETTINGS.Xfact/GBL_SettingsStr.LineSpacing_m)];
          SPSC_SettingStr.RP.WinsSizePixel    = [ceil(500*GLUE_CODE_SETTINGS.Xfact/GBL_SettingsStr.PixelSpacing_m)];
      end      
      SPSC_SettingStr.RP.WinsLineOverlap  = ceil(0.25*SPSC_SettingStr.RP.WinsSizeLine); 
      SPSC_SettingStr.RP.WinsPixelOverlap = ceil(0.25*SPSC_SettingStr.RP.WinsSizePixel); 

      SPSC_SettingStr.RP.NIterPerPatch    = 1; 
   SPSC_SettingStr.RP.MinImgsPerRun    = [6 9]; 
      
   SPSC_SettingStr.RP.rule_NimgTh  = [0   25  30  33  40  50  100 999]; 
   SPSC_SettingStr.RP.rule_deltaICV= [0.7 0.7 0.7 0.7 0.5 0.3 0.1 0.1];
   SPSC_SettingStr.RP.deltaICV=round(interp1(SPSC_SettingStr.RP.rule_NimgTh,SPSC_SettingStr.RP.rule_deltaICV,GLUE_CODE_SETTINGS.Nslc)*10)/10;
      
    SPSC_SettingStr.RP.InputPSMapSource = GLUE_CODE_SETTINGS.InputPSMapSource;
   if (strcmp(SPSC_SettingStr.RP.InputPSMapSource,'PSC'))
      SPSC_SettingStr.RP.InputPSMapThFirstIteration  = (round(SPSC_SettingStr.AS.ICVTh*100))/100; 
      SPSC_SettingStr.RP.InputPSMapMinThFirstIteration  = SPSC_SettingStr.RP.InputPSMapThFirstIteration-SPSC_SettingStr.RP.deltaICV; 
   elseif (strcmp(SPSC_SettingStr.RP.InputPSMapSource,'STITCHED_PSC_MAP'))
      SPSC_SettingStr.RP.InputPSMapThFirstIteration  = SPEA_SettingStr.WorkingIIC; 
      SPSC_SettingStr.RP.InputPSMapMinThFirstIteration  = SPEA_SettingStr.WorkingIIC-0.05; 
   elseif (strcmp(SPSC_SettingStr.RP.InputPSMapSource,'COMBO')) 
      SPSC_SettingStr.RP.InputPSMapThFirstIteration  = [SPEA_SettingStr.WorkingIIC*GLUE_CODE_SETTINGS.SetToNaN,UserPrms.meanCohTH,(round(SPSC_SettingStr.AS.ICVTh*100))/100]; 
      SPSC_SettingStr.RP.InputPSMapMinThFirstIteration  = SPSC_SettingStr.RP.InputPSMapThFirstIteration-[0.05,0.05,SPSC_SettingStr.RP.deltaICV]; 
      SPSC_SettingStr.RP.decBoxSizeRowCol = GT_nextOdd([1,1;SPSC_SettingStr.COH.cohSizeRowCol;1,1]); 
      SPSC_SettingStr.RP.densityBoxSizeRowCol = GT_nextOdd([201,201;201,201;201,201]); 
      SPSC_SettingStr.RP.minDecimationDensity = 3; 
   else
      error('unknown setting');
   end      
   SPSC_SettingStr.RP.InputPSMapThOtherIterations = SPEA_SettingStr.WorkingIIC; 
   SPSC_SettingStr.RP.InputPSMapMinThOtherIterations = SPEA_SettingStr.WorkingIIC-0.05; 
   
   SPSC_SettingStr.RP.MinPSPatch = 15; 
   
   SPSC_SettingStr.RP.LAPSR_INTRAIMG_COH_TH_INTERIMG_EST = 0.7; 
   SPSC_SettingStr.RP.LAPSR_MAX_ITER = 15; 
   SPSC_SettingStr.RP.LAPSR_APS_TOPO_EST_START_ITER = SPSC_SettingStr.RP.LAPSR_MAX_ITER+10; 
   
   
      SPSC_SettingStr.RP.LAPSR_ENABLE_ONLY_CONSTANT_ESTIM = 0; 
      SPSC_SettingStr.RP.LAPSR_MIN_PS_LINE_SPACING             = 20; 
      SPSC_SettingStr.RP.LAPSR_MIN_PS_PIXEL_SPACING            = 20; 
      SPSC_SettingStr.RP.LAPSR_LIN_APS_LINE_PAD_FFT2           = 2048/2; 
      SPSC_SettingStr.RP.LAPSR_LIN_APS_PIXEL_PAD_FFT2          = 2048/2; 
      SPSC_SettingStr.RP.LAPSR_LIN_APS_LINE_REFINEMENT_FACTOR  = 10; 
      SPSC_SettingStr.RP.LAPSR_LIN_APS_PIXEL_REFINEMENT_FACTOR = 10; 
   
   SPSC_SettingStr.RP.LAPSR_INTERIMG_COH_TH_INTRAIMG_EST = SPSC_SettingStr.RP.InputPSMapThOtherIterations; 
   SPSC_SettingStr.RP.LAPSR_MIN_PERC_SP_INTRAIMG_EST = 0.8;  
   SPSC_SettingStr.RP.LAPSR_MAXABSDEMERROR_M = GBL_SettingsStr.DEMErrorRange_m; 
   SPSC_SettingStr.RP.LAPSR_MAXABSVELOCITY_MMYEAR = GBL_SettingsStr.Velocity_mmy; 
   SPSC_SettingStr.RP.LAPSR_MAXDELTAX_M = 0; 

   SPSC_SettingStr.RP.LAPSR_STEPABSDEMERROR_M = 1; 
   SPSC_SettingStr.RP.LAPSR_STEPABSVELOCITY_MMYEAR = 1; 
   SPSC_SettingStr.RP.LAPSR_STEPDELTAX_M = 1; 

   SPSC_SettingStr.RP.LAPSR_APS_INTIMG_LIN_EST_BPERP = 'OFF'; 
   SPSC_SettingStr.RP.LAPSR_APS_INTIMG_LIN_EST_BTEMP = 'OFF'; 
   SPSC_SettingStr.RP.LAPSR_APS_INTIMG_LIN_EST_DOPPLCENTR = 'OFF'; 
   
   SPSC_SettingStr.RP.LAPSR_ENABLE_DEBIAS_SP_VALUES = 1; 

   
   SPSC_SettingStr.RP.BBFLTE_MAXABSDEMERROR_M = GBL_SettingsStr.DEMErrorRange_m; 
   SPSC_SettingStr.RP.BBFLTE_MAXABSVELOCITY_MMYEAR = GBL_SettingsStr.Velocity_mmy; 
   SPSC_SettingStr.RP.BBFLTE_MAXDELTAX_M = 0; 

   SPSC_SettingStr.RP.BBFLTE_STEPABSDEMERROR_M = 1; 
   SPSC_SettingStr.RP.BBFLTE_STEPABSVELOCITY_MMYEAR = 1; 
   SPSC_SettingStr.RP.BBFLTE_STEPDELTAX_M = 1; 

   SPSC_SettingStr.RP.BBFLTE_ENABLE_BLOCKWISE = 'ON'; 
   SPSC_SettingStr.RP.BBFLTE_INPUT_STABILITY_MAP_TH = -10; 
   SPSC_SettingStr.RP.EnableDeleteIntermediateRuns = 1; 

   SPSC_SettingStr.RP.OutDir = [SS_ProcDirPrefixName,'SPSC_RP_Results',num2str(SPSC_SettingStr.RP.CropAbsFLLine,'L%d_%d'),num2str(SPSC_SettingStr.RP.CropAbsFLPixel,'P%d_%d')]; 
   SPSC_SettingStr.RP.OutFiles.Precision = 'float32'; 
   SPSC_SettingStr.RP.OutFiles.Format = 'l'; 
   SPSC_SettingStr.RP.OutFiles.Order = 'LINE'; 

   SPSC_SettingStr.RP.StitchPSCMaps.Enable = GLUE_CODE_SETTINGS.EnableStitchPSCMaps; 

   SPSC_SettingStr.RP.StitchPSCMaps.EnableASType = 0; 
   SPSC_SettingStr.RP.StitchPSCMaps.AS.ASTh = SPSC_SettingStr.AS.ICVTh; 
   SPSC_SettingStr.RP.StitchPSCMaps.AS.ASToIIC = SPEA_SettingStr.WorkingIIC+0.01;
   
   SPSC_SettingStr.RP.StitchPSCMaps.EnableBEST_LAPSRType = 1; 
   SPSC_SettingStr.RP.StitchPSCMaps.BEST_LAPSR.IICTh = SPEA_SettingStr.WorkingIIC; 
   
   SPSC_SettingStr.RP.StitchPSCMaps.EnableExistingSPPositionsMap = 1; 
   SPSC_SettingStr.RP.StitchPSCMaps.EnableRemovePatches = GBL_SettingsStr.SilentProcessing; 
   
   SPSC_SettingStr.RP.EnablePSReports = 0; 

   SPSC_SettingStr.RP.PSReports.SkipLAPSRBBFLTERuns = 0; 
   SPSC_SettingStr.RP.PSReports.InterImageEstimation.Enable = 0; 
   SPSC_SettingStr.RP.PSReports.InterImageEstimation.DEMErrorRange_m = [-GBL_SettingsStr.DEMErrorRange_m,1,GBL_SettingsStr.DEMErrorRange_m];
   SPSC_SettingStr.RP.PSReports.InterImageEstimation.VelocityRange_mmyear = [-GBL_SettingsStr.Velocity_mmy,1,GBL_SettingsStr.Velocity_mmy];
   SPSC_SettingStr.RP.PSReports.InterImageEstimation.DeltaxRange_m = [0,1,0];
   

   SPSC_SettingStr.RP.PSReports.CorrectDEMErrLatLon.Enable = 0;

   SPSC_SettingStr.RP.PSReports.CorrectDEMErrLatLon.globalDerampCoeffsDEMError = [6.8695   -0.0010   -0.0001]; 
  
   SPSC_SettingStr.RP.PSReports.CorrectDEMErrLatLon.globalDerampDEMError.RemoveAddFlag = 1; 
   SPSC_SettingStr.RP.PSReports.CorrectDEMErrLatLon.globalDerampDEMError.OffsetLatitude = 0; 
   SPSC_SettingStr.RP.PSReports.CorrectDEMErrLatLon.globalDerampDEMError.OffsetLongitude = 0; 


   APSR_SettingStr.Iter = GLUE_CODE_SETTINGS.APSR_Iter; 

   APSR_SettingStr.CropAbsFLLines = SS_CalibrCoordFirstLastLine;
   APSR_SettingStr.CropAbsFLPixels = SS_CalibrCoordFirstLastPixel;


   APSR_SettingStr.OutDir = [runPrefix,'APSR_It',num2str(APSR_SettingStr.Iter),'_L',...
      num2str(APSR_SettingStr.CropAbsFLLines(1)),'_',...
      num2str(APSR_SettingStr.CropAbsFLLines(2)),'_P',...
      num2str(APSR_SettingStr.CropAbsFLPixels(1)),'_',...
      num2str(APSR_SettingStr.CropAbsFLPixels(2))];
      
      
   IIPSTE_SettingStr.CropAbsFLLines  = APSR_SettingStr.CropAbsFLLines;
   IIPSTE_SettingStr.CropAbsFLPixels = APSR_SettingStr.CropAbsFLPixels;

   IIPSTE_SettingStr.MergeAPSR.enable = GLUE_CODE_SETTINGS.IIPSTE_MergeAPSR.enable; 
   if IIPSTE_SettingStr.MergeAPSR.enable
      if (GBL_SettingsStr.UseDistributedScatterers == 0)
         IIPSTE_SettingStr.MergeAPSR.IIPSTE_InMergeDir1 = [runPrefix,'IIPSTE_It0_L',...
            num2str(IIPSTE_SettingStr.CropAbsFLLines(1)),'_',...
            num2str(IIPSTE_SettingStr.CropAbsFLLines(2)),'_P',...
            num2str(IIPSTE_SettingStr.CropAbsFLPixels(1)),'_',...
            num2str(IIPSTE_SettingStr.CropAbsFLPixels(2))];
         IIPSTE_SettingStr.MergeAPSR.IIPSTE_InMergeDir2 = strrep(IIPSTE_SettingStr.MergeAPSR.IIPSTE_InMergeDir2,'IIPSTE_It0_L','IIPSTE_It1_L');
      else
         IIPSTE_SettingStr.MergeAPSR.IIPSTE_InMergeDir1 = [runPrefix,'IIDSTE_It0_L',...
            num2str(IIPSTE_SettingStr.CropAbsFLLines(1)),'_',...
            num2str(IIPSTE_SettingStr.CropAbsFLLines(2)),'_P',...
            num2str(IIPSTE_SettingStr.CropAbsFLPixels(1)),'_',...
            num2str(IIPSTE_SettingStr.CropAbsFLPixels(2))];
         IIPSTE_SettingStr.MergeAPSR.IIPSTE_InMergeDir2 = strrep(IIPSTE_SettingStr.MergeAPSR.IIPSTE_InMergeDir2,'IIDSTE_It0_L','IIDSTE_It1_L');
      end
   else
      IIPSTE_SettingStr.MergeAPSR.IIPSTE_InMergeDir1 = '';
      IIPSTE_SettingStr.MergeAPSR.IIPSTE_InMergeDir2 = '';
   end

   if IIPSTE_SettingStr.MergeAPSR.enable
      IIPSTE_SettingStr.Iter = 2; 
   else
      IIPSTE_SettingStr.Iter = APSR_SettingStr.Iter; 
   end

   IIPSTE_SettingStr.OutFiles.Precision = 'float32';
   IIPSTE_SettingStr.OutFiles.Format = 'l';
   IIPSTE_SettingStr.OutFiles.Order = 'LINE';
   if (GBL_SettingsStr.UseDistributedScatterers == 0)
      IIPSTE_SettingStr.OutDir = [runPrefix,'IIPSTE_It',num2str(IIPSTE_SettingStr.Iter),'_L',...
         num2str(IIPSTE_SettingStr.CropAbsFLLines(1)),'_',...
         num2str(IIPSTE_SettingStr.CropAbsFLLines(2)),'_P',...
         num2str(IIPSTE_SettingStr.CropAbsFLPixels(1)),'_',...
         num2str(IIPSTE_SettingStr.CropAbsFLPixels(2))];
   else
      IIPSTE_SettingStr.OutDir = [runPrefix,'IIDSTE_It',num2str(IIPSTE_SettingStr.Iter),'_L',...
         num2str(IIPSTE_SettingStr.CropAbsFLLines(1)),'_',...
         num2str(IIPSTE_SettingStr.CropAbsFLLines(2)),'_P',...
         num2str(IIPSTE_SettingStr.CropAbsFLPixels(1)),'_',...
         num2str(IIPSTE_SettingStr.CropAbsFLPixels(2))];
   end
   IIPSTE_SettingStr.InterImageEstimation.Enable = 1;
   if (GBL_SettingsStr.PixelSpacing_m < 2.5)
      tmpDEStep = 0.1;
   else
      tmpDEStep = 0.5;
   end
   IIPSTE_SettingStr.DEMErrorRange_m = [-GBL_SettingsStr.DEMErrorRange_m tmpDEStep GBL_SettingsStr.DEMErrorRange_m]; 
   IIPSTE_SettingStr.VelocityRange_mmyear = [-GBL_SettingsStr.Velocity_mmy .5 GBL_SettingsStr.Velocity_mmy];
   IIPSTE_SettingStr.DeltaxRange_m = [0 1 0];
   
   IIPSTE_SettingStr.RephDiff.InputDir   = {fullfile(APSR_SettingStr.OutDir,'RephasedDiff')};
   IIPSTE_SettingStr.RephDiff.Prefix     = {''};
   IIPSTE_SettingStr.RephDiff.Suffix     = {''};
   IIPSTE_SettingStr.RephDiff.Extension  = {'bin'}; 
   IIPSTE_SettingStr.RephDiff.AbsFLLine  = APSR_SettingStr.CropAbsFLLines;
   IIPSTE_SettingStr.RephDiff.AbsFLPixel = APSR_SettingStr.CropAbsFLPixels;
   IIPSTE_SettingStr.RephDiff.latitudeFilename    = 'Out_Latitude.bin';
   IIPSTE_SettingStr.RephDiff.longitudeFilename   = 'Out_Longitude.bin';
   IIPSTE_SettingStr.RephDiff.heightFilename      = 'Out_Height.bin';
   IIPSTE_SettingStr.RephDiff.meanSLCAmplFilename = 'Out_MeanSLCAmplitude.bin';

   if (GBL_SettingsStr.UseDistributedScatterers == 0)
      IIPSTE_SettingStr.GenReph.InputDir   = {fullfile(GBL_SettingsStr.SPINUA_PROCESSING_DIRECTORY,SPSC_SettingStr.AS.OutDir,'PreProcessing','Initial_Differentials'),...
                                               fullfile(APSR_SettingStr.OutDir,'APS')};
      IIPSTE_SettingStr.GenReph.Prefix     = {'',''};
      IIPSTE_SettingStr.GenReph.Suffix     = {'_Diff','_TurbPha'};
      IIPSTE_SettingStr.GenReph.Extension  = {'bin','bin'}; 
      if IIPSTE_SettingStr.MergeAPSR.enable
         IIPSTE_SettingStr.GenReph.InputDir(3:4)  = {fullfile(GBL_SettingsStr.SPINUA_PROCESSING_DIRECTORY,SPSC_SettingStr.AS.OutDir,'PreProcessing','Initial_Differentials'),...
                                                     fullfile(strrep(APSR_SettingStr.OutDir,'APSR_It0','APSR_It1'),'APS')};
         IIPSTE_SettingStr.GenReph.Prefix(3:4)    = {'',''};
         IIPSTE_SettingStr.GenReph.Suffix(3:4)    = {'_Diff','_TurbPha'};
         IIPSTE_SettingStr.GenReph.Extension(3:4) = {'bin','bin'}; 
      end
   else
      IIPSTE_SettingStr.GenReph.InputDir   = {fullfile(SearchDS_InPrmStr.outDir,'Initial_Differentials_DS'),...
                                               fullfile(APSR_SettingStr.OutDir,'APS')};
      IIPSTE_SettingStr.GenReph.Prefix     = {'',''};
      IIPSTE_SettingStr.GenReph.Suffix     = {'_Diff','_TurbPha'};
      IIPSTE_SettingStr.GenReph.Extension  = {'bin','bin'}; 
   end      
   
   IIPSTE_SettingStr.PSInMask.binFileName = fullfile(SPSC_SettingStr.AS.OutDir,'PreProcessing','Search_PS_Results','InverseCoeffVariationMap.bin');
   IIPSTE_SettingStr.PSInMask.AbsFLLine  = SS_CalibrCoordFirstLastLine;
   IIPSTE_SettingStr.PSInMask.AbsFLPixel = SS_CalibrCoordFirstLastPixel;
   IIPSTE_SettingStr.PSInMask.Threshold = -0.75;
      
   IIPSTE_SettingStr.NthOrderFit.Enable = 0;
   IIPSTE_SettingStr.NthOrderFit.Type = '3rdOrderPolynomial'; 
   IIPSTE_SettingStr.NthOrderFit.DEMErrorRange_mMinStepMax = [-60 1 60];
   IIPSTE_SettingStr.NthOrderFit.DeltaxRange_m = [0 1 0];
   IIPSTE_SettingStr.NthOrderFit.rangeP3y  = 2.4e-8;
   IIPSTE_SettingStr.NthOrderFit.rangeP2y  = 4e-5;
   IIPSTE_SettingStr.NthOrderFit.VelocityRange_mmyearMinStepMax = [-50 1 50];
   
   IIPSTE_SettingStr.PSReports.Enable = GLUE_CODE_SETTINGS.EnablePSReports;
   if IIPSTE_SettingStr.PSReports.Enable
      if isfield(UserPrms,'deltaIIC_product')
         IIPSTE_SettingStr.PSReports.PSCohTh = SPEA_SettingStr.WorkingIIC+UserPrms.deltaIIC_product; 
      else
         IIPSTE_SettingStr.PSReports.PSCohTh = SPEA_SettingStr.WorkingIIC; 
      end
   else
      IIPSTE_SettingStr.PSReports.PSCohTh = 0.99; 
   end
   IIPSTE_SettingStr.PSReports.TrendsTimeReference = 'FIRST_DATE'; 
   
   IIPSTE_SettingStr.PSReports.enableESTIMATOR2 = 0; 
   IIPSTE_SettingStr.PSReports.enableESTIMATOR3 = 0; 
   
   IIPSTE_SettingStr.PSReports.LoadExistingPhaseValues = -1; 
   IIPSTE_SettingStr.PSReports.LoadExistingLOSFiles = 1; 
   
   IIPSTE_SettingStr.PSReports.CropAbsFLLines  = IIPSTE_SettingStr.CropAbsFLLines; 
   IIPSTE_SettingStr.PSReports.CropAbsFLPixels = IIPSTE_SettingStr.CropAbsFLPixels; 
   IIPSTE_SettingStr.PSReports.BlockStepLinePixel = [100000,100000]; 
   IIPSTE_SettingStr.PSReports.OffsetsVelDEMErrAzPosLatLon = [0 0 0 0 0];
   IIPSTE_SettingStr.PSReports.SuppressDEMErrorEstimations = 0; 
   
   IIPSTE_SettingStr.PSReports.CropMinMaxLat_deg = [-Inf,Inf]; 
   IIPSTE_SettingStr.PSReports.CropMinMaxLon_deg = [-Inf,Inf];
   IIPSTE_SettingStr.PSReports.iicBinFileName = 'Out_InterImgCoh.bin';
   IIPSTE_SettingStr.PSReports.latBinFileName = 'Out_Latitude.bin';
   IIPSTE_SettingStr.PSReports.lonBinFileName = 'Out_Longitude.bin';
   IIPSTE_SettingStr.PSReports.velBinFileName = 'Out_ConstVel_mmy.bin';
   IIPSTE_SettingStr.PSReports.MinMaxVelmmy = [-Inf,Inf];
   IIPSTE_SettingStr.PSReports.enableLoadMatFiles = 1; 
   
   IIPSTE_SettingStr.PSReports.SHPKMLTrendsGeneration.IICTh = IIPSTE_SettingStr.PSReports.PSCohTh; 
   IIPSTE_SettingStr.PSReports.outDir = ['SPINUA_Coh0',num2str(IIPSTE_SettingStr.PSReports.SHPKMLTrendsGeneration.IICTh*100)];

   IIPSTE_SettingStr.PSReports.SHPGeneration.enable = 1; 
   IIPSTE_SettingStr.PSReports.SHPGeneration.IICTh = IIPSTE_SettingStr.PSReports.SHPKMLTrendsGeneration.IICTh; 
   IIPSTE_SettingStr.PSReports.maxPSPerShapeFile = 30000;
   IIPSTE_SettingStr.PSReports.IncludeLOSProj = 1; 
   IIPSTE_SettingStr.PSReports.IncludeVertProj = 0; 
   IIPSTE_SettingStr.PSReports.IncludeSemiAnnualVel  = 0;
   IIPSTE_SettingStr.PSReports.SemiAnnualVelOnePeriodPerShape = 0;
   IIPSTE_SettingStr.PSReports.IncludeAnnualVel  = 0; 
   IIPSTE_SettingStr.PSReports.AnnualVelOnePeriodPerShape = 0;
   IIPSTE_SettingStr.PSReports.IncludeGEOCoordinates = 1; 
   IIPSTE_SettingStr.PSReports.IncludeUTMCoordinates = 1; 
   IIPSTE_SettingStr.PSReports.IncludeCumDisplacements = 1; 
   IIPSTE_SettingStr.PSReports.CumDisplacementsOneDatePerShape = 0; 
   IIPSTE_SettingStr.PSReports.ChangeCRS = 0;
   IIPSTE_SettingStr.PSReports.decimalCount.DISPL = 1; 
   IIPSTE_SettingStr.PSReports.decimalCount.VEL = 1; 
   IIPSTE_SettingStr.PSReports.decimalCount.INC_ANG = 3; 
   IIPSTE_SettingStr.PSReports.decimalCount.DEM = 1; 
   IIPSTE_SettingStr.PSReports.decimalCount.COH = 2;
   IIPSTE_SettingStr.PSReports.decimalCount.UTM_E = 0; 
   IIPSTE_SettingStr.PSReports.decimalCount.UTM_N = 0; 
   IIPSTE_SettingStr.PSReports.decimalCount.LAT = 6; 
   IIPSTE_SettingStr.PSReports.decimalCount.LON = 6; 

   IIPSTE_SettingStr.PSReports.KMLGeneration.enable = 1; 
   IIPSTE_SettingStr.PSReports.patchSizeLP = [1000 1000];
   IIPSTE_SettingStr.PSReports.KMLGeneration.flag_stretch = 1;
   IIPSTE_SettingStr.PSReports.KMLGeneration.ThMinMaxVelocity = [0 -10 10];
   IIPSTE_SettingStr.PSReports.KMLGeneration.VelAbsTh = 0; 
   IIPSTE_SettingStr.PSReports.KMLGeneration.IICTh = IIPSTE_SettingStr.PSReports.SHPKMLTrendsGeneration.IICTh; 
   IIPSTE_SettingStr.PSReports.KMLGeneration.CropMinMaxLat = [-Inf,Inf];
   IIPSTE_SettingStr.PSReports.KMLGeneration.CropMinMaxLon = [-Inf,Inf];
   IIPSTE_SettingStr.PSReports.KMLGeneration.Output_filenameVelMap_kml = fullfile(IIPSTE_SettingStr.PSReports.outDir,'GoogleEarth',['Vel_',...
      'Str',num2str(IIPSTE_SettingStr.PSReports.KMLGeneration.flag_stretch),'_',...
      'IICTh0',num2str(round(IIPSTE_SettingStr.PSReports.KMLGeneration.IICTh*100)),'_',...
      'VelTh',num2str(IIPSTE_SettingStr.PSReports.KMLGeneration.VelAbsTh),'',...
      '.kml']);

   IIPSTE_SettingStr.PSReports.TrendGeneration.enable = 1; 
   IIPSTE_SettingStr.PSReports.TrendGeneration.StopAndPlotFig = 0; 
   IIPSTE_SettingStr.PSReports.TrendGeneration.VelAbsTh = 0; 
   IIPSTE_SettingStr.PSReports.TrendGeneration.IICTh = IIPSTE_SettingStr.PSReports.KMLGeneration.IICTh; 
   IIPSTE_SettingStr.PSReports.TrendGeneration.CropMinMaxLat = IIPSTE_SettingStr.PSReports.KMLGeneration.CropMinMaxLat;
   IIPSTE_SettingStr.PSReports.TrendGeneration.CropMinMaxLon = IIPSTE_SettingStr.PSReports.KMLGeneration.CropMinMaxLon;
   IIPSTE_SettingStr.PSReports.TrendGeneration.nReplicas = 0;
   IIPSTE_SettingStr.PSReports.LoadData.IICth = IIPSTE_SettingStr.PSReports.KMLGeneration.IICTh;
   IIPSTE_SettingStr.PSReports.Logo = 'Rheticus';
	IIPSTE_SettingStr.PSReports.WriteShapeFiles = 0;
   IIPSTE_SettingStr.PSReports.ShapeFile.NPSPerFile = 100e3;
   IIPSTE_SettingStr.PSReports.ShapeFile.flagPartialVels = 1; 
   IIPSTE_SettingStr.PSReports.ShapeFile.generateTextVersion = 1; 
   IIPSTE_SettingStr.PSReports.ShapeFile.insert.VERT_VEL_PROJ = 0; 
   IIPSTE_SettingStr.PSReports.ShapeFile.insert.LOS_COS = 0;
   IIPSTE_SettingStr.PSReports.ShapeFile.insert.LOOK_ANG = 0;
   IIPSTE_SettingStr.PSReports.ShapeFile.insert.DECIMFLAG = 0;
   IIPSTE_SettingStr.PSReports.ShapeFile.insert.ESTIMATOR2 = 0; 
   IIPSTE_SettingStr.PSReports.ShapeFile.insert.ESTIMATOR3 = 0; 
  

   IIPSTE_SettingStr.PSReports.KML.Decimation.Enable = 0;
   IIPSTE_SettingStr.PSReports.DecimationBlockSize_m = 100;
   IIPSTE_SettingStr.PSReports.KML.FullSampling.Enable = 0;
   IIPSTE_SettingStr.PSReports.TrendPlots = 0;
   IIPSTE_SettingStr.PSReports.ThTrendPlots = 5; 
   IIPSTE_SettingStr.PSReports.ThMinMaxVelocity = [0 -10 10];
   IIPSTE_SettingStr.PSReports.ThMinMaxDEMErr   = [0 -10 10];
   IIPSTE_SettingStr.PSReports.ThMinMaxAzPos    = [0 -10 10];
   IIPSTE_SettingStr.PSReports.GE_3DView = 'clampToGround'; 
   
   IIPSTE_SettingStr.PSReports.KML.Overlay.Enable = 0;
   IIPSTE_SettingStr.PSReports.KML.Overlay.spacing_m=15; 
   IIPSTE_SettingStr.PSReports.KML.Overlay.offValues2add=[-3:3];
   IIPSTE_SettingStr.PSReports.KML.Overlay.conv2SizeNcyc=[3 3];
   IIPSTE_SettingStr.PSReports.KML.Overlay.rminmax=[-10 10];
   IIPSTE_SettingStr.PSReports.KML.Overlay.OutOfRange=[-Inf Inf];
   IIPSTE_SettingStr.PSReports.KML.Overlay.ValuesTh=[0 0];
   IIPSTE_SettingStr.PSReports.KML.Overlay.flag_stretch=1;
   IIPSTE_SettingStr.PSReports.KML.Overlay.flagExactInterpolation=1;
   IIPSTE_SettingStr.PSReports.KML.Overlay.IICth=[0.90 0.95]; 
   IIPSTE_SettingStr.CorrectDEMErrLatLon.Enable = 0; 
   CorrectDEMErrLatLon.globalDerampCoeffsDEMError = [6.8695   -0.0010   -0.0001]; 
  
   CorrectDEMErrLatLon.globalDerampDEMError.RemoveAddFlag = 1; 
   CorrectDEMErrLatLon.globalDerampDEMError.OffsetLatitude = 0; 
   CorrectDEMErrLatLon.globalDerampDEMError.OffsetLongitude = 0; 
