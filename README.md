Welcome to the dcs-gap-spinua wiki!

# Developer Cloud Sandbox SPINUA application  

SPINUA (Stable Point Interferometry even over Unurbanized Areas) is a PSI-like algorithm originally developed for detection and monitoring of coherent targets (CT) in non- or scarcely- urbanized areas, extended for applications involving densely urbanized areas, as well as to assure proper processing of high resolution X-band data from both COSMO-SkyMed and TerraSAR-X missions. SPINUA through GEP can be used to derive deformation maps by using Sentinel-1 IWS data.

The documentation is related to a real test performed by processing Sentinel-1 data over two areas located in Sicily (Italy) one affected by a subsidence and the other one by an infrustructure instability.
The following two figures shows the results obtained. These results can be replicated by GEP users by following the instructions indicated in the SPINUA github webpage.

Finally, it is important to stress the fact that this version can work only with small areas (less than 1km x 1km) due to the fact that the atmospheric artifacts are estimated with a linear model which is not suitable for large areas. It is evident that in the case of large areas these can be split into smaller overlapping sub-areas, then processed separately and finally stitched. This opens also interesting perspectives in terms of exploitation of multiprocessing approaches in order to quickly process in parallel multiple patches.

![Displacementmap1](https://github.com/khalidtijani/dcs-gap-spinua/blob/master/spinua/img/Displacement_map_GEP_withSPINUA.png)
**Fig.1: Displacement map obtained by processing a Sentinel-1 data-set with SPINUA version implemented on GEP. Two main areas exhibit displacement average velocities above 1 cm/year according to the colorbar on the bottom right corner.**

![Displacementmap1](https://github.com/khalidtijani/dcs-gap-spinua/blob/master/spinua/img/Displacement_map_GEP_withSPINUA2.png)
**Fig. 2: Examples of non-linear displacement trends obtained with the SPINUA version deployed on GEP.**

As illustrated in the following figure, the present version SPINUA software allows the generation of the Persistent Scatterers displacement maps in both shapefile and kml formats.

![Displacementmap1](https://github.com/khalidtijani/dcs-gap-spinua/blob/master/spinua/img/Displacement_map_GEP_withSPINUA_folder.png)
**Fig. 3: GIS and kml (Google Earth) formats available for the displacement maps generated with the SPINUA version deployed on GEP.**

Available SPINUA processing Step
--------------------------------

* [SPINUA-Step 01: The Splitter](https://github.com/khalidtijani/dcs-gap-spinua/tree/master/src/main/app-resources/spinua-step-1)
* [SPINUA-Step 02: SLC data download](https://github.com/khalidtijani/dcs-gap-spinua/tree/master/src/main/app-resources/spinua-step-2)
* [SPINUA-Step 03: Supermaster Selection](https://github.com/khalidtijani/dcs-gap-spinua/tree/master/src/main/app-resources/spinua-step-3)
* [SPINUA-Step 04: DEM pre-processing](https://github.com/khalidtijani/dcs-gap-spinua/tree/master/src/main/app-resources/spinua-step-4)
* [SPINUA-Step 05: Configuration and Interferogram Generation](https://github.com/khalidtijani/dcs-gap-spinua/tree/master/src/main/app-resources/spinua-step-5)
* [SPINUA-Step 06: Geocoding](https://github.com/khalidtijani/dcs-gap-spinua/tree/master/src/main/app-resources/spinua-step-6)
* [SPINUA-Step 07: Crop and Persistent Scatterers Candidate](https://github.com/khalidtijani/dcs-gap-spinua/tree/master/src/main/app-resources/spinua-step-7)
* [SPINUA-Step 08: Patch Processing and Final Delivery](https://github.com/khalidtijani/dcs-gap-spinua/tree/master/src/main/app-resources/spinua-step-8)




## Quick link  Test
 
* [Getting Started](#getting-started)
* [Installation](#installation)
* [Submitting the workflow](#submit)
* [Community and Documentation](#community)
* [Authors](#authors)
* [Questions, bugs, and suggestions](#questions)
* [License](#license)
* [Funding](#funding)

### <a name="getting-started"></a>Getting Started 

To run this application you will need a Developer Cloud Sandbox that can be requested at support (at) terradue.com

A Developer Cloud Sandbox provides Earth Sciences data access services, and helper tools for a user to implement, test and validate a scalable data processing application. It offers a dedicated virtual machine and a Cloud Computing environment.
The virtual machine runs in two different lifecycle modes: Sandbox mode and Cluster mode. 
Used in Sandbox mode (single virtual machine), it supports cluster simulation and user assistance functions in building the distributed application.
Used in Cluster mode (a set of master and slave nodes), it supports the deployment and execution of the application with the power of distributed computing for data processing over large datasets (leveraging the Hadoop Streaming MapReduce technology). 

### <a name="installation"></a>Installation

#### Using the development version

Install the pre-requisites as instructed above.

Log on the Developer Cloud Sandbox and run these commands in a shell:

```bash
git clone https://github.com/khalidtijani/dcs-gap-spinua.git
cd dcs-gap-spinua
ls 
Jenkinsfile  pom.xml  README.md  spinua  src
```

#### Pre-requisites


##### MATLAB Runtime 9.1

Run compiled MATLAB applications or components without installing MATLAB

The MATLAB Runtime is a standalone set of shared libraries that enables the execution of compiled MATLAB applications or components on computers that do not have MATLAB installed.


###### Installation

Install the package:
```bash
sudo yum install -y matlab-9.1
```
###### Usage
Configure the environment:  
```bash
export LD_LIBRARY_PATH=/opt/MCR_R2016b/v91/runtime/glnxa64:/opt/MCR_R2016b/v91/bin/glnxa64:/opt/MCR_R2016b/v91/sys/os/glnxa64:${LD_LIBRARY_PATH}
```

On the target computer, append the following to your STORAGE and SPINUA environment variable in the files

$HOME/dcs-gap-spinua/src/main/app-resources/spinua-step-$step.on/bash/env/env_include.sh  with step.on=1 (from 1 to 7) 

```bash
vi ${HOME}/dcs-gap-spinua/src/main/app-resources/spinua-step-1/bash/env/env_include.sh 
```

```bash
#set the environment variables to use SPINUA sw and Storage Path  
export STORAGE=/data/input/storage2
export USER=khalidtijani
export SPINUA=/home/${USER}/dcs-gap-spinua/spinua/bin/GAP/gap_chain_v2.0
export MAINSPINUA=/home/${USER}/dcs-gap-spinua/spinua
export COMMADS=/home/${USER}/dcs-gap-spinua/spinua
export PATH=/bin:/usr/local/bin:/usr/bin:$COMMADS/bin:${PATH}

#set the environment variables to use MATLAB Runtime v91 release R2016b
export MCR_ROOT=/opt/MCR_R2016b
export LD_LIBRARY_PATH=${MCR_ROOT}/v91/runtime/glnxa64:${MCR_ROOT}/v91/bin/glnxa64:${MCR_ROOT}/v91/sys/os/glnxa64:${LD_LIBRARY_PATH}
```

#### Install SPINUA-Step 01: The Splitter
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

* [vi /application/application.xml](https://github.com/khalidtijani/dcs-gap-spinua/blob/master/src/main/app-resources/spinua-step-1/application.xml)

A run executable is responsible for the execution of your application (or a step of it) by the Hadoop compute engine. In the application.xml we defined a workflow with a single node and the related run executable:

* [vi /application/splitter/run](https://github.com/khalidtijani/dcs-gap-spinua/blob/master/src/main/app-resources/spinua-step-1/bash/splitter/run)


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

ls -lrt *_cmdX0.txt

tail -f $STORAGE/S1splitter/StackDataset/stdout/Main_Spinua_Run_v2.0_stdout_2018.07.09_T11.02.26.547603596_cmdX0.txt
```

The result saved in this path $STORAGE/S1splitter/StackDataset/out 

Now we need to choose our dataset to be downloaded and used for the next Step of Spinua Chain.



#### Using the development version

Install the pre-requisites as instructed above.

Log on the Developer Cloud Sandbox and run these commands in a shell:

```bash
git clone https://github.com/khalidtijani/dcs-gap-spinua.git
cd dcs-gap-spinua
mvn clean install -D step.on=-id- -P bash
```

### <a name="submit"></a>Submitting the workflow

To submit the application with its default parameters, run the command below in the Developer Cloud Sandbox shell:

```bash
ciop-run
```
Or invoke the Web Processing Service via the Sandbox dashboard.

### <a name="community"></a>Community and Documentation

To learn more and find information go to 

* [Developer Cloud Sandbox](http://docs.terradue.com/developer-sandbox/)  

### <a name="authors"></a>Authors

* Maria Teresa Chiaradia
* Raffaele Nutricato
* Davide Oscar Nitti
* Khalid Tijani

### <a name="questions"></a>Questions, bugs, and suggestions

Please any bugs or questions as [issues](<https://github.com/khalidtijani/dcs-gap-spinua/issues>) or send an e-mail to:
raffaele.nutricato@gapsrl.eu or khalid.tijani@gapsrl.eu

### <a name="license"></a>License

Software: SPINUA (Stable Point INterferometry even over Unurbanized Areas)

Project: Indonesia Alcantara      

Release Date: 20180320                   

Copyright (c) 2018, GAP srl  

Geophysical Applications Processing - GAP srl       
c/o Dipartimento Interateneo di Fisica "M. Merlin"
Via Amendola 173, 70126 Bari, ITALY
                     

Licensed under the Apache License, Version 2.0: http://www.apache.org/licenses/LICENSE-2.0

### <a name="funding"></a>Funding

ESA Contract No. 4000114611/15/F/MOS – ALCANTARA INITIATIVE: INTERNATIONAL R&D STUDIES ANNOUNCEMENT OF OPPORTUNITY - Alcantara Study Enhanced Tectonic Characterization for Indonesia - Integrating SAR interferometry and GNSS for studying tectonic processes in Indonesia
