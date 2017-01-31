#!/bin/bash

# The Java class invoked below outputs a summary of the catalog contetns to the console.
mvn -f /nlp-pipelines.git/nlp-pipelines-runner/pom.xml exec:java \
-Dexec.mainClass="edu.ucdenver.ccp.nlp.pipelines.runlog.Main_CatalogSummary_neo4j" \
-Dexec.args="/nlp_data/catalog"
