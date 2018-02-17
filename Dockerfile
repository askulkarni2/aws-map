FROM perl:5.26

RUN apt-get update -y && \
      apt-get install -y git graphviz graphviz-dev libxml2-dev libssl-dev && \
      cpanm Carton
RUN git clone https://github.com/askulkarni2/aws-map.git
WORKDIR aws-map
RUN carton install

ENTRYPOINT ["carton", "exec" , "perl", "-I", "lib", "bin/map_network_sgs"]
