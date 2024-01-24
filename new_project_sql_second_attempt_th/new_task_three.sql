
WITH percentage_table AS ( 
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
    END AS percentual_difference
	FROM new_t_tomas_holub_sql_primary_final ntthspf 
	GROUP BY food_category, price_year
)
SELECT 
	pt.price_year,
	pt.food_category,
	pt.final_avg_price,
	pt.food_code,
	pt.percentual_difference,
	SUM(percentual_difference) OVER (PARTITION BY food_category ORDER BY price_year) AS percentage_growth
FROM percentage_table pt
GROUP BY food_code, price_year
ORDER BY  price_year DESC, percentage_growth
LIMIT 27;


