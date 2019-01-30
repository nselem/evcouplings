FROM conda/miniconda3

RUN apt-get update && apt-get upgrade -y && \
apt-get install -y git wget gcc build-essential vim tcsh

## plmc  Tool for inferring undirected statistical models from sequence variation.
RUN git clone https://github.com/debbiemarkslab/plmc.git /opt/plmc && cd /opt/plmc && make all-openmp32

## hmmer 
RUN wget http://eddylab.org/software/hmmer/hmmer.tar.gz --directory-prefix=/opt/ && \
	tar zxf /opt/hmmer.tar.gz -C /opt && cd /opt/hmmer-3.2.1 && \
	./configure && make && make install 

# maxcluster (optional)
# evcouplings uses maxcluster to compare predicted 3D structure models to experimental protein structures
RUN wget http://www.sbg.bio.ic.ac.uk/~maxcluster/maxcluster64bit --directory-prefix=/opt/ && chmod +x /opt/maxcluster64bit

## hh suite Optional 
RUN wget https://github.com/soedinglab/hh-suite/releases/download/v3.0-beta.3/hhsuite-3.0-beta.3-Linux.tar.gz --directory-prefix=/opt/ && tar zxf /opt/hhsuite-3.0-beta.3-Linux.tar.gz -C /opt

## CNSsolve 1.21 (optional) evcouplings uses CNSsolve for computing 3D structure models from coupled residue pairs. 
ADD cns_solve_1.21_all_intel-mac_linux-mp.tar.gz /opt
## ADD installed CNSsolve at /opt/cns_solve_1.21/

### psi pred  evcouplings uses PSIPRED for secondary structure prediction
RUN wget http://bioinfadmin.cs.ucl.ac.uk/downloads/psipred/psipred.4.02.tar.gz --directory-prefix=/opt/ && \
	tar zxf /opt/psipred.4.02.tar.gz -C /opt && cd /opt/psipred && \
	cd src && make && make install 

RUN wget XXXXrunpsipred_single /opt/psipred/runpsipred_single

#RUN perl -p -i -e 's/\.bin/\/opt\/bin/'
VOLUME /opt
WORKDIR /opt
