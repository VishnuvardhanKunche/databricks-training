# Week 5 - Phase 4: Business Pipeline and Analytics

---

## Overview

Phase 4 focused on building a complete business analytics pipeline using PySpark. The project followed the ETL (Extract, Transform, Load) workflow by reading customer and sales datasets from CSV files, cleaning and validating the data, performing business transformations, generating analytical reports, and exporting the final processed data.

The notebook demonstrates how raw business data can be converted into meaningful insights using PySpark DataFrame operations.

---

## What We Did Today

### Data Ingestion

- Read customer and sales datasets from CSV files
- Loaded data into PySpark DataFrames
- Displayed datasets for verification
- Inspected DataFrame schemas

### Data Cleaning

- Identified missing values
- Removed duplicate records
- Removed rows with missing `customer_id`
- Filled missing city values
- Filtered invalid sales records with negative amounts
- Converted order dates to Date format

### Business Analytics

- Calculated daily sales revenue
- Generated city-wise revenue reports
- Identified the Top 5 customers by total spending
- Found repeat customers based on order count
- Identified the highest spending customer in each city
- Performed customer segmentation into Gold, Silver, and Bronze categories
- Created the final business reporting table

### Data Export

- Generated the final analytics report
- Saved the reporting table as a CSV file

---

## PySpark Functions Used

| Function | Description |
|----------|-------------|
| `spark.read.csv()` | Reads CSV files into DataFrames |
| `show()` | Displays DataFrame contents |
| `printSchema()` | Displays DataFrame schema |
| `dropDuplicates()` | Removes duplicate records |
| `dropna()` | Removes rows containing null values |
| `fillna()` | Replaces missing values |
| `filter()` | Filters invalid records |
| `withColumn()` | Creates or modifies columns |
| `to_date()` | Converts string values to Date type |
| `join()` | Combines multiple DataFrames |
| `groupBy()` | Groups records for aggregation |
| `agg()` | Performs aggregation operations |
| `sum()` | Calculates total values |
| `count()` | Counts records |
| `orderBy()` | Sorts records |
| `row_number()` | Generates rankings within groups |
| `Window.partitionBy()` | Creates window partitions |
| `write.csv()` | Exports DataFrame as CSV |

---

## Key Concepts Learned

| Concept | Purpose |
|---------|---------|
| ETL Pipeline | Extract, Transform, and Load workflow |
| Data Ingestion | Read business datasets from CSV files |
| Data Cleaning | Remove null, duplicate, and invalid records |
| Data Validation | Verify schema and data quality |
| Business Analytics | Generate customer and sales insights |
| Aggregations | Calculate revenue and spending metrics |
| Window Functions | Rank customers within each city |
| Customer Segmentation | Categorize customers by spending behavior |
| Reporting | Build a final business analytics report |
| Data Export | Save processed data for future use |

---

## Files in This Folder

| File | Description |
|------|-------------|
| `Business Pipeline & Analytics.ipynb` | Complete PySpark notebook implementing the Phase 4 business analytics pipeline |
| `customers.csv` | Customer dataset used for the project |
| `sales.csv` | Sales dataset used for the project |
| `Readme.md` | Documentation for Week 5 Phase 4 |
---

## Pipeline Workflow

1. Read customer and sales CSV datasets.
2. Inspect the data and verify schemas.
3. Clean missing, duplicate, and invalid records.
4. Join customer and sales datasets.
5. Perform business transformations and aggregations.
6. Generate analytical reports and customer insights.
7. Export the final reporting table as a CSV file.

---

## Note

The repository contains the complete **Business Pipeline and Analytics** notebook, the source datasets (`customers.csv` and `sales.csv`), output screenshots, and this documentation. The notebook follows the complete ETL workflow and demonstrates practical business analytics using PySpark on realistic datasets.