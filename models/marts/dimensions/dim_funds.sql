{{ config(
    materialized='incremental',
    unique_key='FUND_ID',
    incremental_strategy='merge'
) }}

SELECT
  FUND_ID,
  FUND_NAME,
  FUND_TYPE,
  INCEPTION_DATE,
  CURRENT_TIMESTAMP() AS LOAD_TS
FROM {{ ref('stg_funds') }}