# Week 5 - Phase 1: Pivoting Data with PySpark

---

## What We Did Today

### Data Preparation

- Created a Sales DataFrame with product, category, region, and sales amount
- Loaded sample sales data into a PySpark DataFrame
- Displayed the dataset for verification before performing transformations

### Pivot Operations

- Performed pivot operation to summarize sales by region
- Pivoted data using all available region values
- Pivoted data by specifying selected region values
- Applied multiple aggregation functions on pivoted data
- Compared pivoted summaries for different business scenarios

---

## PySpark Functions Used

| Function | Description |
|----------|-------------|
| `groupBy()` | Groups records based on one or more columns |
| `pivot()` | Converts row values into columns |
| `sum()` | Calculates the total of numeric values |
| `avg()` | Calculates the average of numeric values |
| `agg()` | Performs multiple aggregation operations |
| `alias()` | Assigns a custom name to an aggregated column |
| `display()` | Displays the DataFrame in Databricks |

---

## Key Concepts Learned

| Concept | Purpose |
|---------|---------|
| Grouping | Organize records before aggregation |
| Pivoting | Transform row values into separate columns |
| Aggregation | Summarize data using mathematical functions |
| Multiple Aggregations | Calculate multiple metrics in a single operation |
| Specified Pivot Values | Pivot only selected column values |
| Data Summarization | Generate reports for business analysis |

---

## Files in This Folder

| File | Description |
|------|-------------|
| `Query.sql` | SQL implementation of pivot operations |
| `PySpark.py` | PySpark implementation of pivot transformations |
| `README.md` | Documentation for Week 5 Phase 1 - Pivoting Data |
| `Output Screenshots/` | Screenshots captured during execution |

---

## Note

The SQL queries were implemented first to understand the pivot logic, followed by the equivalent PySpark implementation. The notebook demonstrates pivoting with all values, pivoting using selected values, and performing multiple aggregation functions on pivoted data.