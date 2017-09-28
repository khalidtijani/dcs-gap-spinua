## Developer Cloud Sandbox SPINUA application  

SPINUA (Stable Point INterferometry even over Unurbanized Areas) is a PSI-like algorithm originally developed for detection and monitoring of coherent targets (CT) in non- or scarcely- urbanized areas, extended for applications involving densely urbanized areas, as well as to assure proper processing of high resolution X-band data from both CSK and TSX. SPINUA through GEP will be used to derive deformation maps in Indonesia over test sites.

Available SPINUA processing Step
--------------------------------

* [SPINUA-Step X0: The Splitter](src/main/app-resources/SPINUA-Step-X0)
* [SPINUA-Step 00: SLC data download](src/main/app-resources/SPINUA-Step-00)
* [SPINUA-Step 01: Supermaster Selection](src/main/app-resources/SPINUA-Step-01)
* [SPINUA-Step 02: DEM pre-processing](src/main/app-resources/SPINUA-Step-02)
* [SPINUA-Step 03: Substep Configuration](src/main/app-resources/SPINUA-Step-03)
* [SPINUA-Step 03: Substep Interferogram Generation](src/main/app-resources/SPINUA-Step-03)
* [SPINUA-Step 04: Geocoding](src/main/app-resources/SPINUA-Step-04)
* [SPINUA-Step 05: Crop Generation](src/main/app-resources/SPINUA-Step-05)
* [SPINUA-Step 06: PSC - Persistent Scatterers Candidate](src/main/app-resources/SPINUA-Step-06)
* [SPINUA-Step 07: Substep Configuration](src/main/app-resources/SPINUA-Step-07)
* [SPINUA-Step 08: Substep Patch Processing](src/main/app-resources/SPINUA-Step-08)
* [SPINUA-Step FD: Final Delivery](src/main/app-resources/SPINUA-Step-08)




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
git clone https://github.com/khalidtijani/dcs-cnr-issia-spinua.git
cd dcs-cnr-issia-spinua
ls 
Jenkinsfile  pom.xml  README.md  spinua  src
```

#### Pre-requisites


##### MATLAB Runtime

Run compiled MATLAB applications or components without installing MATLAB

The MATLAB Runtime is a standalone set of shared libraries that enables the execution of compiled MATLAB applications or components on computers that do not have MATLAB installed.

To download and install the MATLAB Runtime:

The Release R2016b (MATLAB Runtime Version 9.1 and Linux platform that corresponds to the application or component you are using.

```bash
cd /home/${USER}
wget -c http://ssd.mathworks.com/supportfiles/downloads/R2016b/deployment_files/R2016b/installers/glnxa64/MCR_R2016b_glnxa64_installer.zip
```

Unzip the MATLAB Runtime installer at the terminal using the unzip command.
if you are unzipping the R2016b MATLAB Runtime installer, at the Terminal, type:

```bash
unzip MCR_R2016b_glnxa64_installer.zip -d unzip MCR_R2016b_glnxa64_installer
cd MCR_R2016b_glnxa64_installer
./install -destinationFolder /home/$USER/MCR_R2016b
```

On the target computer, append the following to your STORAGE and SPINUA environment variable in the file /home/{{$USER}/.bashrc

```bash
vi /home/${USER}/.bashrc
```

Add two lines, Save and exit 

export STORAGE=/home/{$USER}/dcs-cnr-issia-spinua/spinua/storage

export SPINUA=/home/{$USER}/dcs-cnr-issia-spinua/spinua/bin/GAP/gap_chain_v2.0

```bash
source /home/${USER}/.bashrc
```

Put here the requirements of the application in terms of software packages. For example:

* snap

To install these packages, run the simple steps below on the Developer Cloud Sandbox shell:

```bash
sudo yum install -y snap
```

#### Using the development version

Install the pre-requisites as instructed above.

Log on the Developer Cloud Sandbox and run these commands in a shell:

```bash
git clone https://github.com/khalidtijani/dcs-cnr-issia-spinua.git
cd dcs-cnr-issia-spinua
mvn install
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

### <a name="authors"></a>Authors (alphabetically)

* Author

### <a name="questions"></a>Questions, bugs, and suggestions

Please file any bugs or questions as [issues](<app-url>) or send in a pull request if you corrected any.

### <a name="license"></a>License

Licensed under the Apache License, Version 2.0: http://www.apache.org/licenses/LICENSE-2.0

### <a name="funding"></a>Funding

Put here any information about the funding.
