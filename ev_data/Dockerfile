FROM python:slim

# Install the pipeline
RUN apt-get update && apt-get install gcc -y && apt-get install tk --no-install-recommends -y
RUN pip install evcouplings

# Create the data dir and use it as working dir
RUN mkdir /data
WORKDIR /data

# Expose the data dir as volume
VOLUME /data

CMD ["evcouplings_dbupdate"]
