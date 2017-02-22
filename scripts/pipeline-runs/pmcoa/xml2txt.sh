#!/bin/bash

# The Java class deploys and runs a pipeline that converts PMC nxml files to plain text
# The plain text is cached in a separate file, as well as an annotation file containing
# document section annotations. The run catalog is updated accordingly.
#
# arg1 = the broker URL
# arg2 = number of documents to process (<0 = process all)
# arg3 = CAS pool size
#
export MAVEN_OPTS="-Xmx10G -Duima.jmx.monitor.formatter=org.apache.uima.aae.jmx.monitor.BasicUimaJmxMonitorListener -Dcom.sun.management.jmxremote.port=8009 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false"

PIPELINE_WORK_DIR=/nlp_data/pipeline_work/pmcoa/xml2txt
mkdir -p "$PIPELINE_WORK_DIR"

mvn -f /nlp-pipelines.git/nlp-pipelines-runner/pom.xml exec:java \
-Dexec.mainClass="edu.ucdenver.ccp.nlp.pipelines.runner.impl.PmcNxml2TxtPipeline" \
-Dexec.args="/nlp_data/catalog $PIPELINE_WORK_DIR $1 $2 $3"
