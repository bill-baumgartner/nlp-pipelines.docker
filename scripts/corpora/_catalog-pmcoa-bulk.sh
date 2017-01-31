#!/bin/bash


mkdir -p /nlp_data/library/pmcoa
mkdir -p /nlp_data/catalog

# The Java class invoked below records an entry for each document into
# the catalog and copies the individual document files from the
# pmc_bulk/ directory (which is organized by journal) to the
# library/pmcoa directory using the 2-level randomized folder
# structure used by PMC (extracted from the oa_file_list.txt file).
mvn -f /nlp-pipelines.git/nlp-pipelines-runner/pom.xml exec:java \
-Dexec.mainClass="edu.ucdenver.ccp.nlp.pipelines.runlog.init.Main_LoadCatalog_PMC_OA_neo4j" \
-Dexec.args="/nlp_data/library/pmcoa /nlp_data/catalog /nlp_data/pmc_bulk"
