FROM conda/miniconda3

RUN apt-get update && apt-get upgrade -y && \
apt-get install -y gcc build-essential vim

RUN conda install -y \
 	numpy \  
	scipy \ 
	scikit-learn 

## EV couplings
RUN pip install evcouplings  
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

WORKDIR /home
#CMD ["/bin/bash"]
