# Week 5 - Phase 2: SQL to PySpark Bridge Pack

---

## Overview

Phase 2 focused on bridging the gap between SQL and PySpark by solving real-world data engineering problems using Customer and Order datasets.

We created DataFrames, performed data cleaning, joined multiple datasets, and applied aggregation techniques to generate meaningful business insights. Each problem was first solved using SQL and then implemented in PySpark to compare the results.

---

## What We Did Today

### Data Preparation

- Created Customer and Order DataFrames
- Loaded sample customer and order records
- Verified data using DataFrame display and schema inspection

### Data Cleaning

- Identified records with missing `customer_id`
- Removed invalid records using `dropna()`
- Validated cleaned datasets before performing analysis

### Data Analysis

- Joined Customer and Order DataFrames
- Calculated total order amount for each customer
- Identified top spending customers
- Found customers without any orders
- Calculated city-wise revenue
- Computed average order amount per customer
- Identified customers with multiple orders
- Sorted customers based on total spending

---

## PySpark Functions Used

| Function | Description |
|----------|-------------|
| `dropna()` | Removes rows containing null values |
| `join()` | Combines two DataFrames |
| `groupBy()` | Groups records for aggregation |
| `agg()` | Performs aggregation operations |
| `sum()` | Calculates total values |
| `avg()` | Calculates average values |
| `count()` | Counts matching records |
| `filter()` | Filters rows based on conditions |
| `orderBy()` | Sorts DataFrame records |
| `limit()` | Returns a limited number of rows |
| `alias()` | Assigns temporary names to columns |

---

## Key Concepts Learned

| Concept | Purpose |
|---------|---------|
| Data Cleaning | Remove invalid records before analysis |
| Data Validation | Verify schemas and dataset quality |
| Data Joining | Combine related datasets using keys |
| Aggregation | Generate business summaries |
| Customer Analytics | Analyze customer spending patterns |
| Revenue Analysis | Calculate revenue by customer and city |
| Sorting | Rank records based on business metrics |
| SQL to PySpark Mapping | Convert SQL queries into PySpark transformations |

---

## Files in This Folder

| File | Description |
|------|-------------|
| `Query.sql` | SQL solutions for all Phase 2 exercises |
| `PySpark.py` | PySpark implementation of the Phase 2 exercises |
| `Readme.md` | Documentation for Week 5 Phase 2 |
| `Output Screenshots/` | Screenshots of outputs captured during execution |

---

## Note

The PySpark and SQL files contain comments indicating the corresponding screenshot file names for each output. This makes it easy to match the generated output with the screenshots stored in the repository.

