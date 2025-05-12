# Test Data for dbt-Athena

This directory contains a seed file with test data for the dbt-Athena project.

## Available Seed

**customers.csv** - Contains basic customer information.

## Loading Seed to Athena

To load this seed into your Athena database, run:

```bash
make seed
```

This command loads the data into the `dbt` schema according to your `profiles.yml` file.

## Data Types

The `dbt_seed_config.yml` file at the project root defines column data types. This ensures that Athena interprets the data with the correct types.

## Querying in Athena Console

After running `make seed`, you can query this table in the Athena console at:
https://eu-west-2.console.aws.amazon.com/athena/home?region=eu-west-2#/data-sources/details/AwsDataCatalog

Example query:

```sql
-- Get all customers
SELECT * FROM dbt.customers;

-- Get customers from specific cities
SELECT * FROM dbt.customers WHERE city = 'London';
```
