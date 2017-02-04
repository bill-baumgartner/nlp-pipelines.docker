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

RUN wget http://www.gtlib.gatech.edu/pub/apache//uima//uima-as-2.9.0/uima-as-2.9.0-bin.tar.gz && \
    wget http://www.apache.org/dist/uima//uima-as-2.9.0/uima-as-2.9.0-bin.tar.gz.md5 && \
    md5sum -c *.md5 && \
    tar -xzvf uima-as-2.9.0-bin.tar.gz

ENV UIMA_HOME /apache-uima-as-2.9.0

COPY scripts/ /scripts/

RUN chmod -R 755 /scripts && \
    mkdir /activemq-base

CMD cd /activemq-base && $UIMA_HOME/bin/startBroker.sh
