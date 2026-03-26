{{ config(materialized='view') }}

SELECT
  p.FUND_ID,
  p.PRICE_DATE,
  p.NAV,
  f.FUND_NAME,
  f.FUND_TYPE
FROM {{ ref('stg_fund_prices') }} p
JOIN {{ ref('stg_funds') }} f
  ON p.FUND_ID = f.FUND_ID