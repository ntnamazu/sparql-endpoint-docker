FROM stain/jena-fuseki:4.0.0
WORKDIR /jena-fuseki
COPY /script/load.sh .