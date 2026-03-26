{{ config(materialized='view') }}

SELECT
  t.INVESTOR_ID,
  t.FUND_ID,
  t.TXN_DATE,
  SUM(
    CASE WHEN TXN_TYPE='BUY' THEN UNITS
         WHEN TXN_TYPE='SELL' THEN -UNITS
    END
  ) OVER (PARTITION BY INVESTOR_ID, FUND_ID ORDER BY TXN_DATE) AS CUM_UNITS
FROM {{ ref('stg_transactions') }} t