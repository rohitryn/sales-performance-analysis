# SQL scripts — Sales Performance Analysis

These scripts were organized from the SQL work in `sales_table1_eda.ipynb`.
They use **SQLite** syntax and expect the existing `sales_analysis.db` database with
`Orders`, `Customers`, `OrderItems`, `Payments`, and `Products` tables.

## Files

1. `01_build_sales_dataset.sql` — the main joined query extracted from the notebook. It aggregates order-item rows and payment rows before joining to avoid multiplying those rows.
2. `02_create_indexes.sql` — the five indexes used in the notebook to support joins.
3. `03_data_quality_checks.sql` — table inventory, row counts, schema inspection, and checks related to missing product categories.
4. `04_explain_main_query.sql` — SQLite `EXPLAIN QUERY PLAN` for the main query.

## How to run

Open `sales_analysis.db` in a SQLite-compatible tool (for example, DB Browser for SQLite) and run the scripts in order. The first script returns the dataset query; it does not create or replace a table by itself.

The notebook used Python/Pandas to run the main query and store its result in a DataFrame. SQL scripts here keep the SQL logic separate for review and reproducibility.

## Notes

- These scripts preserve the main query and indexes found in the notebook.
- Data-quality checks are written as read-only queries.
- Table and column names are case-sensitive only as SQLite requires; the expected schema must match the notebook.
