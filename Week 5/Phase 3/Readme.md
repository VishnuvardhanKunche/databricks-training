# Week 5 - Phase 3: SQL to PySpark ETL Pipeline

---

## Overview

Phase 3 focused on implementing a complete ETL (Extract, Transform, Load) pipeline using SQL and PySpark. The project covered data ingestion, data cleaning, transformations, business analytics, and report generation using Customer and Sales datasets.

Each task was first implemented in SQL and then recreated in PySpark to understand how traditional SQL workflows translate into scalable data engineering pipelines.

---

## What We Did Today

### Data Ingestion

- Created Customer and Sales DataFrames
- Loaded sample datasets into PySpark
- Displayed records and verified DataFrame schemas

### Data Cleaning

- Removed records with missing `customer_id`
- Removed duplicate records
- Filtered invalid sales records
- Filled missing city values where required
- Prepared clean datasets for analysis

### Data Transformation

- Joined Customer and Sales DataFrames
- Calculated daily sales revenue
- Generated city-wise revenue reports
- Identified repeat customers
- Found the highest spending customer in each city
- Created a final customer reporting table containing total spend and order count

### Data Reporting

- Generated business summary reports
- Displayed final reporting DataFrame
- Verified transformed data before loading

---

## PySpark Functions Used

| Function | Description |
|----------|-------------|
| `dropna()` | Removes rows containing null values |
| `dropDuplicates()` | Removes duplicate records |
| `fillna()` | Replaces missing values |
| `filter()` | Filters invalid records |
| `join()` | Combines multiple DataFrames |
| `groupBy()` | Groups records for aggregation |
| `agg()` | Performs aggregation operations |
| `sum()` | Calculates total values |
| `count()` | Counts records |
| `avg()` | Calculates average values |
| `Window.partitionBy()` | Creates window partitions |
| `row_number()` | Ranks records within each partition |
| `orderBy()` | Sorts DataFrame records |

---

## Key Concepts Learned

| Concept | Purpose |
|---------|---------|
| ETL Pipeline | Process data through Extract, Transform, and Load stages |
| Data Cleaning | Remove null, duplicate, and invalid records |
| Data Validation | Verify data quality before processing |
| Data Joining | Combine related datasets |
| Business Aggregation | Generate customer and sales summaries |
| Window Functions | Rank records within groups |
| Revenue Analysis | Calculate daily and city-wise sales |
| SQL to PySpark Mapping | Convert SQL queries into PySpark transformations |

---

## Files in This Folder

| File | Description |
|------|-------------|
| `Query.sql` | SQL solutions for all Phase 3 ETL exercises |
| `PySpark.py` | PySpark implementation of the complete ETL pipeline |
| `Readme.md` | Documentation for Week 5 Phase 3 |
| `Output Screenshots/` | Screenshots of outputs captured during execution |

---

## Note

The PySpark and SQL files contain comments indicating the corresponding screenshot file names for each output. This makes it easy to match the generated output with the screenshots stored in the repository.