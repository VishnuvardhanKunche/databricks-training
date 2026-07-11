from pyspark.sql import SparkSession

spark = SparkSession.builder \
    .appName("PySpark") \
    .getOrCreate()

#dataframes for phase 2

customers_data = [
(101,"Aarav","Hyderabad"),
(102,"Bhavya","Bangalore"),
(103,"Charan","Chennai"),
(104,"Divya","Mumbai"),
(105,"Esha","Pune"),
(106,"Farhan","Delhi"),
(107,"Gopal","Hyderabad"),
(108,"Harsha","Chennai"),
(109,"Ishita","Bangalore"),
(110,"John","Mumbai"),
(111,"Keerthi","Pune"),
(112,"Lokesh","Delhi"),
(113,"Meena","Hyderabad"),
(114,"Nikhil","Chennai"),
(115,"Pooja","Bangalore"),
(None,"Unknown","Hyderabad"),
(None,"Guest","Delhi")
]

customer_columns = [
    "customer_id",
    "customer_name",
    "city"
]

customers = spark.createDataFrame(customers_data, customer_columns)

customers.show() # Output 1

orders_data = [
(1001,101,"Laptop",52000),
(1002,101,"Mouse",1200),
(1003,102,"Mobile",28000),
(1004,103,"Headphones",2500),
(1005,103,"Keyboard",1800),
(1006,104,"Monitor",14000),
(1007,104,"Printer",11000),
(1008,105,"Chair",6000),
(1009,106,"Desk",8500),
(1010,106,"Laptop",51000),
(1011,107,"Mouse",1000),
(1012,107,"Keyboard",1700),
(1013,108,"Mobile",30000),
(1014,109,"Laptop",54000),
(1015,109,"Monitor",13500),
(1016,110,"Printer",12000),
(1017,110,"Chair",5500),
(1018,111,"Desk",9000),
(1019,111,"Mouse",1300),
(1020,112,"Laptop",50000),
(1021,112,"Keyboard",2000),
(1022,114,"Headphones",3000),
(1023,114,"Monitor",15000),
(1024,None,"Tablet",22000),
(1025,None,"Keyboard",1800)
]

order_columns = [
    "order_id",
    "customer_id",
    "product",
    "order_amount"
]

orders = spark.createDataFrame(orders_data, order_columns)

orders.show() # Output 2

#printing schema of dataframes

customers.printSchema() # Output 3

orders.printSchema() # Output 4

# Mini Cleaning Task

customers_df = customers.dropna(subset=["customer_id"])
customers_df.show() # Output 5

orders_df = orders.dropna(subset=["order_id"])
orders_df.show() # Output 6

# Exercises
from pyspark.sql import functions as F

# 1. Total order amount for each customer
customers_df.join(orders_df,on = "customer_id", how = "inner")\
            .groupBy("customer_id","customer_name")\
            .agg(F.sum("order_amount")).show() # Output 7


# 2. Top 3 customers by total spend
customers_df.alias("c").join(orders_df.alias("o"),on = "customer_id", how = "inner")\
            .groupBy("c.customer_id","c.customer_name")\
            .agg(F.sum("o.order_amount").alias("total_amount"))\
            .orderBy(F.col("total_amount").desc())\
            .limit(3).show() # Output 8

# 3. Customers with no orders
customers_df.alias("c").join(orders_df.alias("o"),on = "customer_id", how = "left")\
            .filter(F.col("o.customer_id").isNull())\
            .select("c.customer_id","c.customer_name").show() # Output 9

# 4. City-wise total revenue
customers_df.alias("c").join(orders_df.alias("o"), on = "customer_id", how = "inner")\
            .groupBy("c.city")\
            .agg(F.sum("o.order_amount")).show() # Output 10

# 5. Average order amount per customer
customers_df.alias("c").join(orders_df.alias("o"), on = "customer_id", how = "inner")\
            .groupBy("c.customer_id","c.customer_name")\
            .agg(F.avg("o.order_amount").alias("avg_amount")).show() # Output 11

# 6. Customers with more than one order
customers_df.alias("c").join(orders_df.alias("o"), on = "customer_id", how = "inner")\
            .groupBy("c.customer_id","c.customer_name")\
            .agg(F.count("o.order_id").alias("no_of_orders"))\
            .filter("no_of_orders > 1").show() # Output 12

# 7. Sort customers by total spend descending
customers_df.join(orders_df,on = "customer_id", how = "inner")\
            .groupBy("customer_id","customer_name")\
            .agg(F.sum("order_amount").alias("total_amount"))\
            .orderBy(F.col("total_amount").desc()).show() # Output 13