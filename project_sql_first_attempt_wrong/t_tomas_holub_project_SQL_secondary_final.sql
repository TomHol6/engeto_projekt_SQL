CREATE TABLE IF NOT EXISTS t_tomas_holub_project_SQL_secondary_final 
 SELECT
	c.country AS "Stát",
	e.gini AS "GINI",
	e.`year` AS "Rok měření",
	e.GDP AS "HDP",
	e.population AS "Populace"
FROM countries c 
JOIN economies e 
	ON c.country = e.country 
WHERE c.continent  = "Europe" AND e.year >= 2006 AND e.year <= 2018 
AND e.gini IS NOT NULL AND e.GDP IS NOT NULL ;

SELECT 
	*
FROM t_tomas_holub_project_sql_secondary_final tthpssf ;

