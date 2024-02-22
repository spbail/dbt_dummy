# bubble_interview_dbt
Bubble interview dbt project

This is an intentionally chaotic and contrived dbt project with several antipatterns:
1. (minor detail) using a select * in the staging tables - we should list every column to fail early if columns are removed or renamed
2. no tests anywhere - should test at least unique and non-null on PK columns
3. (minor detail) the payment_date field is not listed in the schema yml for stg_payment.sql
4. the source tables are accessed directly in int_focus_stores - this should also be a staging table
5. there's a join back to an upstream model (stg_customer) in top_customers_for_focus_stores
6. top_customers_for_focus_stores uses a subquery instead of a join for a simple filter