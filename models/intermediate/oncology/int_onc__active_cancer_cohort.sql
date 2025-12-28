{{ config(materialized='view') }}

with max_date as (
  select max(paid_date) as max_paid_date
  from {{ ref('int_onc__cancer_diagnoses') }}
),

recent_cancer as (
  select
    c.person_id,
    c.cancer_type,
    max(c.paid_date) as most_recent_cancer_date
  from {{ ref('int_onc__cancer_diagnoses') }} c
  cross join max_date m
  where c.paid_date >= m.max_paid_date - interval '6 months'
  group by c.person_id, c.cancer_type
)

select *
from recent_cancer
