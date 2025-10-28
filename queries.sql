-- Total Milk Production for 2023
SELECT SUM(Value) AS total_milk_production_2023
FROM milk_production
WHERE Year = 2023;

-- Average Honey Production for 2022
SELECT AVG(Value) AS avg_honey_production_2022
FROM honey_production
WHERE Year = 2022;

-- ANSI for Florida
SELECT State, State_ANSI
FROM state_lookup
WHERE State = 'FLORIDA';

-- Highest Yogurt Production in 2021
SELECT MAX(Value) AS highest_yogurt_2021
FROM yogurt_production
WHERE Year = 2021;

-- Total yogurt production for states that also produced cheese in 2022
SELECT SUM(y.Value) AS total_yogurt_2022
FROM yogurt_production y
WHERE y.Year = 2022
  AND y.State_ANSI IN (
      SELECT DISTINCT c.State_ANSI
      FROM cheese_production c
      WHERE c.Year = 2022
  );

-- Which states had cheese production greater than 100 million in April 2023
SELECT sl.State, cp.Value
FROM cheese_production cp
JOIN state_lookup sl
    ON cp.State_ANSI = sl.State_ANSI
WHERE cp.Year = 2023
  AND cp.Period = 'APR'
  AND cp.Value > 100000000;


-- List all states with their cheese production values, even if they didn't produce any cheese in April of 2023
SELECT s.State, c.Value
FROM state_lookup s
LEFT JOIN cheese_production c 
  ON s.State_ANSI = c.State_ANSI 
  AND c.Year = 2023 
  AND c.Period = 'APR';

-- List all states from state_lookup that are missing from milk_production in 2023
SELECT s.State
FROM state_lookup s
LEFT JOIN milk_production m 
  ON s.State_ANSI = m.State_ANSI AND m.Year = 2023
WHERE m.State_ANSI IS NULL;
