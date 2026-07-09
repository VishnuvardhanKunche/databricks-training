from pyspark.sql import SparkSession

spark = SparkSession.builder\
          .appName("Spark Phase 1")\
          .getOrCreate()

print("Spark session started")

#reading files
#csv:
df_csv_1 = spark.read.format("csv")\
          .option("header",True)\
          .option("inferSchema",True)\
          .load("/samples/customers.csv")

df_csv_2 = spark.read.csv("/samples/customers.csv",header=True,inferSchema=True)

df_csv_1.show() #Output 1
df_csv_2.show() #Output 2

#json:
df_json_1 = spark.read.format("json")\
            .option("multiLine",True)\
            .load("/samples/products.json")

df_json_2 = spark.read.json("/samples/products.json",multiLine = True)

df_json_1.show() #Output 3
df_json_2.show() #Output 4

#parquet:
df_parquet_1 = spark.read.format("parquet")\
                .load("/samples/titanic.parquet")

df_parquet_2 = spark.read.parquet("/samples/titanic.parquet")

df_parquet_1.show() #Output 5
df_parquet_2.show() #Output 6

