
### SPINUA-Step 07: Crop and Persistent Scatterers Candidates

Crop of the interferograms over the AOI (Area Of Interest) and identification of the position of the Persistent Scatterers Candidates by exploiting the amplitudes of the coregistered SAR images.

##### Setup the environment variables
* [vi /application/env/env_include.sh](env/env_include.sh)

The Step-On installation is quite straightforward, and it is performed with the Maven tool:
```bash
cd dcs-gap-spinua/
mvn clean install -D step.on=7 -P bash
```

With the last command you installed the first step-on SPINUA Chain (option -D) using a bash profile (option -P). The profile represents the programming language used to implement the Hands-On run executables.


Go to the application’s default location (/application), by typing:
```bash
cd $_CIOP_APPLICATION_PATH
```
Check for a file named application.xml
Open it with a text editor (e.g. vi) and inspect its content. It will be similar to:

* [vi /application/application.xml](application.xml)

A run executable is responsible for the execution of your application (or a step of it) by the Hadoop compute engine. In the application.xml we defined a workflow with a single node and the related run executable:

* [vi /application/pscandidate/run](bash/pscandidate/run)


Run the node
List the available node(s) with:

```bash
ciop-run -n
```
This returns:

node_pscandidate

Execute it by typing:

```bash
ciop-run node_pscandidate
```

Wait until the workflow is completed (it will take approximately five minutes).

```bash
cd $STORAGE/S1Data/rootDataset/stdout    # as example rootDataset is the string that you choose as S1splitter outputfolder in application.xml  <parameter id="rootFolder" title="S1Data Input Output Folder of step 2..7" abstract="Define the S1Data rootOutputFolder L0,L1,L2,L3,L4,L5 levels" scope="runtime" maxOccurs="1">rootDataset</parameter>

ls -lrt *_cmd05_config.txt

tail -f $STORAGE/S1Data/rootDataset/stdout/Main_Spinua_Run_v2.0_stdout_2018.06.21_T11.23.43.114798122_cmd05_config.txt

and 

ls -lrt *_cmd06_config.txt

tail -f $STORAGE/S1Data/rootDataset/stdout/Main_Spinua_Run_v2.0_stdout_2018.06.21_T11.52.37.532480609_cmd06_config.txt


```

The result saved in this path $STORAGE/S1Data/rootDataset/L5_PSC_Map/27e07570-5493-4321-845c-44433405aafe/IW2_VV/LAT37.012_37.187LON14.201_14.459/out/FF_L7961_9701P13121_20641/PreProcessing/Search_PS_Results 

list of files:
AmplitudeStabilityBinaryMask_2.5.kml
AmplitudeStabilityBinaryMask_2.5.dbf
AmplitudeStabilityBinaryMask_2.5.prj
AmplitudeStabilityBinaryMask_2.5.shp
AmplitudeStabilityBinaryMask_2.5.shx

 