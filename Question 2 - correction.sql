-- Amount of bread in the first season­--

SELECT 
	month_payroll,
	measure_year,
	food_kind,
	price,
	measured_from,
	measured_to,
	month_payroll/price AS 'amount of bread'
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc 
WHERE  food_code = (111301) AND measure_year= '2016' 
AND measured_from = '2006-01-02 00:00:00.000' AND  measured_to = '2006-01-08 00:00:00.000'
ORDER BY `amount of bread` desc; 

-- Amount of milk in the first season­--

SELECT 
	month_payroll,
	measure_year,
	food_kind,
	price,
	measured_from,
	measured_to,
	month_payroll/price AS 'amount of milk'
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc  
WHERE  food_code = (114201) AND measure_year= '2016' 
AND measured_from = '2006-01-02 00:00:00.000' AND  measured_to = '2006-01-08 00:00:00.000' 
ORDER BY `amount of milk` DESC; 

-- Amount of bread in the last season­--

SELECT 
	month_payroll,
	measure_year,
	food_kind,
	price,
	measured_from,
	measured_to,
	month_payroll/price AS 'amount of bread'
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc  
WHERE food_code = (111301) AND measure_year = '2018' 
AND measured_from = '2018-12-10 00:00:00.000' AND  measured_to= '2018-12-16 00:00:00.000'
ORDER BY `amount of bread` DESC;

-- Amount of milk in the last season­--

SELECT 
	month_payroll,
	measure_year,
	food_kind,
	price,
	measured_from,
	measured_to,
	month_payroll/price AS 'amount of milk'
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc  
WHERE  food_code = (114201) AND measure_year = '2018' 
AND measured_from = '2018-12-10 00:00:00.000' AND  measured_to = '2018-12-16 00:00:00.000'
ORDER BY `amount of milk` DESC;

