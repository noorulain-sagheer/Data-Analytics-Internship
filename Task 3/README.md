# Task 3 - SQL, Python & Power BI Business Analysis

## Project Overview

This project is a business analysis of the Chinook music store database.

The main purpose of this task was to use SQL, Python, and Power BI to understand sales, customers, products, and overall business performance.

## Dataset

The dataset used for this project is the **Chinook Database**.

It contains information about:

- Customers
- Invoices and orders
- Tracks
- Albums
- Artists
- Genres
- Employees

## Tools Used

- **SQL / SQLite** - for data analysis and business queries
- **Python** - for data analysis and charts
- **Pandas** - for working with data
- **Matplotlib / Seaborn** - for visualizations
- **Power BI** - for creating the final interactive dashboard
- **Google Colab** - for running Python analysis

## SQL Analysis

SQL was used to answer important business questions, such as:

- What is the total revenue?
- How many customers and orders are there?
- What is the average order value?
- Which customers spend the most?
- Which countries generate the most revenue?
- Which genres and artists sell the most?
- How does revenue change by year and month?
- What is the yearly revenue growth?
- Which customers are high-value customers?

A separate `analysis.sql` file contains the SQL queries used in this project.

## Python Analysis

Python was used to further analyze the data and create visualizations.

The analysis included:

- Revenue by country
- Revenue by year
- Revenue by month
- Top customers
- Top genres
- Top artists
- Customer distribution by country

The Python notebook used in the project is included as `analysis.ipynb`.

## Power BI Dashboard

A Power BI dashboard was created to show the main results in an easy-to-understand way.

The dashboard includes:

- Total Revenue
- Total Orders
- Total Customers
- Average Order Value
- Revenue by Country
- Revenue Trend by Year
- Top 10 Customers by Revenue
- Revenue by Genre
- Top 10 Artists by Revenue
- Customer Distribution by Country

The dashboard also has three filters:

- Country
- Year
- Genre

These filters allow the user to explore the data more easily.

## Main Results

Some important results from the analysis are:

- **Total Revenue:** $2,328.60
- **Total Orders:** 412
- **Total Customers:** 59
- **Average Order Value:** $5.65
- **Top Revenue Country:** USA with $523.06
- **Top-Selling Genre:** Rock with 835 units sold
- **Top-Selling Artist:** Iron Maiden with 140 units sold
- **Top 10 Customers Revenue:** $451.20
- **Top 10 Customers Contribution:** 19.38%

## Business Insights

1. The USA generated the highest revenue, so it is an important market for the business.

2. Rock was the best-selling genre. Promoting Rock and similar music may help increase sales.

3. Iron Maiden was the top-selling artist. Popular artists can be used in promotions and recommendations.

4. The top 10 customers generated 19.38% of total revenue. These customers are important and should be retained.

5. The USA also had the highest number of customers. Other countries can be targeted to increase the customer base.

6. Revenue reached its highest yearly value in 2022 at $481.45, but revenue decreased by 5.64% in 2025 compared with 2024.

7. The average order value was $5.65. Product bundles and recommendations could help increase the amount customers spend per order.

## Conclusion

This project helped analyze the Chinook business from different points of view.

SQL was used to find important business results, Python was used for further analysis and visualizations, and Power BI was used to present the results in an interactive dashboard.

The analysis shows that the USA is the strongest market and Rock is the most popular genre. The results can help the business understand its customers and improve future sales strategies.

## Project Files

- `analysis.ipynb` - Python analysis and visualizations
- `analysis.sql` - SQL queries
- `powerbi_data.csv` - Data prepared for Power BI
- `Chinook_Business_Analysis_Dashboard.pbix` - Power BI dashboard
- `README.md` - Project information and findings
