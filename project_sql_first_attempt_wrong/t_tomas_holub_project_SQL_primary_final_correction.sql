CREATE TABLE IF NOT EXISTS t_project_one
SELECT 
	cp.value as 'month_payroll',
	cpib.name as 'work_sector',
	cp.industry_branch_code as 'sector_code',
	cp.payroll_year as 'measure_year',
	e.GDP as 'gdp'
FROM czechia_payroll cp 
JOIN czechia_payroll_industry_branch cpib 
	ON cp.industry_branch_code = cpib.code
JOIN economies e 
	ON cp.payroll_year = e.`year` 
WHERE cp.value IS NOT NULL AND cp.payroll_year >= "2006" AND cp.payroll_year <= "2018" 
AND e.`year` >= "2006" AND cp.payroll_year <= "2018" 
AND e.country = 'Central Europe and the Baltics'; 

CREATE TABLE IF NOT EXISTS t_project_two
SELECT 
	cpc.name AS 'food_kind',
	cpc.price_value AS 'amount',
	cpc.price_unit AS 'weight_sign',
	cp.value AS 'price',
	cp.category_code AS 'food_code',
	cp.date_from AS 'measured_from',
	cp.date_to AS 'measured_to',
	cr.name AS 'measured_where'
FROM czechia_price_category cpc  
JOIN czechia_price cp 
	ON cpc.code  = cp.category_code 
JOIN czechia_region cr 
	ON cp.region_code = cr.code 
WHERE cp.date_from  >= "2006-01-02" AND cp.date_to <= "2018-12-16" ;

ALTER TABLE t_project_one ADD COLUMN `connection` VARCHAR(255);

UPDATE t_project_one
SET `connection` = 1 ;

ALTER TABLE t_project_two ADD COLUMN `connectiontwo` VARCHAR(255);

UPDATE t_project_two 
SET `connectiontwo` = 1 ;

CREATE TABLE IF NOT EXISTS t_tomas_holub_project_SQL_primary_final_correction
SELECT 
	t_project_one.`month_payroll`,
	t_project_one. `work_sector`,
	t_project_one.`sector_code`,
	t_project_one.`measure_year`,
	t_project_one.`gdp`,
	t_project_two.`food_kind`, 
	t_project_two.`amount`,
	t_project_two.`weight_sign`, 
	t_project_two.`price`, 
	t_project_two.`food_code`,
	t_project_two.`measured_from`, 
	t_project_two.`measured_to`, 
	t_project_two.`measured_where`
FROM t_project_one 
JOIN t_project_two  
	ON t_project_one.`connection` = t_project_two.`connectiontwo` ;
	

	