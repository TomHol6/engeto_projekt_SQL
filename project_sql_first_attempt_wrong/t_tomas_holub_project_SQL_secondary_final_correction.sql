
CREATE TABLE IF NOT EXISTS t_tomas_holub_project_SQL_secondary_final_correction
 SELECT
	c.country AS "state",
	e.gini AS "gini",
	e.`year` AS "measure_year",
	e.GDP AS "gdp",
	e.population AS "population"
FROM countries c 
JOIN economies e 
	ON c.country = e.country 
WHERE c.continent  = "Europe" AND e.year >= 2006 AND e.year <= 2018 
AND e.gini IS NOT NULL AND e.GDP IS NOT NULL ;

SELECT 
	*
FROM t_tomas_holub_project_sql_secondary_final_correction ;
