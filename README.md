# Retail Banking Transaction Analysis (SQL + Power BI)

Analysis of **2,500+ retail banking transactions** using **SQL** for business analysis and **Power BI** for an interactive dashboard.

---

## Project Overview

Retail banks process thousands of transactions every day across multiple channels such as ATMs, online banking, and branches. Analyzing this data helps uncover customer behavior, transaction patterns, and operational insights that support data-driven decision-making.

This project demonstrates the use of **SQL** for data exploration and business analysis, along with **Power BI** for creating an interactive dashboard that transforms raw transaction data into meaningful business insights.

---

## Objectives

- Explore and validate transaction data using SQL
- Analyze customer transaction behavior
- Identify trends across transaction types, channels, locations, and merchants
- Segment customers by occupation and age group
- Build an interactive Power BI dashboard to communicate insights effectively

---

## Dataset

**Source:** Public synthetic dataset from Kaggle (practice purposes only)

**Dataset Summary**

- **Transactions:** 2,512
- **Customers:** 495
- **Locations:** 43
- **Merchants:** 100
- **Time Period:** January 2023  to January 2024

> **Note:** This is a synthetic dataset created for learning and portfolio purposes. The insights reflect patterns within the dataset and cannot be interpreted as real-world banking trends.

---

## Tools Used

- SQL
- MySQL Workbench
- Power BI

---

## Business Questions Answered

The analysis is organized into four SQL modules, each addressing a different set of business questions.

A couple of examples from each section include:

### Data Exploration
- How complete and reliable is the dataset?
- What is the overall composition of customers, merchants, and locations?

### Transaction Analysis
- Which transaction types and banking channels dominate transaction volume and value?
- When are transaction volumes at their highest?

### Customer Analysis
- How does spending vary across occupations and age groups?
- Which customers contribute the highest transaction value?

### Advanced Business Analysis
- Which merchants rank highest within each location?
- How can CTEs and window functions be used to generate business insights?

and more.

---

## Project Structure

```
Retail-Banking-Transaction-Analysis/
│
├── README.md
├── LICENSE
│
├── data/
│   └── bank_data.csv
│
├── sql/
│   ├── 01_data_exploration.sql
│   ├── 02_transaction_analysis.sql
│   ├── 03_customer_analysis.sql
│   └── 04_advanced_analysis.sql
│
├── powerbi/
│   └── Retail_Banking_Performance_Overview.pbix
│
└── images/
    └── dashboard_overview.png
```

---

## SQL Analysis

The SQL analysis includes:

- Data exploration and quality checks
- Missing value validation
- Transaction analysis by type, channel, merchant, and location
- Customer segmentation
- Common Table Expressions (CTEs)
- Window Functions (`ROW_NUMBER()`)
- KPI generation for dashboard reporting

---



## Key Insights

- **Debit transactions dominate activity**, accounting for **1,944** of **2,512** transactions.

- **ATM transactions have the highest average transaction value** (307.72) and the longest average processing time (122.1 seconds), suggesting ATMs are used for larger transactions.

- **Students recorded the highest average transaction value** (313.22), while **Engineers** had the lowest (289.04).

- **Customers aged 18 to 25** showed the highest average transaction value (315.90), whereas the **36 to 50** age group recorded the lowest (273.06).

- Using **CTEs** and the **ROW_NUMBER()** window function, **Merchant M026** was identified as the top-performing merchant, processing **45 transactions** worth **13,865**.

- **Austin**, **Oklahoma City**, and **Memphis** ranked as the top three locations by total transaction value.
---

## Files

| File | Description |
|------|-------------|
| `bank_data.csv` | Source dataset |
| `01_data_exploration.sql` | Data profiling and quality checks |
| `02_transaction_analysis.sql` | Transaction volume and value analysis |
| `03_customer_analysis.sql` | Customer segmentation |
| `04_advanced_analysis.sql` | Advanced SQL using CTEs and window functions |
| `Retail_Banking_Performance_Overview.pbix` | Interactive Power BI dashboard |
| `dashboard_overview.png` | Screenshot of the Power BI dashboard |

---

 

## Author

**Arjun K**

**BBA FinTech & Banking Student at Kristu Jayanti University**
