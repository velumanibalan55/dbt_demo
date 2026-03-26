{{ config(materialized='table') }}

SELECT
  ip.INVESTOR_ID,
  ip.FUND_ID,
  ip.TXN_DATE AS POSITION_DATE,
  ip.CUM_UNITS,
  fp.NAV,
  ip.CUM_UNITS * fp.NAV AS POSITION_VALUE
FROM {{ ref('int_investor_positions') }} ip
LEFT JOIN {{ ref('int_fund_nav_enriched') }} fp
  ON ip.FUND_ID = fp.FUND_ID
 AND ip.TXN_DATE = fp.PRICE_DATE