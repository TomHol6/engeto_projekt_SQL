WITH food_and_payroll AS ( 
	SELECT 
    	price_year,
    	food_category,
    	final_avg_price,
    	food_code,
    	LAG(final_avg_price) OVER (PARTITION BY food_category ORDER BY price_year) AS prev_year_price,
    CASE 
        WHEN LAG(final_avg_price) OVER (PARTITION BY food_category ORDER BY price_year) IS NOT NULL 
        THEN ROUND(((final_avg_price - LAG(final_avg_price) OVER (PARTITION BY food_category ORDER BY price_year)) / LAG(final_avg_price) OVER (PARTITION BY food_category ORDER BY price_year)) * 100, 2)
        ELSE NULL
    END AS perc_growth
	FROM new_t_tomas_holub_sql_primary_final ntthspf 
	GROUP BY food_category, price_year
UNION ALL 
SELECT 
    	price_year,
    	branch_name,
    	final_avg_payroll,
    	industry_branch_code,
    	LAG(final_avg_payroll) OVER (PARTITION BY branch_name ORDER BY price_year) AS prev_year_payroll,
    CASE 
        WHEN LAG(final_avg_payroll) OVER (PARTITION BY branch_name ORDER BY price_year) IS NOT NULL 
        THEN ROUND(((final_avg_payroll - LAG(final_avg_payroll) OVER (PARTITION BY branch_name ORDER BY price_year)) / LAG(final_avg_payroll) OVER (PARTITION BY branch_name ORDER BY price_year)) * 100, 2)
        ELSE NULL
    END AS perc_growth
	FROM new_t_tomas_holub_sql_primary_final ntthspf 
	GROUP BY branch_name, price_year 
),
czech_gdp AS ( 
	SELECT 
		`year` AS gdp_year,
    	GDP AS gdp,
    	country 
	FROM new_t_tomas_holub_sql_secondary_final ntthssf 
	WHERE lower (country) LIKE '%Czech Republic%'
)
SELECT
	fap.price_year AS measured_year,
    fap.food_category AS category,
    fap.food_code AS code,
    fap.final_avg_price AS avg_value,
    fap.perc_growth,
    cg.gdp_year,
    cg.gdp,
    cg.country,
  	(AVG(gdp) - LAG(AVG(gdp), 1) OVER (ORDER BY gdp_year)) / LAG(AVG(gdp), 1) OVER (ORDER BY gdp_year) AS gdp_growth
FROM food_and_payroll fap
JOIN czech_gdp cg
	ON fap.price_year = cg.gdp_year	
GROUP BY  measured_year, category 
ORDER BY gdp_growth DESC ;

