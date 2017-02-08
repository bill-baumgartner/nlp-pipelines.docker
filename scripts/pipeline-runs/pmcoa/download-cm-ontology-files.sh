#!/bin/bash

CM_DICTIONARY_DIR=/nlp_data/pipeline_work/concept-mapper-dictionaries
ONT_DIR="$CM_DICTIONARY_DIR/ontologies"
LOG_FILE="$ONT_DIR/download.log"

chmod 755 /nlp-pipelines.git/scripts/runner/pipelines/concept-mapper/download-ontologies.sh
/nlp-pipelines.git/scripts/runner/pipelines/concept-mapper/download-ontologies.sh "$LOG_FILE" "$ONT_DIR"
