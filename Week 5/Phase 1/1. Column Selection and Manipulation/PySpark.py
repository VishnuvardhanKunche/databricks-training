from pyspark.sql import SparkSession

spark = SparkSession.builder\
          .appName("Spark Phase 1")\
          .getOrCreate()

df = spark.read.csv('/samples/products.csv',header = True,inferSchema = True)

# Selecting Columns in PySpark

# 1. Basic Column Selection

  # Selecting a single column
df.select("product_name").show() #Output 1

  # Selecting multiple columns
df.select("product_id","product_name","price").show() #Output 2

# 2. Selecting columns using col()

from pyspark.sql.functions import col

df.select(col("product_id"), col("product_name"), col("price")).show() #Output 3

#3. Adding Columns with withColumn()

  # Adding a new column with a static value

from pyspark.sql.functions import lit

df.withColumn("discount",lit(0)).show() #Output 4

  # Adding a new column based on an existing one

df.withColumn("discount",col("price")*0.1).show() #Output 5

  # Adding multiple new columns
df.withColumn("discount",col("price")*0.5)\
  .withColumn("New price",col("price")-col("discount")).show() #Output 6

#4. Renaming Columns with alias()

df.select(col("product_id").alias("id"),col("product_name").alias("product")).show() #Output 7

#5. Renaming Columns with withColumnRenamed()

# Renaming a single column
df.withColumnRenamed("product_id", "id").show() #Output 8

# Renaming multiple columns (chained)
df.withColumnRenamed("product_id", "id") \
  .withColumnRenamed("product_name", "product").show() #Output 9

#6. Selecting with Expressions

from pyspark.sql.functions import expr
df.select("product_name",expr("stock_quantity + 10 as New_stock_quantity")).show() #Output 10

#7. Selecting All Columns and Dropping Unwanted Ones

df.select("*").drop("price").show() #Output 11

#8. Using SQL Syntax

# Registering the DataFrame as a temporary view
df.createOrReplaceTempView("sales")

# Using SQL to select columns
spark.sql("SELECT product_name, category FROM sales").show() #Output 12

#9. Selecting Columns Dynamically

# List of columns to select
columns_to_select = ["product_name", "category"]

# Dynamically selecting columns
df.select(*columns_to_select).show() #Output 12

#10. Using drop() to Exclude Columns

# Keeping all columns except 'price' and 'stock_quantity'
df.drop("price", "stock_quantity").show() #Output 13
