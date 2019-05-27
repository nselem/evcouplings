# evcouplings
This repository contains three Docker containers for [EVcouplings](https://github.com/debbiemarkslab/EVcouplings), following @sacdallago suggestions:  

## Suggestions  
1. The EVcouplings image (containing the python evcouplings script). This container would work out of the box (aka: no first run magic) and expose the evcouplings script.  

2.  The EVcouplings-databases image 

3. The EVcouplings-dependencies image (containing all the built optional and required dependencies, like CNS,...). This container would also already have all the dependencies built and thus be ready.  


## EVcouplings Docker containers implementation   

1. Evcouplings image is contained in nselem/evcouplings  
`docker pull nselem/evcouplings`  

2. Evcouplings databases image is contained in nselem/ev_data
`docker pull nselem/ev_data`  

3. Evcouplings dependencies image is contained in nselem/ev_dependencies
This image contains cns_solve software that is under license, you should not use it without cns permission. For this reason first you need to 
- Create a directory to build ev_depencies.  
 `mkdir ev_dependencies`  
 `cd ev_dependencies`  
 
- [Download your own copy of cns_solve](http://cns-online.org/cns_request/). The version you need it is cns_solve_1.21_all_intel-mac_linux-mp.tar.gz  

-  Download ev_dependencies Dockerfile  
 `wget  https://raw.githubusercontent.com/nselem/evcouplings/master/ev_dependencies/Dockerfile`     
 
- Build ev_dependencies in your local machine.   
`docker build -t ev_dependencies .`  


## Runing EVcouplings docker images  
0. Create a working directory, in this example I called my working directory Couplings.  
`mkdir Couplings`   
`cd Couplings`  
`mkdir Sequences`  
`mkdir databases`

1. First create a volume with all the dependencies using docker image nselem/ev_dependencies:    
`$ docker run -v /opt --name ev_dependencies ev_dependencies  `   

2. Then expose this volume to the docker image nselem/evcouplings:    
`$ docker run -it --rm --volumes-from ev_dependencies -v nselem/evcouplings /bin/bash  `   

3. To finally run evcoupling dockers, you need a confid file and the databases setup. Right now Im passing databases as volume from my local computer product of the first run of docker images, but I think nselem/ev_data would work.  

Run evcouplings docker image
`$ docker run -it --rm --volumes-from ev_dependencies -v $(pwd)/Sequences:/home -v $(pwd)/databases:/groups/marks/databases:ro nselem/evcouplings /bin/bash  `   
and then run evcouplings plataform inside the docker container typing the command `evcouplings_runcfg`  followed by the name of your configuration file. For example if your configuration file is HisA_config_monomer.txt then run:  
`# evcouplings_runcfg HisA_config_monomer.txt`  

-Configuration file  
`Sequences`  must contain a `configuration file` according to the evcoupling [config files tutorial](https://github.com/debbiemarkslab/EVcouplings/blob/develop/notebooks/running_jobs.ipynb)    
Configuration file example.  (pending)  

-Databases  
The directory `/groups/marks/databases` contains all databases downloaded inside the docker container. By now I downloaded them by runing:   
`# evcouplings_dbupdate `  
the first time I opened evcouplings container. After downloading store databases in your `databases` directory.   

4. To do in the future  
I whish to use databases container. Maybe like this: create a volume with databases using docker image nselem/ev_databases:    
`docker run -v /data --name ev_databases nselem/ev_data  `  


And finally my desire is to get to this:  
`docker run -it --rm --volumes-from ev_dependencies ev_databases -v $(pwd)/Sequences:/home nselem/evcouplings evcouplings_runcfg HisA_config_monomer.txt`  
