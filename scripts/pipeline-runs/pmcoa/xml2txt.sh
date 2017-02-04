#!/bin/bash

# The Java class deploys and runs a pipeline that converts PMC nxml files to plain text
# The plain text is cached in a separate file, as well as an annotation file containing
# document section annotations. The run catalog is updated accordingly.
export MAVEN_OPTS="-Xmx10G"

PIPELINE_WORK_DIR=/nlp_data/pipeline_work/pmcoa/xml2txt
mkdir -p "$PIPELINE_WORK_DIR"

mvn -f /nlp-pipelines.git/nlp-pipelines-runner/pom.xml exec:java \
-Dexec.mainClass="edu.ucdenver.ccp.nlp.pipelines.runner.impl.PmcNxml2TxtPipeline" \
-Dexec.args="/nlp_data/catalog $PIPELINE_WORK_DIR"
