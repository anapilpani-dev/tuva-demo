{{ config(materialized='view') }}

with base as (
  select
    claim_id,
    person_id,
    paid_date,
    claim_start_date,
    claim_end_date,
    paid_amount,

    diagnosis_code_1,
    diagnosis_code_2,
    diagnosis_code_3,
    diagnosis_code_4,
    diagnosis_code_5,
    diagnosis_code_6,
    diagnosis_code_7,
    diagnosis_code_8,
    diagnosis_code_9,
    diagnosis_code_10,
    diagnosis_code_11,
    diagnosis_code_12,
    diagnosis_code_13,
    diagnosis_code_14,
    diagnosis_code_15,
    diagnosis_code_16,
    diagnosis_code_17,
    diagnosis_code_18,
    diagnosis_code_19,
    diagnosis_code_20,
    diagnosis_code_21,
    diagnosis_code_22,
    diagnosis_code_23,
    diagnosis_code_24,
    diagnosis_code_25
  from {{ ref('input_layer__medical_claim') }}
),

dx as (
  select claim_id, person_id, paid_date, claim_start_date, claim_end_date, paid_amount, 1 as dx_position, diagnosis_code_1 as diagnosis_code from base
  union all select claim_id, person_id, paid_date, claim_start_date, claim_end_date, paid_amount, 2, diagnosis_code_2 from base
  union all select claim_id, person_id, paid_date, claim_start_date, claim_end_date, paid_amount, 3, diagnosis_code_3 from base
  union all select claim_id, person_id, paid_date, claim_start_date, claim_end_date, paid_amount, 4, diagnosis_code_4 from base
  union all select claim_id, person_id, paid_date, claim_start_date, claim_end_date, paid_amount, 5, diagnosis_code_5 from base
  union all select claim_id, person_id, paid_date, claim_start_date, claim_end_date, paid_amount, 6, diagnosis_code_6 from base
  union all select claim_id, person_id, paid_date, claim_start_date, claim_end_date, paid_amount, 7, diagnosis_code_7 from base
  union all select claim_id, person_id, paid_date, claim_start_date, claim_end_date, paid_amount, 8, diagnosis_code_8 from base
  union all select claim_id, person_id, paid_date, claim_start_date, claim_end_date, paid_amount, 9, diagnosis_code_9 from base
  union all select claim_id, person_id, paid_date, claim_start_date, claim_end_date, paid_amount, 10, diagnosis_code_10 from base
  union all select claim_id, person_id, paid_date, claim_start_date, claim_end_date, paid_amount, 11, diagnosis_code_11 from base
  union all select claim_id, person_id, paid_date, claim_start_date, claim_end_date, paid_amount, 12, diagnosis_code_12 from base
  union all select claim_id, person_id, paid_date, claim_start_date, claim_end_date, paid_amount, 13, diagnosis_code_13 from base
  union all select claim_id, person_id, paid_date, claim_start_date, claim_end_date, paid_amount, 14, diagnosis_code_14 from base
  union all select claim_id, person_id, paid_date, claim_start_date, claim_end_date, paid_amount, 15, diagnosis_code_15 from base
  union all select claim_id, person_id, paid_date, claim_start_date, claim_end_date, paid_amount, 16, diagnosis_code_16 from base
  union all select claim_id, person_id, paid_date, claim_start_date, claim_end_date, paid_amount, 17, diagnosis_code_17 from base
  union all select claim_id, person_id, paid_date, claim_start_date, claim_end_date, paid_amount, 18, diagnosis_code_18 from base
  union all select claim_id, person_id, paid_date, claim_start_date, claim_end_date, paid_amount, 19, diagnosis_code_19 from base
  union all select claim_id, person_id, paid_date, claim_start_date, claim_end_date, paid_amount, 20, diagnosis_code_20 from base
  union all select claim_id, person_id, paid_date, claim_start_date, claim_end_date, paid_amount, 21, diagnosis_code_21 from base
  union all select claim_id, person_id, paid_date, claim_start_date, claim_end_date, paid_amount, 22, diagnosis_code_22 from base
  union all select claim_id, person_id, paid_date, claim_start_date, claim_end_date, paid_amount, 23, diagnosis_code_23 from base
  union all select claim_id, person_id, paid_date, claim_start_date, claim_end_date, paid_amount, 24, diagnosis_code_24 from base
  union all select claim_id, person_id, paid_date, claim_start_date, claim_end_date, paid_amount, 25, diagnosis_code_25 from base
)

select
  claim_id,
  person_id,
  paid_date,
  claim_start_date,
  claim_end_date,
  paid_amount,
  dx_position,
  upper(trim(diagnosis_code)) as diagnosis_code
from dx
where diagnosis_code is not null
