# Bar - Consolidated Data Product

This dbt project shows how to create a data product that consumes data from another dbt project (foo).

## Overview

This project:
1. Uses the `customer_view` table from the `foo` project as a source
2. Creates a new `customer_aggregated` table that excludes the age column
3. Uses AWS Athena as the data warehouse

## Prerequisites

- You must run the `foo` project first to make its `customer_view` table available in Athena

## Setup

1. Create the S3 bucket for the project:
   ```bash
   make create-bucket
   ```

2. Configure Athena with a default query results location:
   ```bash
   make setup-athena
   ```

3. Check dependencies:
   ```bash
   make deps
   ```

## Usage

1. Run the models:
   ```bash
   make run
   ```

2. Test the models:
   ```bash
   make test
   ```

3. Run a sample query:
   ```bash
   make sample-query
   ```

4. See all tables in the dbt schema:
   ```bash
   make list
   ```

5. Complete development cycle:
   ```bash
   make all
   ```

## Table Structure

The `customer_aggregated` table has the following columns:
- `customer_id` - The primary key
- `first_name` - Customer's first name
- `last_name` - Customer's last name
- `email` - Customer's email address
- `city` - Customer's city
- `country` - Customer's country
- `created_at` - Customer creation date

Note that the `age` column from the source data is intentionally excluded in this consolidated table.

## Querying in Athena Console

After running `make run`, you can query the table in the Athena console at:
https://eu-west-2.console.aws.amazon.com/athena/home?region=eu-west-2#/query-editor

Example query:
```sql
SELECT * FROM dbt.customer_aggregated;
```

## Resources

- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
