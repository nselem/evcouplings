# evcouplings
Implementing three Docker containers for [EVcouplings](https://github.com/debbiemarkslab/EVcouplings). Following @sacdallago suggestions:  


The EVcouplings image (containing the python evcouplings script). This container would work out of the box (aka: no first run magic) and expose the evcouplings script.  

The EVcouplings-dependencies image (containing all the built optional and required dependencies, like CNS,...). This container would also already have all the dependencies built and thus be ready.  

The EVcouplings-databases image 

Docker images  
First I create a volume with all the dependencies using docker image nselem/ev_dependencies:    
`docker run -v /opt --name ev_dependencies nselem/ev_dependencies  `   

Then I expose this volume to the docker image nselem/evcouplings:    
`docker run -it --rm --volumes-from ev_dependencies -v nselem/evcouplings /bin/bash  `   

Right now Im passing databases as volume from my local computer:      
`docker run -it --rm --volumes-from ev_dependencies -v $(pwd)/Sequences:/home -v $(pwd)/databases:/groups/marks/databases:ro nselem/evcouplings /bin/bash  `   

But I whish to use databases container.  

And finally my desire is to get to this:  
`docker run -it --rm --volumes-from ev_dependencies -v $(pwd)/Sequences:/home -v $(pwd)/databases:/groups/marks/databases:ro nselem/evcouplings evcouplings_runcfg HisA_config_monomer.txt`  
