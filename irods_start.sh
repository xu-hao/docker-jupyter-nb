#!/usr/bin/env bash

INDOCKER_DIR_1="/renci/irods/gtex/Annotations"
INDOCKER_DIR="/home/dockeruser/venv"

# The paths where the data files reside
export GTEX_DATA_PATH_1="${INDOCKER_DIR_1}/"
export GTEX_DATA_PATH_2="${INDOCKER_DIR}/gtex/"

if [ -z "$1" ]
then
    echo "Usage: ./irods_start.sh <password>"
    exit 9
else
    # The script to start the irods container
    ./helium run jupyter -venv -U mgarcia5@globusid.org -P $1
fi

# Add additional setup to Irods container in order to run UNM notebook
docker exec -ti dc_jupyter mkdir "${INDOCKER_DIR}/notebooks"
docker exec -ti dc_jupyter mkdir "${INDOCKER_DIR}/gtex"
docker exec -ti dc_jupyter sudo /home/dockeruser/venv/bin/pip3 install --upgrade pip
docker exec -ti dc_jupyter sudo  /home/dockeruser/venv/bin/pip3 install scipy matplotlib

# Copy into container missing GTEx content and notebook
docker cp /home/data/GTEx/data/biomart_ENSG2NCBI.tsv dc_jupyter:"$INDOCKER_DIR/gtex"
docker cp /home/data/GTEx/data/GTEx_Analysis_2016-01-15_v7_RNASeQCv1.1.8_gene_tpm.gct.gz dc_jupyter:"$INDOCKER_DIR/gtex"
docker cp gtex_rnaseq_prep.ipynb dc_jupyter:"$INDOCKER_DIR/notebooks"
