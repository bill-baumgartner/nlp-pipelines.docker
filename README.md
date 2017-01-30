# nlp-pipelines.docker
Configuration for a Docker image to run nlp-pipelines over corpora and catalog their output


# Initial Setup

All data pertaining to NLP-pipeline runs, including text corpus files and serialized annotator output, will be stored in a dedicated Docker volume that should be periodically backed up to ensure long-term data preservation. Create a Docker volume for this purpose with the following command:

```bash
docker create -v /nlp_data --name nlp_data ubuntu:latest
```

# Corpus Maintenance

#### PubMed Central Open Access (PMC_OA)

__Initial consumption__ of the PMC_OA corpus makes use of the bulk download files provided on the [PMC OA FTP server](ftp://ftp.ncbi.nlm.nih.gov/pub/pmc/). The following command will download the four bulk files containing articles in the PMC nxml format. The downloads will be unpacked, compressed, and added to the NLP-pipelines run catalog. Further, the native PMC XML will be converted to a plain text version of the file, which will also be compressed, stored, and cataloged.

NOTE about number of processors (should be an input parameter)

```bash
docker run --rm --volumes-from nlp_data billbaumgartner/nlp-pipelines:0.5.4 ./init-pmcoa-corpus.sh
```

__Incremental updates__ of the PMC_OA corpus can be performed on a periodic basis after the initial bulk load. Incremental updates are achieved via the [PMC-OAI Service](https://www.ncbi.nlm.nih.gov/pmc/tools/oai/). As documented on their website, high-volume requests (classified as >100 requests at a time) should be run outside of the PMC system's peak hours (Monday to Friday, 5:00 AM to 9:00 PM, U.S. Eastern time).

```bash
Incremental updates have not yet been implemented
```

# NLP Pipeline Execution

Once a text corpus has been cataloged, it can be processed by resident NLP-pipelines. Annotation output will be cached and also cataloged allowing incremental updates to each corpus can be processed as they are made available.

#### ConceptMapper pipelines
