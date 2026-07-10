# Week 5 - Phase 1: Filtering Data in PySpark

---

## What We Did Today

### Spark Session

- Created a SparkSession
- Loaded the products dataset from a CSV file
- Displayed the DataFrame for verification

### Data Filtering

- Filtered records using `filter()` and `where()`
- Applied logical operators (`AND`, `OR`, `NOT`)
- Filtered data using string conditions
- Filtered records using the `isin()` method
- Filtered data using string pattern matching functions
- Handled null and non-null values
- Executed filtering operations using SQL queries

### SQL and PySpark Comparison

- Wrote SQL queries for filtering data
- Implemented the same operations using PySpark DataFrame APIs
- Compared SQL syntax with equivalent PySpark syntax

---

## PySpark Functions Used

| Function | Description |
|----------|-------------|
| `SparkSession.builder` | Creates a Spark session |
| `appName()` | Sets the Spark application name |
| `getOrCreate()` | Creates or retrieves a Spark session |
| `spark.read.csv()` | Reads CSV files into a DataFrame |
| `display()` | Displays the DataFrame in Databricks |
| `filter()` | Filters rows based on conditions |
| `where()` | Alternative method for filtering rows |
| `col()` | References DataFrame columns |
| `isin()` | Filters rows matching multiple values |
| `startswith()` | Filters strings starting with a pattern |
| `endswith()` | Filters strings ending with a pattern |
| `like()` | Filters using SQL LIKE patterns |
| `rlike()` | Filters using regular expressions |
| `isNull()` | Identifies null values |
| `isNotNull()` | Identifies non-null values |
| `createOrReplaceTempView()` | Creates a temporary SQL view |
| `spark.sql()` | Executes SQL queries on DataFrames |
| `show()` | Displays DataFrame contents |

---

## Key Concepts Learned

| Concept | Purpose |
|---------|---------|
| Data Filtering | Retrieve records matching specific conditions |
| Logical Operators | Combine multiple filtering conditions |
| Pattern Matching | Search text using prefixes, suffixes and patterns |
| Membership Filtering | Filter records using a list of values |
| Null Handling | Identify missing and available data |
| SQL to PySpark | Convert SQL filtering queries into PySpark |
| Temporary Views | Execute SQL queries on DataFrames |

---

## Files in This Folder

| File | Description |
|------|-------------|
| `Query.sql` | SQL queries demonstrating various filtering operations |
| `PySpark.py` | PySpark implementation of filtering techniques using DataFrame APIs |
| `README.md` | Documentation for Week 5 Phase 1 |
| `Output screenshots/` | Output screenshots captured during execution |

---

## Note

The PySpark source file contains comments indicating the corresponding screenshot file names for each output. This makes it easy to match the generated output with the screenshots stored in the repository.