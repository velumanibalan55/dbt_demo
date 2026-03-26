{{ config(materialized='view') }}

SELECT
  FUND_ID,
  FUND_NAME,
  FUND_TYPE,
  INCEPTION_DATE
FROM {{ source('raw','funds') }}

