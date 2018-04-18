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

* [vi /application/application.xml](application.xml)

A run executable is responsible for the execution of your application (or a step of it) by the Hadoop compute engine. In the application.xml we defined a workflow with a single node and the related run executable:

* [vi /application/splitter/run](bash/splitter/run)


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

Wait until the workflow is completed (it will take approximately five minutes).

#####Browse the results

Open a browser and type http://$HOSTNAME:50070

Sometimes the Hands-On refer to the variable $HOSTNAME. To obtain its value type:
```bash
echo $HOSTNAME
```

The output will be similar to:
```bash
sb-xx-xx-xx-xx.lab.terradue.int
```

Click on the link Browse the filesystem,
Click on the link ciop,
Click on the link run,
Click on the link hands-on-8,
Click on the link representing the workflow id (e.g., 0000269-150209145053100-oozie-oozi-W),
Click on the link _result,
To see intermediate results, click on node_splitter and then click on data.

In the * [Hands-On Exercise 8: browse published results](http://docs.terradue.com/developer-sandbox/developer/browseresults.html), you find how you can browse your results through the Oozie Web Console showing with images the steps that we have just perfermed.

The following link of image show The contents of directory _results, that we need to choose our dataset to be downloaded and used for the next Step of Spinua Chain.

* [The contents of directory _result](BrowseResults.png)

