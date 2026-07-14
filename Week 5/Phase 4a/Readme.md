# Week 5 - Phase 4A: Bucketing and Customer Segmentation

---

## Overview

Phase 4A focused on customer segmentation using PySpark. Building on the customer and order datasets from the previous phase, we calculated customer spending and categorized customers into different segments using multiple bucketing techniques. This phase introduced analytical transformations commonly used in business intelligence and customer analytics.

---

## What We Did Today

### Customer Segmentation

- Created Gold, Silver, and Bronze customer segments using conditional logic
- Implemented customer segmentation using SQL `CASE` statements
- Counted customers in each segment

### Bucketing Techniques

- Performed bucket-based segmentation using MLlib `Bucketizer`
- Created quantile-based customer segments using `approxQuantile()`
- Ranked customers using `percent_rank()` with Window functions

### Comparison

- Compared results from different segmentation techniques
- Observed how various bucketing approaches classify customers based on spending

---

## PySpark Functions Used

| Function | Description |
|----------|-------------|
| `join()` | Combines customer and order datasets |
| `groupBy()` | Groups customer records |
| `agg()` | Performs aggregate operations |
| `sum()` | Calculates total spending |
| `count()` | Counts customer orders |
| `fillna()` | Replaces null values |
| `when()` | Creates conditional segmentation |
| `createOrReplaceTempView()` | Registers DataFrame as a SQL view |
| `Bucketizer` | Creates bucket-based segments |
| `approxQuantile()` | Calculates quantile boundaries |
| `Window` | Defines a window specification |
| `percent_rank()` | Calculates customer ranking percentile |

---

## Key Concepts Learned

| Concept | Purpose |
|---------|---------|
| Customer Segmentation | Categorize customers based on spending |
| Conditional Logic | Assign business categories using rules |
| SQL CASE Statement | Perform segmentation using SQL |
| Bucketizer | Divide numerical values into predefined buckets |
| Quantile Segmentation | Split data into balanced groups |
| Window Functions | Rank records without collapsing data |
| Percent Rank | Compare customers based on relative spending |
| Business Analytics | Generate customer insights for decision making |

---

## Files in This Folder

| File | Description |
|------|-------------|
| `Phase4A_Bucketing_and_Segmentation.ipynb` | Databricks notebook implementing all bucketing and segmentation techniques |
| `README.md` | Documentation for Week 5 Phase 4A |
---

## Note

The notebook demonstrates multiple customer segmentation techniques, including conditional logic, SQL CASE statements, Bucketizer, quantile-based segmentation, and window ranking.