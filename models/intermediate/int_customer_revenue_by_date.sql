{{
    config(
        materialized='table',
    )
}}

SELECT
    DATE(payment_date) AS payment_date,
    customer_id,
    SUM(amount) AS amount
FROM
    {{ ref('stg_payment') }}
GROUP BY
    1, 2