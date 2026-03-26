{{ config(materialized='view') }}

SELECT
  FUND_ID,
  PRICE_DATE,
  NAV
FROM {{ source('raw','fund_prices') }}