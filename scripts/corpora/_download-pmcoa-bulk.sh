#!/bin/bash

# Download the four PMC OA bulk files. At the completion of this
# script, the contents of the four downloaded tarballs can be found as
# compressed (.gz) files in subdirectories under
# $LIBRARY_DIR/pmc_bulk.
WORK_DIR=/nlp-pipelines_data/pmc_bulk

# wget the bulk PMC OA files using an automated retry-on-failure flag
for segment in "A-B" "C-H" "I-N" "O-Z"; do
    echo "Processing PMC OA bulk segment: $segment ..." && \
	mkdir -p "$WORK_DIR/$segment" && \
	cd "$WORK_DIR/$segment" && \
	wget -c -t 0 --timeout 60 --waitretry 10 "ftp://ftp.ncbi.nlm.nih.gov/pub/pmc/articles.$segment.xml.tar.gz" && \
	tar -xzf "articles.$segment.xml.tar.gz" && \
	cd - && \
	gzip -vr "$WORK_DIR/$segment"
done

