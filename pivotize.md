### pivot

```
curl -X POST -d "@spark.json" <pivot>/appliance
```

```
curl -X GET <pivot>/appliance/spark-livy
```

```
curl -X DELETE <pivot>/appliance/spark-livy
```
### preprocessing

upload files:

`gtex_rnaseq_prep.ipynb`

`GTEx_v7_Annotations_SubjectPhenotypesDS.txt`

`GTEx_v7_Annotations_SampleAttributesDS.txt`

`GTEx_Analysis_2016-01-15_v7_RNASeQCv1.1.8_gene_tpm.gct.gz`

`biomart_ENSG2NCBI.tsv`

### similarity

upload files:

`livy.py`

`exfiles_similarity.py.ipynb`

`gtex_rnaseq_prep_profiles.tsv`

To run `exfiles_similarity.py.ipynb`, copy pivot addr into notebook

