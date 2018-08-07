#! /usr/bin/env bash

INDOCKER_DIR_1="/renci/irods/gtex/Annotations"
INDOCKER_DIR="/home/dockeruser/venv"

export GTEX_DATA_PATH_1="${INDOCKER_DIR_1}/"
export GTEX_DATA_PATH_2="${INDOCKER_DIR}/gtex/"
export GTEX_NB_PATH="${INDOCKER_DIR}/notebooks/"

./helium run jupyter -venv -U mgarcia5@globusid.org -P TempPassword

docker exec -ti dc_jupyter mkdir "${INDOCKER_DIR}/notebooks"
docker exec -ti dc_jupyter mkdir "${INDOCKER_DIR}/gtex"
docker exec -ti dc_jupyter sudo /home/dockeruser/venv/bin/pip3 install --upgrade pip
docker exec -ti dc_jupyter sudo  /home/dockeruser/venv/bin/pip3 install scipy matplotlib
docker cp /home/data/GTEx/data/biomart_ENSG2NCBI.tsv dc_jupyter:"$INDOCKER_DIR/gtex"
docker cp /home/data/GTEx/data/GTEx_Analysis_2016-01-15_v7_RNASeQCv1.1.8_gene_tpm.gct.gz dc_jupyter:"$INDOCKER_DIR/gtex"
docker cp ~/jupyter-nb/gtex_rnaseq_prep.ipynb dc_jupyter:"$INDOCKER_DIR/notebooks"
