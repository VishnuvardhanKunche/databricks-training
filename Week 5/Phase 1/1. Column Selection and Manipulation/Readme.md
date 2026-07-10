# Week 5 - Phase 1: Column Selection and Manipulation in PySpark

---

## What We Did Today

### Spark Session

- Created a SparkSession
- Loaded the products dataset from a CSV file
- Displayed the DataFrame for verification

### Column Selection

- Selected single and multiple columns
- Selected columns using the `col()` function
- Selected columns dynamically using a list
- Selected columns using SQL syntax

### Column Manipulation

- Added new columns with static values
- Created calculated columns using existing columns
- Added multiple derived columns
- Renamed columns using `alias()`
- Renamed columns using `withColumnRenamed()`
- Created columns using SQL expressions

### Column Management

- Selected all columns
- Removed unwanted columns using `drop()`
- Compared DataFrame API with SQL queries

---

## PySpark Functions Used

| Function | Description |
|----------|-------------|
| `SparkSession.builder` | Creates a Spark session |
| `appName()` | Sets the Spark application name |
| `getOrCreate()` | Creates or retrieves a Spark session |
| `spark.read.csv()` | Reads CSV files into a DataFrame |
| `display()` | Displays the DataFrame in Databricks |
| `select()` | Selects one or more columns |
| `col()` | References DataFrame columns |
| `withColumn()` | Creates or modifies columns |
| `lit()` | Creates a column with a constant value |
| `alias()` | Assigns a temporary column name |
| `withColumnRenamed()` | Renames existing columns |
| `expr()` | Evaluates SQL expressions |
| `drop()` | Removes one or more columns |
| `createOrReplaceTempView()` | Creates a temporary SQL view |
| `spark.sql()` | Executes SQL queries on DataFrames |
| `show()` | Displays DataFrame contents |

---

## Key Concepts Learned

| Concept | Purpose |
|---------|---------|
| Column Selection | Retrieve required columns from a DataFrame |
| Column References | Access columns using different PySpark approaches |
| Derived Columns | Create new columns from existing data |
| Constant Columns | Add fixed values to a DataFrame |
| Column Renaming | Improve readability of column names |
| SQL Expressions | Perform calculations using SQL syntax |
| Dynamic Selection | Select columns programmatically |
| Temporary Views | Query DataFrames using SQL |
| Column Exclusion | Remove unnecessary columns |

---

## Files in This Folder

| File | Description |
|------|-------------|
| `Query.sql` | SQL queries demonstrating column selection and manipulation |
| `PySpark.py` | PySpark implementation of column selection, creation, renaming, and management |
| `README.md` | Documentation for Week 5 Phase 1 |
| `Output screenshots/` | Output screenshots captured during execution |

---

## Note

The PySpark source file contains comments indicating the corresponding screenshot file names for each output. This makes it easy to match the generated output with the screenshots stored in the repository.
```
