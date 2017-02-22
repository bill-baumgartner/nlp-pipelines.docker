#!/bin/bash
# arguments are 1)dictionary directory, 2) clean dictionary files (YES/NO)
export MAVEN_OPTS="-Xmx10G"

CM_DICTIONARY_DIR=/nlp_data/pipeline_work/concept-mapper-dictionaries

mvn -f /nlp-pipelines.git/nlp-pipelines-runner/pom.xml exec:java \
    -Dexec.mainClass="edu.ucdenver.ccp.nlp.pipelines.runner.impl.UpdateConceptMapperDictionaryFiles" \
    -Dexec.args="$CM_DICTIONARY_DIR $1"


