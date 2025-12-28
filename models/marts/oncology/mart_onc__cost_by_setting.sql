{{ config(materialized='table') }}

select
  c.cancer_type,
  e.encounter_type,
  count(distinct e.encounter_id) as encounter_count,
  sum(e.paid_amount) as total_paid_amount
from {{ ref('int_onc__active_cancer_cohort') }} c
join {{ ref('input_layer__encounter') }} e
  on c.person_id = e.person_id
group by
  c.cancer_type,
  e.encounter_type
order by
  total_paid_amount desc
