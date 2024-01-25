WITH year_percentage AS ( 
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
year_percentage_sum AS ( 
	SELECT 
		yp.price_year AS measured_year,
    	yp.food_category AS category,
    	yp.final_avg_price AS avg_value,
    	yp.food_code AS code,
    	yp.perc_growth,
    CASE 
    	WHEN food_code BETWEEN 'A' AND 'S' THEN 'X'
    ELSE 'Y'
    END AS 'category_sign'
	FROM year_percentage yp 
)
SELECT
	measured_year,
	category,
	avg_value,
	code,
	perc_growth,
	category_sign,
	CASE 
        WHEN category_sign = 'Y' AND MAX(perc_growth) - LAG(MAX(perc_growth)) OVER (ORDER BY measured_year) > 0.1 
             AND MAX(perc_growth) - LAG(MAX(perc_growth)) OVER (ORDER BY measured_year) > 0.1
        THEN 'yes'
        ELSE 'no'
    END AS significant_growth
FROM year_percentage_sum
GROUP BY  measured_year, category 
ORDER BY significant_growth DESC,  measured_year   
LIMIT 147;