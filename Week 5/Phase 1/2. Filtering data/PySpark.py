from pyspark.sql import SparkSession

spark = SparkSession.builder\
        .appName("Phase 1")\
        .getOrCreate()

# dataframe

df = spark.read.csv("/samples/products.csv", header="true", inferSchema="true")

# Filtering Data

# 1. Basic Filtering: Using filter() and where() Methods

df.filter(df.price >400).show() # Output 1

df.where(df.price > 400).show() # Output 1

# 2. Combining Conditions with Logical Operators

# AND Condition (&):
df.filter((df["price"] > 200) & (df["stock_quantity"]>20)).show() # Output 2

# OR Condition (|):
df.filter((df["category"] == "Electronics") | (df["price"]<300)).show() # Output 3

# NOT Condition (~):
df.filter(~(df["category"] == "Electronics")).show() # Output 4

# 3. Filtering with String Conditions
df.filter("price > 100 and category = 'Electronics'").show() # Output 5

# 4. Filtering with the isin() Method
df.filter(df["category"].isin("Electronics","Sports")).show() # Output 6

# 5. Filtering with startswith()
df.filter(df["category"].startswith("A")).show() # Output 7

# 6. Filtering with endswith()
df.filter(df.product_name.endswith("er")).show() # Output 8

# 7. Filtering with like() and rlike() for Pattern Matching
df.filter(df.product_name.like("%e%")).show() # Output 9

df.filter(col("product_name").rlike("wall")).show() # Output 10

# 8. Null Handling: isNull() and isNotNull()
df.filter(col("price").isNull()).show() # Output 11

df.filter(col("price").isNotNull()).show() # Output 12

# 9. Filtering with SQL Queries (Using sql() Method)
df.createOrReplaceTempView("products")

spark.sql("SELECT * FROM products WHERE stock_quantity > 50").show() # Output 13