# Oncology Cost & Cohort Analysis (Tuva Project Demo) - by Ana Pilpani

## Overview
This project explores how claims data can be used to identify patients undergoing active cancer treatment and to understand the primary drivers of cost across care settings. The goal is to establish a practical baseline that could support future work around cost management, care optimization, and patient outcomes.

All analysis is built using the Tuva Project data model on synthetic claims and encounter data.

---

## Methodology

### Cancer Identification
Patients were identified as having cancer based on the presence of ICD-10-CM diagnosis codes corresponding to malignant neoplasms (`C00–C96`). These codes were sourced from diagnosis fields on medical claims, which are a reliable starting point for cohort identification when working with billing data.

Diagnosis codes were normalized by unpivoting all diagnosis positions on each claim into a diagnosis-level view. This ensures consistent filtering and avoids bias toward primary diagnosis fields alone.

### Cancer Segmentation
Cancer diagnoses were grouped into high-level clinical categories (e.g. Breast, Digestive, Hematologic) using ICD-10 code ranges. The intent was to strike a balance between clinical relevance and interpretability, enabling cost comparisons that are meaningful at an executive and operational level.

### Active Cancer Definition
“Active cancer” was defined as having at least one malignant cancer diagnosis within the most recent six months of observed data. This time-based approach serves as a pragmatic proxy for patients likely receiving ongoing treatment, while remaining transparent and easy to explain.

### Cost Profiling
Costs were analyzed using encounter-level paid amounts and grouped by care setting via `encounter_type`. This provides a clear view into where spending concentrates across inpatient, outpatient, and other settings for patients with active cancer.

---

## Key Findings (Executive Summary)

- Patients with active cancer represent a relatively small share of the overall population but account for a disproportionate amount of total medical spend.
- Inpatient and outpatient encounters are the primary cost drivers across most cancer categories, with inpatient care contributing the highest cost per encounter.
- Cost patterns vary meaningfully by cancer type, suggesting that targeted interventions may be more effective than uniform cost-containment strategies.
- While claims data lacks clinical nuance, it provides a strong foundation for identifying high-impact populations and prioritizing deeper clinical or care-management analyses.

---

## Limitations & Next Steps
- Claims data does not capture treatment intent or outcomes; integrating clinical data would allow for more precise cohort definitions.
- The active cancer definition relies on a time-based heuristic; incorporating treatment-specific procedure codes could improve specificity.
- Future analyses could explore longitudinal spend trajectories, site-of-care shifts, and payer-specific patterns to further inform intervention strategies.

---

## AI Usage Log
AI tools were used selectively to accelerate development, including drafting initial SQL scaffolding and generating ICD-10 code groupings for cancer segmentation. All generated logic was reviewed, validated against the data, and manually refined prior to inclusion.
