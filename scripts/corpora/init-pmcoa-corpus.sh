#!/bin/bash
#

# Download the bulk PMC OA files containing XML for individual PMC articles
./_download-pmcoa-bulk.sh

# Populate the catalog with the PMC OA articles
./_catalog-pmcoa-bulk.sh
