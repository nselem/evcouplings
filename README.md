# evcouplings
Implementing three Docker containers for [EVcouplings](https://github.com/debbiemarkslab/EVcouplings). Following @sacdallago suggestions:  

## Suggestions  
1. The EVcouplings image (containing the python evcouplings script). This container would work out of the box (aka: no first run magic) and expose the evcouplings script.  

2. The EVcouplings-dependencies image (containing all the built optional and required dependencies, like CNS,...). This container would also already have all the dependencies built and thus be ready.  

3.  The EVcouplings-databases image 

## EVcouplings Docker containers  

1. Evcouplings image is contained in nselem/evcouplings  
`docker pull nselem/evcouplings`  
2. Evcouplings dependencies image is contained in nselem/ev_dependencies
`docker pull nselem/ev_dependencies`
This image contains cns_solve software that is under license, you should not use it without cns permission. 
You should get your own copy of cns_solve software and then build eev_dependencies in your local machine.   

3. Evcouplings image is contained in nselem/evcouplings  
`docker pull nselem/ev_databases`  


Docker images  
First create a volume with all the dependencies using docker image nselem/ev_dependencies:    
`docker run -v /opt --name ev_dependencies nselem/ev_dependencies  `   

Then I expose this volume to the docker image nselem/evcouplings:    
`docker run -it --rm --volumes-from ev_dependencies -v nselem/evcouplings /bin/bash  `   

Right now Im passing databases as volume from my local computer:      
`docker run -it --rm --volumes-from ev_dependencies -v $(pwd)/Sequences:/home -v $(pwd)/databases:/groups/marks/databases:ro nselem/evcouplings /bin/bash  `   

But I whish to use databases container. Maybe like this: create a volume with databases using docker image nselem/ev_databases:    
`docker run -v /groups/marks/databases --name ev_databases nselem/ev_databases  `  


And finally my desire is to get to this:  
`docker run -it --rm --volumes-from ev_dependencies ev_databases -v $(pwd)/Sequences:/home nselem/evcouplings evcouplings_runcfg HisA_config_monomer.txt`  
