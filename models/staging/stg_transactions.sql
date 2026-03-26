{{ config(materialized='view') }}

SELECT
  TXN_ID,
  INVESTOR_ID,
  FUND_ID,
  TXN_DATE,
  TXN_TYPE,
  UNITS,
  AMOUNT
FROM {{ source('raw','transactions') }}