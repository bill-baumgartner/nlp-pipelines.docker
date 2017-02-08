#!/bin/bash

EXPECTED_ARGS=2

if [ $# -ne $EXPECTED_ARGS ]
then
    echo "#NOTE: due to CD'ing in script use absolute file names!!"
    echo "Usage: BROKER_URL CONCEPT_MAPPER_KEY"
    echo "current usage:"
    echo $@
    exit 1
fi

export MAVEN_OPTS="-Xmx10G"

CATALOG_DIR=/nlp_data/catalog
PIPELINE_WORK_DIR=/nlp_data/pipeline_work/pmcoa/xml2txt
BROKER_URL=$1
CM_DICTIONARY_DIR=/nlp_data/pipeline_work/concept-mapper-dictionaries
CM_KEY=$2

mvn -f /nlp-pipelines.git/nlp-pipelines-runner/pom.xml exec:java \
    -Dexec.mainClass="edu.ucdenver.ccp.nlp.pipelines.runner.impl.PmcConceptMapperPipeline" \
    -Dexec.args="$CATALOG_DIR $PIPELINE_WORK_DIR $BROKER_URL CM_KEY $CM_DICTIONARY_DIR"

# arguments are 1)dictionary directory, 2) clean ontology files (YES/NO), 3) clean dictionary files (YES/NO)
