
### SPINUA-Step 04: DEM pre-processing

External DTM download and pre-processing (mosaicking + geodi2ellipsoid conversion).

##### Setup the environment variables
* [vi /application/env/env_include.sh](env/env_include.sh)

The Step-On installation is quite straightforward, and it is performed with the Maven tool:
```bash
cd dcs-gap-spinua/
mvn clean install -D step.on=4 -P bash
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

* [vi /application/dem/run](bash/dem/run)


Run the node
List the available node(s) with:

```bash
ciop-run -n
```
This returns:

node_dem

Execute it by typing:

```bash
ciop-run node_dem
```

Wait until the workflow is completed (it will take approximately five minutes).

```bash
cd $STORAGE/S1Data/rootDataset/stdout    # as example rootDataset is the string that you choose as S1splitter outputfolder in application.xml  <parameter id="rootFolder" title="S1Data Input Output Folder of step 2..7" abstract="Define the S1Data rootOutputFolder L0,L1,L2,L3,L4,L5 levels" scope="runtime" maxOccurs="1">rootDataset</parameter>

ls -lrt *_cmd02_config.txt

tail -f $STORAGE/S1Data/rootDataset/stdout/Main_Spinua_Run_v2.0_stdout_2018.04.20_T23.28.27.875244847_cmd02_config.txt

```

The result saved in this path $STORAGE/S1Data/rootDataset/L2_DEM_preprocessing/out
 