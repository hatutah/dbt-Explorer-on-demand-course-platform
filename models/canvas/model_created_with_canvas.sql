WITH stg_orders AS (
  /* staging model for orders source table */
  SELECT
    *
  FROM {{ ref('explorer_platform', 'stg_orders') }}
), aggregate_1 AS (
  SELECT
    CUSTOMER_ID,
    COUNT(CUSTOMER_ID) AS count_CUSTOMER_ID
  FROM stg_orders
  GROUP BY
    CUSTOMER_ID
), model_created_with_canvas_sql AS (
  SELECT
    *
  FROM aggregate_1
)
SELECT
  *
FROM model_created_with_canvas_sql