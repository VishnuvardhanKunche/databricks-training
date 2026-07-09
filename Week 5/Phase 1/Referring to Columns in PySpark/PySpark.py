from pyspark.sql import SparkSession

spark = SparkSession.builder\
          .appName("Spark Phase 1")\
          .getOrCreate()

#Refering to columns

df = spark.read.csv("/samples/sales.csv",header = True,inferSchema = True)

#Using column name as Strings
df.select("product_id","quantity").show() #Output 1
df.filter("quantity > 2").show()  #Output 2

#Using DataFrame Column Notation
df.select(df.product_id,df.quantity).show() #Output 1
df.filter(df.quantity > 2).show()  #Output 2

#Using col() function
from pyspark.sql.functions import *

df.select(col("product_id"),col("quantity")).show() #Output 1
df.filter(col("quantity")>2).show()  #Output 2

#Using Bracket Notation
df.select(df["product_id"],df["quantity"]).show() #Output 1
df.filter(df["quantity"] > 2).show()  #Output 2
