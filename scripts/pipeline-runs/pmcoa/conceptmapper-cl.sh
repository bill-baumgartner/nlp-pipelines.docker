#!/bin/bash

EXPECTED_ARGS=1

if [ $# -ne $EXPECTED_ARGS ]
then
    echo "Usage: BROKER_URL"
    echo "current usage:"
    echo $@
    exit 1
fi

BROKER_URL=$1
CM_KEY=CL

/scripts/pipeline-runs/pmcoa/conceptmapper.sh $1 "$CM_KEY"
