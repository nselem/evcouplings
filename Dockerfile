FROM conda/miniconda3

RUN apt-get update && apt-get upgrade -y && \
apt-get install -y git wget gcc build-essential vim tcsh

RUN conda install -y \
 	numpy \  
	scipy \ 
	scikit-learn 

## EV couplings
RUN pip install evcouplings  

## plmc  Tool for inferring undirected statistical models from sequence variation.
RUN git clone https://github.com/debbiemarkslab/plmc.git /opt/plmc && cd /opt/plmc && make all-openmp32

## hmmer 
RUN wget http://eddylab.org/software/hmmer/hmmer.tar.gz --directory-prefix=/opt/ && \
	tar zxf /opt/hmmer.tar.gz && cd hmmer-3.2.1 && \
	./configure && make && make install 

### psi pred  evcouplings uses PSIPRED for secondary structure prediction
RUN wget http://bioinfadmin.cs.ucl.ac.uk/downloads/psipred/psipred.4.02.tar.gz --directory-prefix=/opt/ && \
	tar zxf /opt/psipred.4.02.tar.gz && cd psipred && \
	cd src && make && make install 


## CNSsolve 1.21 (optional) evcouplings uses CNSsolve for computing 3D structure models from coupled residue pairs. 
ADD cns_solve_1.21_all-mp.tar.gz /opt
## It is installed at /opt/cns_solve_1.21/

# maxcluster (optional)
# evcouplings uses maxcluster to compare predicted 3D structure models to experimental protein structures
RUN wget http://www.sbg.bio.ic.ac.uk/~maxcluster/maxcluster64bit --directory-prefix=/opt/ && chmod +x /opt/maxcluster64bit

## hh suite Optional I will try later 
RUN wget https://github.com/soedinglab/hh-suite/releases/download/v3.0-beta.3/hhsuite-3.0-beta.3-Linux.tar.gz --directory-prefix=/opt/ && tar zxf /opt/hhsuite-3.0-beta.3-Linux.tar.gz

# Databases 
#COPY databases/idmapping_uniprot_embl_2017_02.txt.tar.gz databases/cds_pro_2017_02.txt.tar.gz /opt/ 
#RUN tar xvzf /opt/idmapping_uniprot_embl_2017_02.txt.tar.gz
RUN mkdir /groups/marks/databases/
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

#RUN pip install --upgrade setuptools
RUN mv psipred /opt/psipred && mv hmmer-3.2.1 /opt/hmmer-3.2.1 && \
    mv hhsuite-3.0-beta.3-Linux /opt/hhsuite-3.0-beta.3-Linux  
#    mv idmapping_uniprot_embl_2017_02.txt /opt/idmapping_uniprot_embl_2017_02.txt
WORKDIR /home
