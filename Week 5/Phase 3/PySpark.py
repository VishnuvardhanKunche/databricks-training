from pyspark.sql import SparkSession
from pyspark.sql import functions as F
from pyspark.sql.window import Window

spark = SparkSession.builder \
    .appName("Phase 3") \
    .getOrCreate()

customers_data = [
(101,"Aarav","Hyderabad",25),
(102,"Bhavya","Bangalore",28),
(103,"Charan","Chennai",24),
(104,"Divya","Mumbai",31),
(105,"Esha","Pune",27),
(106,"Farhan","Delhi",30),
(107,"Gopal","Hyderabad",29),
(108,"Harsha","Chennai",26),
(109,"Ishita","Bangalore",32),
(110,"John","Mumbai",35),
(111,"Keerthi","Pune",23),
(112,"Lokesh","Delhi",34),
(113,"Meena","Hyderabad",27),
(114,"Nikhil","Chennai",-2),
(115,"Pooja",None,29),
(None,"Unknown","Hyderabad",24),
(105,"Esha","Pune",27)
]

customer_columns = [
"customer_id",
"customer_name",
"city",
"age"
]

customers = spark.createDataFrame(customers_data,customer_columns)

customers.show()          # Output 1
customers.printSchema()   # Output 2

sales_data = [
(1002,101,"2025-01-01","Mouse",1200),
(1003,102,"2025-01-02","Mobile",28000),
(1004,103,"2025-01-02","Keyboard",1800),
(1005,103,"2025-01-03","Headphones",2500),
(1006,104,"2025-01-03","Monitor",14000),
(1007,104,"2025-01-04","Printer",11000),
(1008,105,"2025-01-04","Chair",6000),
(1009,106,"2025-01-05","Desk",8500),
(1010,106,"2025-01-05","Laptop",51000),
(1011,107,"2025-01-06","Mouse",1000),
(1012,107,"2025-01-06","Keyboard",1700),
(1013,108,"2025-01-07","Mobile",30000),
(1014,109,"2025-01-07","Laptop",54000),
(1015,109,"2025-01-08","Monitor",13500),
(1016,110,"2025-01-08","Printer",12000),
(1017,111,"2025-01-09","Desk",9000),
(1018,112,"2025-01-09","Laptop",50000),
(1019,113,"2025-01-10","Mouse",1300),
(1020,113,"2025-01-10","Keyboard",2000),
(1021,None,"2025-01-11","Tablet",22000),
(1022,114,"2025-01-11","Monitor",-15000),
(1023,115,"2025-01-12","Chair",None),
(1001,101,"2025-01-01","Laptop",52000)
]

sales_columns = [
"order_id",
"customer_id",
"order_date",
"product",
"amount"
]

sales = spark.createDataFrame(sales_data,sales_columns)

sales.show()          # Output 3
sales.printSchema()   # Output 4

# Data Cleaning

customers_df = customers.dropna(subset=["customer_id"])

customers_df = customers_df.fillna({"city":"Unknown"})

customers_df = customers_df.filter(F.col("age")>0)

customers_df.show()       # Output 5


sales_df = sales.dropDuplicates()

sales_df = sales_df.dropna(subset=["customer_id","amount"])

sales_df = sales_df.filter(F.col("amount")>0)

sales_df.show()          # Output 6


# 1. Calculate daily sales

sales_df.groupBy("order_date") \
        .agg(F.sum("amount").alias("daily_sales"))\
        .orderBy("order_date").show() # Output 7


# 2. City Wise Revenue

customers_df.join(sales_df,"customer_id").groupBy("city") \
            .agg(F.sum("amount").alias("city_revenue"))\
            .orderBy(F.col("city_revenue").desc()).show() # Output 8


# 3. Find repeat customers (>2 orders)

sales_df.groupBy("customer_id")\
        .agg(F.count("order_id").alias("order_count"))\
        .filter(F.col("order_count")>2).show() # Output 9


# 4. Find highest spending customer in each city

customer_spend = customers_df.join(sales_df,"customer_id")\
                              .groupBy("customer_id","customer_name","city")\
                              .agg(F.sum("amount").alias("total_spend"))

window = Window.partitionBy("city")\
                .orderBy(F.col("total_spend").desc())

customer_spend.withColumn("rank", F.row_number().over(window))\
              .filter(F.col("rank")==1).show() # Output 10


# 5. Final reporting table with customer, city, total spend, order count

customers_df.join(sales_df,"customer_id")\
            .groupBy("customer_id","customer_name","city")\
            .agg(F.sum("amount").alias("total_spend"),
                 F.count("order_id").alias("order_count"))\
            .orderBy(F.col("total_spend").desc()).show() # Output 11

