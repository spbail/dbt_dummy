{{
    config(
        materialized='table',
    )
}}

SELECT
    rev.customer_id,
    cust.first_name,
    cust.last_name,
    cust.email,
    SUM(rev.amount) as total_amount
FROM
    {{ ref('int_customer_revenue_by_date') }} rev
LEFT JOIN
    {{ ref('stg_customer') }} cust
USING (customer_id)
WHERE cust.store_id IN (SELECT store_id from int_focus_stores)
GROUP BY 1, 2, 3, 4
ORDER BY 5 DESC