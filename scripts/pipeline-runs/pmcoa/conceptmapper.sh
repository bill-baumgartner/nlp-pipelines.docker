#!/bin/bash

# arguments are:
# 1) broker URL
# 2) num-to-process (<0 = process all)
# 3) cas pool size
# 4) concept mapper key (CHEBI, CL, DOID, GO_BP, GO_CC, GO_MF, NCBI_TAXON, PR, SO, UBERON)
#
EXPECTED_ARGS=4

if [ $# -ne $EXPECTED_ARGS ]
then
    echo "#NOTE: due to CD'ing in script use absolute file names!!"
    echo "Usage: BROKER_URL NUM_TO_PROCESS CAS_POOL_SIZE CONCEPT_MAPPER_KEY"
    echo "current usage:"
    echo $@
    exit 1
fi

export MAVEN_OPTS="-Xmx10G"

CATALOG_DIR=/nlp_data/catalog
PIPELINE_WORK_DIR=/nlp_data/pipeline_work/pmcoa/conceptmapper
BROKER_URL=$1
NUM_TO_PROCESS=$2
CAS_POOL_SIZE=$3
CM_KEY=$4
CM_DICTIONARY_DIR=/nlp_data/pipeline_work/concept-mapper-dictionaries


mvn -f /nlp-pipelines.git/nlp-pipelines-runner/pom.xml exec:java \
    -Dexec.mainClass="edu.ucdenver.ccp.nlp.pipelines.runner.impl.PmcConceptMapperPipeline" \
    -Dexec.args="$CATALOG_DIR $PIPELINE_WORK_DIR $BROKER_URL $NUM_TO_PROCESS $CAS_POOL_SIZE $CM_KEY $CM_DICTIONARY_DIR"


