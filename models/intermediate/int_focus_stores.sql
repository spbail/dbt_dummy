{{
    config(
        materialized='table',
    )
}}

SELECT
    *
FROM public.store
WHERE store_id in (1, 2)