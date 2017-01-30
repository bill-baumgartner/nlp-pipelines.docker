FROM azul/zulu-openjdk:8u92

RUN apt-get update && apt-get install -y \
    curl \
    maven \
    git \
    unzip \
    wget

RUN git clone --branch dev.uima_2.9.0 https://github.com/UCDenver-ccp/ccp-nlp.git ./ccp-nlp.git && \
    mvn clean install -f ./ccp-nlp.git/pom.xml

RUN git clone --branch dev.uima_as_runner https://github.com/UCDenver-ccp/ccp-nlp-pipelines.git ./nlp-pipelines.git && \
    mvn clean install -f ./nlp-pipelines.git/pom.xml

#ENV CATALOG_DIR=/nlp-pipelines_data/catalog LIBRARY_DIR=/nlp-pipelines_data/library

COPY scripts/ /scripts/

RUN chmod -R 755 /scripts
