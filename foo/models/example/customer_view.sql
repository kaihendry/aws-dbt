{{ config(materialized='view') }}

-- A simple view of the customers seed data
SELECT * FROM {{ ref('customers') }}
