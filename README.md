# evcouplings
Implementing three Docker containers for [EVcouplings](https://github.com/debbiemarkslab/EVcouplings). Following @sacdallago suggestions:  


The EVcouplings image (containing the python evcouplings script). This container would work out of the box (aka: no first run magic) and expose the evcouplings script.  

The EVcouplings-dependencies image (containing all the built optional and required dependencies, like CNS,...). This container would also already have all the dependencies built and thus be ready.  

The EVcouplings-databases image 
