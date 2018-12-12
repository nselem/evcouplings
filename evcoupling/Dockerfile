FROM conda/miniconda3

RUN apt-get update && apt-get upgrade -y && \
apt-get install -y gcc build-essential 

RUN conda install -y \
 	numpy \  
	scipy \ 
	scikit-learn 

## EV couplings
RUN pip install evcouplings  

WORKDIR /home
