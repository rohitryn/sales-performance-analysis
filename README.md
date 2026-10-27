# Sales Performance Analysis

## Project Overview

This project analyzes e-commerce sales and order data to understand recorded revenue, order status, product-category performance, customer geography, and sales trends. It combines Python, SQL, SQLite, and Power BI in an end-to-end analytics workflow.

> **Metric note:** `item_revenue` is calculated as item price plus shipping charges. It represents recorded transaction value in this project; it should not be interpreted as profit or confirmed collected revenue.

## Objectives

- Combine order, customer, product, payment, and order-item information into an analysis-ready dataset.
- Use SQL to join and aggregate source tables and perform data-quality checks.
- Use Python for data ingestion, preparation, and exploratory analysis.
- Build an interactive Power BI report with business-focused KPIs, trends, category comparisons, and geographic analysis.
- Communicate findings through reproducible queries and dashboard visuals.

## Tools and Technologies

- **Python** — data ingestion and analysis
- **Pandas** — data preparation and exploration
- **SQL** — joins, aggregations, indexes, and quality checks
- **SQLite** — local analytical database
- **Power BI** — interactive reporting and visualization
- **Jupyter Notebook** — exploratory analysis and query development

## Project Structure

```text
sales-performance-analysis/
├── sql/
│   ├── 01_build_sales_dataset.sql
│   ├── 02_create_indexes.sql
│   ├── 03_data_quality_checks.sql
│   ├── 04_explain_main_query.sql
│   └── README.md
├── logs1/                         # ingestion logs, if included
├── sales_analysis.db              # local SQLite database; normally not committed
├── sales_master_data_cleaned.csv  # cleaned analysis dataset, if included
├── <Python scripts and notebooks>
├── <Power BI report file>
└── README.md
```

The filenames for Python scripts, notebooks, and the Power BI report may differ in your local project. Update this structure to match the final repository before publishing.

## Data Workflow

1. **Ingest source data** into SQLite tables for customers, orders, order items, payments, and products.
2. **Build the analysis dataset** by joining the relevant tables and aggregating order-item values at the order/product/seller grain.
3. **Run data-quality checks** to inspect row counts, missing product categories, product-key coverage, and table schemas.
4. **Analyze the data** using SQL and Python.
5. **Visualize the results** in Power BI with report pages for executive performance, products/categories, and customer/geographic analysis.

## SQL Work

The `sql/` directory contains:

- `01_build_sales_dataset.sql` — query to build the combined analysis dataset.
- `02_create_indexes.sql` — indexes intended to support common join keys.
- `03_data_quality_checks.sql` — checks for table counts, missing values, key coverage, and schema details.
- `04_explain_main_query.sql` — query-plan inspection for the main dataset query.

These scripts were organized from the project's SQL work. Review table names and paths against your current database before running them.

## Power BI Report

The report is organized into three pages:

### 1. Executive Sales Dashboard
- Total recorded revenue
- Delivered orders
- Average recorded revenue per delivered order
- Monthly recorded-revenue trend
- Revenue by product category
- Order-status distribution
- Interactive filters/slicers

### 2. Product & Category Analysis
- Recorded revenue by category
- Average recorded revenue per delivered order by category
- Top products
- Orders by category
- Product-level details

### 3. Customer & Geographic Analysis
- Recorded revenue by state and city
- Orders by state
- Geographic/location details
- Optional map visualization, if included in the final report

## Selected Findings

Based on the current analysis:

- The dataset contains **89,316 rows** in the cleaned analysis table.
- The recorded date range is **September 4, 2016 to September 3, 2018**.
- **87,428 delivered orders** were reported in the current status summary.
- The toys category had the highest total recorded revenue in the category summary, while garden tools had a higher average recorded value per delivered order in that comparison.

These results describe the current project dataset and may change if the data or filters are updated. Confirm the final Power BI totals and category definitions before presenting them in an interview.

## Reproducing the Project

1. Obtain the source CSV files from the dataset provider and place them in the input location expected by your ingestion script.
2. Install the Python dependencies used by your scripts. Add a `requirements.txt` file with the actual dependencies and versions used in your environment.
3. Run the ingestion script to create/populate the SQLite database.
4. Run the SQL scripts in `sql/` as appropriate for your workflow.
5. Run the analysis notebook(s) or Python scripts.
6. Open the Power BI report and update its data-source path to your local cleaned dataset or database export.

Because local file paths and source-data locations vary, update these steps with the exact script names and commands before publishing.

## Repository and Data Notes

- Avoid committing large database files, private information, or source data you are not permitted to redistribute.
- If `sales_analysis.db` is excluded from Git, explain how reviewers can recreate it from the permitted source files.
- Consider adding a `.gitignore` for Python cache files, local database files, logs, and environment folders.
- Include screenshots of the finished Power BI pages in a `screenshots/` folder if you want reviewers to preview the dashboard on GitHub.
- Do not describe recorded revenue as profit unless costs and profit calculations are available.

## Next Improvements

- Add a `requirements.txt` file.
- Add dashboard screenshots.
- Document exact run commands and the source dataset attribution/license.
- Add a short section explaining the key business recommendations derived from the final dashboard.
