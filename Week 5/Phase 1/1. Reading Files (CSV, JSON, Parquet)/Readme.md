# Week 5 - Phase 1: Reading Data files
---

## What We Did Today

### Spark Session

- Created a SparkSession
- Configured the application name
- Verified that the Spark session started successfully

### Reading CSV Files

- Read CSV files using `format("csv")`
- Read CSV files using `spark.read.csv()`
- Enabled header and schema inference
- Compared outputs from both approaches

### Reading JSON Files

- Read JSON files using `format("json")`
- Read JSON files using `spark.read.json()`
- Used the `multiLine` option for formatted JSON files
- Verified that both methods produced the same output

### Reading Parquet Files

- Read Parquet files using `format("parquet")`
- Read Parquet files using `spark.read.parquet()`
- Compared outputs from both methods

---

## PySpark Functions Used

| Function | Description |
|----------|-------------|
| `SparkSession.builder` | Creates a Spark session |
| `appName()` | Sets the Spark application name |
| `getOrCreate()` | Creates or retrieves an existing Spark session |
| `spark.read.format()` | Reads data using a specified file format |
| `load()` | Loads data from a given path |
| `spark.read.csv()` | Reads CSV files directly |
| `spark.read.json()` | Reads JSON files directly |
| `spark.read.parquet()` | Reads Parquet files directly |
| `option()` | Specifies reader options |
| `show()` | Displays DataFrame contents |

---

## Key Concepts Learned

| Concept | Purpose |
|---------|---------|
| Spark Session | Entry point for working with PySpark |
| CSV Reader | Reads structured CSV data |
| JSON Reader | Reads JSON datasets |
| Parquet Reader | Reads optimized columnar storage files |
| Header Option | Uses the first row as column names |
| Schema Inference | Automatically detects column datatypes |
| MultiLine JSON | Reads formatted JSON documents |
| Data Preview | Displays DataFrame contents for verification |

---

## Files in This Folder

| File | Description |
|------|-------------|
| `PySparks.py` | PySpark program demonstrating reading CSV, JSON, and Parquet files |
| `README.md` | Documentation for Week 5 Phase 1 |
| `Output screenshots/` | Output screenshots captured during execution |

---

## Note

The PySpark source file contains comments indicating the corresponding screenshot file names for each output. This makes it easy to match the generated output with the screenshots stored in the repository.
