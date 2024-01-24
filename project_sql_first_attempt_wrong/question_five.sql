SELECT 
	*	
FROM t_tomas_holub_project_sql_secondary_final_correction tthpssfc ;

SELECT 
	*	
FROM table_question_four ;

CREATE TABLE IF NOT EXISTS average_gdp_growth
SELECT
    measure_year,
    AVG(gdp) AS Avg_GDP,
    (AVG(gdp) - LAG(AVG(gdp), 1) OVER (ORDER BY measure_year)) / LAG(AVG(gdp), 1) OVER (ORDER BY measure_year) AS GDP_Growth_Rate
FROM t_tomas_holub_project_sql_secondary_final_correction
WHERE state = 'Czech Republic'
GROUP BY measure_year
ORDER BY measure_year;

SELECT 
	*	
FROM average_gdp_growth agg ;

CREATE TABLE IF NOT EXISTS comparison_question_five
SELECT 
	agg.GDP_Growth_Rate,
	agg.Avg_GDP,
	agg.measure_year,
	tqf.price_growth_percentage,	
	tqf.current_year_food,
	tqf.previous_year_food,
	tqf.food_code,
	tqf.payroll_growth_percentage,
	tqf.current_year_payroll,
	tqf.previous_year_payroll, 
	tqf.sector_code
FROM average_gdp_growth agg
LEFT JOIN table_question_four tqf 
	ON agg.measure_year = tqf.previous_year_food ;

SELECT 
	GDP_Growth_Rate,
	measure_year,
	price_growth_percentage,
	food_code,
	payroll_growth_percentage,
	sector_code
FROM comparison_question_five;


