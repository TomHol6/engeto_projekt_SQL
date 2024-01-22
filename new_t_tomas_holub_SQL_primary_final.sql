
CREATE TABLE IF NOT EXISTS new_t_tomas_holub_SQL_primary_final
WITH table_price AS ( 
	SELECT 
		value AS price_value,
		category_code AS food_code,
		AVG(value) OVER (PARTITION BY price_year, food_code) AS final_avg_price,
	CASE
		WHEN date_to LIKE '%2006%' THEN 2006
		WHEN date_to LIKE '%2007%' THEN 2007
		WHEN date_to LIKE '%2008%' THEN 2008
		WHEN date_to LIKE '%2009%' THEN 2009
		WHEN date_to LIKE '%2010%' THEN 2010
		WHEN date_to LIKE '%2011%' THEN 2011
		WHEN date_to LIKE '%2012%' THEN 2012
		WHEN date_to LIKE '%2013%' THEN 2013
		WHEN date_to LIKE '%2014%' THEN 2014
		WHEN date_to LIKE '%2015%' THEN 2015
		WHEN date_to LIKE '%2016%' THEN 2016
		WHEN date_to LIKE '%2017%' THEN 2017
		WHEN date_to LIKE '%2018%' THEN 2018
	ELSE NULL 
	END AS price_year
	FROM czechia_price cpr	
	GROUP BY 
		price_year,
		food_code
),
table_payroll AS ( 
	SELECT 
		value AS payroll_value,
		value_type_code,
		unit_code,
		industry_branch_code,
		payroll_year,
		AVG(value) OVER (PARTITION BY payroll_year, industry_branch_code) AS final_avg_payroll
	FROM czechia_payroll cp	
	WHERE payroll_year BETWEEN '2006' AND '2018' AND unit_code = 200
	AND industry_branch_code IS NOT NULL
	GROUP BY 
	payroll_year,
	industry_branch_code 
),
table_industry AS ( 
	SELECT 
		code AS industry_code,
		name AS branch_name
	FROM czechia_payroll_industry_branch cpib
),
table_food AS ( 
	SELECT 
		code,
		name AS food_category,
		price_value AS food_amount,
		price_unit AS measure_unit
	FROM czechia_price_category cpc
)
SELECT 
	tp.price_year,
	tf.food_category,
	tp.final_avg_price,
	tf.food_amount,
	tf.measure_unit,
	tp.food_code,
	tpa.payroll_year,
	ti.branch_name,
	tpa.final_avg_payroll,
	tpa.industry_branch_code,
	tpa.unit_code
FROM table_price AS tp
JOIN table_payroll AS tpa
	ON tp.price_year = tpa.payroll_year 
JOIN table_industry AS ti 
	ON tpa.industry_branch_code = ti.industry_code
JOIN table_food AS tf 
	ON tp.food_code = tf.code;
	




	