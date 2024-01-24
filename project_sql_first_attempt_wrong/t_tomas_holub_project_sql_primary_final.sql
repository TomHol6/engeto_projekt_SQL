CREATE TABLE IF NOT EXISTS t_project_base_1
SELECT 
	cp.value as 'Průměrná měsíční mzda',
	cpib.name as 'Odvětví',
	cp.payroll_year as 'Rok měření',
	e.GDP as 'HDP'
FROM czechia_payroll cp 
JOIN czechia_payroll_industry_branch cpib 
	ON cp.industry_branch_code = cpib.code
JOIN economies e 
	ON cp.payroll_year = e.`year` 
WHERE cp.value IS NOT NULL AND cp.payroll_year >= "2006" AND cp.payroll_year <= "2018" 
AND e.`year` >= "2006" AND cp.payroll_year <= "2018" 
AND e.country = 'Central Europe and the Baltics'; 

CREATE TABLE IF NOT EXISTS t_project_base_2
SELECT 
	cpc.name AS 'Druh potraviny',
	cpc.price_value AS 'Množství',
	cpc.price_unit AS 'Váhová jednotka',
	cp.value AS 'Cena v KČ',
	cp.date_from AS 'Měřeno od',
	cp.date_to AS 'Měřeno do',
	cr.name AS 'Místo měření'
FROM czechia_price_category cpc  
JOIN czechia_price cp 
	ON cpc.code  = cp.category_code 
JOIN czechia_region cr 
	ON cp.region_code = cr.code 
WHERE cp.date_from  >= "2006-01-02" AND cp.date_to <= "2018-12-16" ;

ALTER TABLE t_project_base_1 ADD COLUMN `connection` VARCHAR(255);

UPDATE t_project_base_1 
SET `connection` = 1 ;

ALTER TABLE t_project_base_2 ADD COLUMN `connection` VARCHAR(255);

UPDATE t_project_base_2  
SET `connection` = 1 ;

CREATE TABLE IF NOT EXISTS t_tomas_holub_project_SQL_primary_final
SELECT 
	tpb.`Průměrná měsíční mzda` ,
	tpb.`Odvětví`,
	tpb.`Rok měření` AS 'Rok měření mezd', 
	tpb.`HDP`,
	tpb2.`Druh potraviny`, 
	tpb2.`Množství`,
	tpb2.`Váhová jednotka`, 
	tpb2.`Cena v KČ`, 
	tpb2.`Měřeno od`, 
	tpb2.`Měřeno do`, 
	tpb2.`Místo měření` AS 'Místo měření (potraviny)'
FROM t_project_base_1 tpb 
JOIN t_project_base_2 tpb2  
	ON tpb.`connection` = tpb2.`connection` ;
	

SELECT 
	* 
FROM t_tomas_holub_project_sql_primary_final tthpspf  ;


