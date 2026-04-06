### Telecom Customer Churn Analysis

Project Overview

Telecommunications companies depend on recurring revenue, so customer retention is critical. Losing customers means losing their entire lifetime value, not just a single month’s bill. Churn rarely happens randomly, it leaves patterns in contracts, service usage, billing, and support interactions.

This project demonstrates how to analyze customer behavior using Excel, SQL, and Power BI to identify churn risk, understand its drivers, and provide actionable insights for retention strategies.

Problem Statement

A telecom company is experiencing customer attrition but lacks visibility into which segments are most likely to churn and the factors influencing this behavior. Without this understanding, retention efforts remain reactive and inefficient.

Objectives:

Identify key drivers of customer churn

Determine high-risk customer segments

Evaluate the impact of contract types, services, and billing patterns

Provide data-driven recommendations to reduce churn and improve retention


Project Workflow

The project follows a structured pipeline:

Data Collection & Cleaning (Excel)

Compile customer-related data such as demographics, service subscriptions, billing patterns, contract types, and support interactions.

Clean and prepare datasets for analysis.

Relational Analysis (SQL)

Load cleaned datasets into a SQL database.

Perform queries and aggregations to explore customer behavior and churn drivers.

Visualization & Insights (Power BI)

Build interactive dashboards and visualizations.

Highlight trends, high-risk segments, and key factors influencing churn.


Recommendations

Translate insights into actionable strategies to reduce churn and improve customer retention.

Tools & Stack

Excel – Data preparation, cleaning, and aggregation

SQL – Relational queries and behavioral analysis

Power BI – Dashboards and visualization for business insights


Repository / Data Structure
Telecom-Customer-Churn/
```│
├── data/
│   ├── raw/                 # Original Excel files with raw customer data
│   ├── processed/           # Cleaned datasets ready for SQL import
│   └── sample_data/         # Optional small datasets for demo purposes
│
├── sql/                     # SQL scripts for analysis
│   ├── 01_data_import.sql   # Scripts to load data into SQL
│   ├── 02_behavior_analysis.sql
│   └── 03_churn_metrics.sql
│
├── powerbi/                 # Power BI project files
│   └── churn_dashboard.pbix
│
├── reports/                 # Output reports or exported visuals
│   └── figures/
│
├── README.md
└── LICENSE
```

Contributions

This project serves as a reference for analysts performing churn analysis with Excel, SQL, and Power BI. Contributions and suggestions are welcome.

License

MIT License – see the LICENSE
 file for details.

 
## Tools I Used


![Power BI](https://img.shields.io/badge/Power%20BI-F2C80F?style=for-the-badge&logo=power-bi&logoColor=black)
![Excel](https://img.shields.io/badge/Excel-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white)
![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
