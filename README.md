# Jaffle Shop Data Transformation with DBT

## Overview

This repository contains the dbt project code for transforming data related to the Jaffle Shop app. The transformations are performed on data stored within BigQuery and include staging tables as well as the creation of fact and dimension tables.

## Data Sources

The data for the transformations is sourced from the following tables within the Jaffle Shop app:

1. **Customer Data**: Contains details about the customers.
2. **Order Data**: Includes information on customer orders.
3. **Payment Data**: Holds payment information related to the orders.

## Methodology

The following transformations are performed on the data:

### Staging Views

Created staged views for each type of data:

- `stg_customers`: A view that prepares customer data for further transformations.
- `stg_orders`: A view that prepares order data for further transformations.
- `stg_payments`: A view for prepares payment data for further transformations.

### Fact Table

Created a fact table that centralizes key metrics and identifiers:

- `fact_orders`: Includes `order_id`, `customer_id`, `order_date` and `payment_amount` to track the transactions.

### Dimension Table

Created a customer dimension table that provides a comprehensive view of customers and their transactions:

- `dim_customers`: Contains customer information, related order details, and payment amounts.

## DBT and BigQuery

This project utilizes dbt (Data Build Tool) to perform data transformation tasks in a BigQuery environment. DBT is used for its powerful data modeling capabilities and its ability to integrate seamlessly with BigQuery.

### Using the Project

To use this dbt project:

1. Ensure you have dbt installed and configured for BigQuery.
2. Clone this repository to your local system.
3. Run the dbt models with the following commands:

```bash
dbt run  # Executes all models
dbt test # Runs tests on the models to ensure data integrity
