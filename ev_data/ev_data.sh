#!/bin/bash
 
#SBATCH -p keri 
#SBATCH -n 16
#SBATCH --mem=100000


docker run -v $(pwd):/data ev_data
 
