{{ config(materialized='view') }}

-- Baseline cancer definition used across the oncology cohort.
-- ICD-10-CM codes beginning with 'C' (C00–C96) represent malignant neoplasms.
-- This view provides a consistent reference for identifying cancer diagnoses
-- in downstream oncology models.

select
  'C' as icd10_prefix,
  'Malignant neoplasm (ICD-10-CM C00–C96)' as definition
