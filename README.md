# sql-data-validation-ucdavis
SQLite project analyzing food production data (UC Davis SQL for Data Science course

# SQL Data Validation Project – UC Davis (SQLite & DBeaver)

This project was completed as part of the **UC Davis “SQL for Data Science” course** on Coursera.  
It demonstrates SQL skills for data validation and analysis using multiple production datasets.

## 📂 Datasets
- cheese_production.csv  
- coffee_production.csv  
- yogurt_production.csv  
- honey_production.csv  
- egg_production.csv  
- milk_production.csv  
- state_lookup.csv  

## 🧠 Skills Practiced
- Creating and loading tables in SQLite using DBeaver  
- Querying data with `SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`, `JOIN`, and `LEFT JOIN`  
- Using aggregate functions (`SUM`, `AVG`) for state-level production analysis  
- Filtering conditions — e.g., retrieving 2023 cheese data only for states with coffee production > 1,000,000  

## 🧾 Example Query
```sql
SELECT s.state_name, c.year, c.value AS cheese_production
FROM cheese_production c
JOIN coffee_production cf
  ON c.state = cf.state AND c.year = cf.year
WHERE c.year = 2023 AND cf.value > 1000000
ORDER BY c.state;
