
WITH price_of_food AS ( 
	SELECT 
		price_year,
		food_category,
		final_avg_price,
		food_amount,
		measure_unit,
		food_code
	FROM new_t_tomas_holub_sql_primary_final ntthspf
	WHERE food_code IN (114201,111301) AND price_year IN (2006, 2018) 
	GROUP BY 
		price_year,
		food_code
),
payroll_first AS ( 
	SELECT 
		payroll_year,
		branch_name,
		final_avg_payroll,
		industry_branch_code
	FROM new_t_tomas_holub_sql_primary_final ntthspf 
	WHERE payroll_year = 2006
	GROUP BY 
		industry_branch_code,
		payroll_year 
	ORDER BY final_avg_payroll DESC 
	LIMIT 1 
),
payroll_last AS (
	SELECT 
		payroll_year,
		branch_name,
		final_avg_payroll,
		industry_branch_code
	FROM new_t_tomas_holub_sql_primary_final ntthspf 
	WHERE payroll_year = 2018
	GROUP BY 
		industry_branch_code,
		payroll_year 
	ORDER BY final_avg_payroll DESC 
	LIMIT 1 
)
SELECT 
	pof.price_year AS measured_year,	
	pof.food_category,
	pof.final_avg_price,
	pof.food_amount,
	pof.measure_unit,
	pf.branch_name,
	pf.final_avg_payroll AS first_max_payroll,
	pl.branch_name,
	pl.final_avg_payroll AS second_max_payroll,
	(pf.final_avg_payroll/16.94 ) AS 2006_max_bread_amount,
	(pf.final_avg_payroll/14.04 ) AS 2006_max_milk_amount,
	(pl.final_avg_payroll/24.31 ) AS 2018_max_bread_amount,
	(pl.final_avg_payroll/19.15 ) AS 2018_max_milk_amount
FROM price_of_food pof
LEFT JOIN payroll_first pf
	ON pof.price_year = pf.payroll_year
LEFT JOIN payroll_last pl
	ON pof.price_year = pl.payroll_year;
