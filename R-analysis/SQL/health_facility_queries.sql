-- -----------------------------------------
-- Health Facility Data Queries (Demo)
-- Author: Dr. Natnael Tsegaye
-- Focus: MCH & surveillance reporting
-- -----------------------------------------

-- Create dummy table
CREATE TABLE maternal_records (
    patient_id INTEGER,
    maternal_age INTEGER,
    antenatal_visits INTEGER,
    delivery_mode TEXT,
    neonatal_outcome TEXT
);

-- Sample query: ANC coverage
SELECT
  COUNT(*) AS total_deliveries,
  SUM(CASE WHEN antenatal_visits >= 4 THEN 1 ELSE 0 END) AS adequate_anc,
  ROUND(
    SUM(CASE WHEN antenatal_visits >= 4 THEN 1 ELSE 0 END) * 100.0 /
    COUNT(*), 2
  ) AS anc_coverage_percent
FROM maternal_records;

-- Sample query: Neonatal outcomes
SELECT
  neonatal_outcome,
  COUNT(*) AS cases
FROM maternal_records
GROUP BY neonatal_outcome;
