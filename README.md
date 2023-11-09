# Jaffle Shop Data Transformation with DBT

## Overview

This repository contains the dbt project code for transforming data associated with the Jaffle Shop application. The data transformations are executed on BigQuery and are designed to prepare the data for analytical purposes, focusing on customer, order, and payment data.

## Data Sources

The data is sourced from the Jaffle Shop application and includes:

1. **Customer Data**: Details about customers of the Jaffle Shop.
2. **Order Data**: Information on orders placed by customers.
3. **Payment Data**: Payment transactions associated with customer orders.

## Methodology

Transformations are applied as follows:

### Staging

Creation of staged views to clean and prepare data for downstream processing:

- `stg_customers`: Prepares customer data.
- `stg_orders`: Prepares order data.
- `stg_payments`: Prepares payment data.

### Fact Table

A central fact table is constructed to hold key transactional metrics:

- `fact_orders`: Contains `order_id`, `customer_id`, and `payment_amount`.

### Dimension Table

A dimension table is created to provide a 360-degree view of customer activity:

- `dim_customers`: Enriched customer information, including order details and payment totals.

## DBT and BigQuery

This project employs dbt (Data Build Tool) to perform data modelling and transformations within a BigQuery environment, leveraging dbt's native capabilities to manage workflows.

## Testing

Testing is an integral part of ensuring the integrity of transformed data. Two types of tests are implemented:

### Generic Tests

Generic tests in dbt are predefined tests applied to model columns to ensure data quality. They include:

- `not_null`: Ensures that a column contains no NULL values.
- `unique`: Confirms that all values in a column are unique.
- `accepted_values`: Checks that column values are among a set of accepted values.

## Custom Tests

In addition to dbt's standard tests, this project includes custom tests to ensure data integrity and validate business logic specific to the Jaffle Shop's data:

- `assert_positive_value_for_total_amount`: This test checks that the total payment amount for each order is positive. It is a crucial business rule that payment amounts should not be negative, indicating a refund or error. The test is defined in `assert_positive_value_for_total_amount.sql` and operates on the aggregated payment data to ensure all records meet this criterion.

To include this test in your repository:

1. Place the `assert_positive_value_for_total_amount.sql` file in the `tests` directory of your dbt project.
2. Reference the test in your dbt project's `schema.yml` file under the appropriate model. For example:

```yaml
version: 2

models:
  - name: fact_payments
    tests:
      - assert_positive_value_for_total_amount
```


To run this specific test, execute:

```bash
dbt test --select assert_positive_value_for_total_amount
```

Both these tests are specified in the `schema.yml` file associated with each model and are run using:

```bash
dbt test
```
