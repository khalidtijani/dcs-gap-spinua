### SPINUA-Step X0: The Splitter

ESA Sentinel-1 catalogue Browsing for interferometric data takes identification.

#### Install SPINUA-Step X0: The Splitter

##### Setup the environment variables
* [vi /application/env/env_include.sh](env/env_include.sh)


The Step-On installation is quite straightforward, and it is performed with the Maven tool:
```bash
cd dcs-gap-spinua/
mvn clean install -D step.on=1 -P bash
```

With the last command you installed the first step-on SPINUA Chain (option -D) using a bash profile (option -P). The profile represents the programming language used to implement the Hands-On run executables.


Go to the application’s default location (/application), by typing:
```bash
cd $_CIOP_APPLICATION_PATH
```
Check for a file named application.xml
Open it with a text editor (e.g. vi) and inspect its content. It will be similar to:

* [vi /application/application.xml](src/main/app-resources/spinua-step-1/application.xml)

A run executable is responsible for the execution of your application (or a step of it) by the Hadoop compute engine. In the application.xml we defined a workflow with a single node and the related run executable:

* [vi /application/splitter/run](src/main/app-resources/spinua-step-1/bash/splitter/run)


Run the node
List the available node(s) with:

```bash
ciop-run -n
```
This returns:

node_splitter

Execute it by typing:

```bash
ciop-run node_splitter
```
```bash


cd $STORAGE/S1splitter/StackDataset/stdout/    # as example StackDataset is the string that you choose as S1splitter outputfolder in application.xml  <parameter id="splitterout">StackDataset</parameter>

ls

Main_Spinua_Run_v2.0_stdout_2017.10.04_T14.04.33.266557272_cmdX0.txt

tail -f $STORAGE/S1splitter/StackDataset/stdout/Main_Spinua_Run_v2.0_stdout_2017.10.04_T14.04.33.266557272_cmdX0.txt
```

The result saved in this path $STORAGE/S1splitter/StackDataset/out

Now we need to choose our dataset to be downloaded and used for the next Step of Spinua Chain.

