
CREATE TABLE IF NOT EXISTS new_t_tomas_holub_SQL_secondary_final
WITH table_gdp AS ( 
		SELECT 
			`year`,
			country,
			GDP,
			gini,
		CASE 
			WHEN lower (country) LIKE '%Europe%' THEN 'Europe'
			ELSE 'none'
			END AS continent_dislocation
		FROM economies e 
		WHERE lower (country) LIKE '%Europe%' AND GDP IS NOT NULL AND `year` BETWEEN 2006 AND 2018
		GROUP BY `year`
),
table_population AS ( 
		SELECT 
			continent,
			country,
			population
		FROM countries c
		WHERE continent = 'Europe'
)
SELECT 
	tg.`year`,
	tg.country AS region,
	tg.GDP,
	tg.gini,
	tp.continent,
	tp.country,
	tp.population AS country_population	
FROM table_gdp AS tg
JOIN table_population AS tp
	ON tg.continent_dislocation = tp.continent ; 

