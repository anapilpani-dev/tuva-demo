{{ config(materialized='view') }}

select
  claim_id,
  person_id,
  diagnosis_code,
  paid_date,
  claim_start_date,
  claim_end_date,
  paid_amount,

  case
    when diagnosis_code between 'C00' and 'C14' then 'Head & Neck'
    when diagnosis_code between 'C15' and 'C26' then 'Digestive'
    when diagnosis_code between 'C30' and 'C39' then 'Respiratory'
    when diagnosis_code between 'C40' and 'C41' then 'Bone & Soft Tissue'
    when diagnosis_code between 'C43' and 'C44' then 'Skin'
    when diagnosis_code between 'C50' and 'C50' then 'Breast'
    when diagnosis_code between 'C51' and 'C58' then 'Gynecologic'
    when diagnosis_code between 'C60' and 'C63' then 'Genitourinary'
    when diagnosis_code between 'C64' and 'C68' then 'Urinary'
    when diagnosis_code between 'C69' and 'C72' then 'Eye & CNS'
    when diagnosis_code between 'C73' and 'C75' then 'Endocrine'
    when diagnosis_code between 'C76' and 'C80' then 'Other / Ill-defined'
    when diagnosis_code between 'C81' and 'C96' then 'Hematologic'
    else 'Other'
  end as cancer_type
from {{ ref('stg_onc__medical_claim_diagnoses') }}
where diagnosis_code like 'C%'
