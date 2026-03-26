{{ config(
    materialized='incremental',
    unique_key='TXN_ID',
    incremental_strategy='merge'
) }}

SELECT
  TXN_ID,
  INVESTOR_ID,
  FUND_ID,
  TXN_DATE,
  TXN_TYPE,
  UNITS,
  AMOUNT
FROM {{ ref('stg_transactions') }}

{% if is_incremental() %}
  WHERE TXN_DATE > (SELECT MAX(TXN_DATE) FROM {{ this }})
{% endif %}