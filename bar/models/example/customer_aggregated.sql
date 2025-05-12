{{ config(materialized='table') }}

-- A model that reads data from foo's customer_view but excludes the age column
SELECT
    customer_id,
    first_name,
    last_name,
    email,
    city,
    country,
    created_at
FROM {{ source('foo', 'customer_view') }}
