code = '''
from pyspark import SparkContext
from pyspark import SparkFiles
from pyspark.ml.linalg import Vectors
from pyspark.ml.stat import Correlation

path = SparkFiles.get("gtex_rnaseq_prep_profiles.tsv")

dataheaderindex = 2

with open(path) as inp:
    headers = inp.readline().strip().split(" ")
    # ids = []
    # features = []
    data = []
    for line in inp:
        row = line.strip().split(' ')
        print(row)
        if len(row) < dataheaderindex:
            continue
        # id = row[:dataheaderindex]
        feature = map(float, row[dataheaderindex:])
        data.append(feature)
    data2 = list(map(lambda x : [Vectors.dense(*x)], zip(*data))) 
    print(data2)

df = spark.createDataFrame(data2, ["features"])

df.show(3)

r1 = Correlation.corr(df, "features").head()
print("Pearson correlation matrix:\\n" + str(r1))

r2 = Correlation.corr(df, "features", "spearman").head()
print("Spearman correlation matrix:\\n" + str(r2))
'''
