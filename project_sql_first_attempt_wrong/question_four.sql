SELECT 
	*
FROM question_four 
;

SELECT 
	*	
FROM question_one qo;

SELECT 
	*	
FROM question_three qo;

CREATE TABLE IF NOT EXISTS preparation_one
SELECT 
	average_payroll,
	measure_year,
	sector_code 
FROM question_one qo 

CREATE TABLE IF NOT EXISTS preparation_two
SELECT 
	average_price,
	measured_to,
	food_code
FROM question_three qo;

UPDATE preparation_one 
SET `connection` = 1 ;

ALTER TABLE preparation_two ADD COLUMN `connection` VARCHAR(20);

UPDATE preparation_two  
SET `connection` = 1 ;

ALTER TABLE preparation_two ADD COLUMN food_year VARCHAR(20);

UPDATE preparation_two
SET food_year = 
CASE 
        WHEN measured_to = '2006-10-29 00:00:00.000' THEN '2006'
        WHEN measured_to = '2006-11-05 00:00:00.000' THEN '2006'
        WHEN measured_to = '2006-11-12 00:00:00.000' THEN '2006'
        WHEN measured_to = '2006-11-26 00:00:00.000' THEN '2006'
        WHEN measured_to = '2006-12-24 00:00:00.000' THEN '2006'
        WHEN measured_to = '2007-10-21 00:00:00.000' THEN '2007'
        WHEN measured_to = '2007-10-28 00:00:00.000' THEN '2007'
        WHEN measured_to = '2007-11-04 00:00:00.000' THEN '2007'
        WHEN measured_to = '2007-11-11 00:00:00.000' THEN '2007'
        WHEN measured_to = '2007-11-18 00:00:00.000' THEN '2007'
        WHEN measured_to = '2007-12-23 00:00:00.000' THEN '2007'        
        WHEN measured_to = '2008-07-20 00:00:00.000' THEN '2008'
        WHEN measured_to = '2008-07-27 00:00:00.000' THEN '2008'
        WHEN measured_to = '2008-08-03 00:00:00.000' THEN '2008'
        WHEN measured_to = '2008-08-10 00:00:00.000' THEN '2008'
        WHEN measured_to = '2008-08-17 00:00:00.000' THEN '2008'
        WHEN measured_to = '2008-12-07 00:00:00.000' THEN '2008'        
        WHEN measured_to = '2009-10-25 00:00:00.000' THEN '2009'
        WHEN measured_to = '2009-11-08 00:00:00.000' THEN '2009'
        WHEN measured_to = '2009-11-22 00:00:00.000' THEN '2009'
        WHEN measured_to = '2009-12-06 00:00:00.000' THEN '2009'
        WHEN measured_to = '2009-12-20 00:00:00.0000' THEN '2009'        
        WHEN measured_to = '2010-08-08 00:00:00.000' THEN '2010'
        WHEN measured_to = '2010-10-24 00:00:00.000' THEN '2010'
        WHEN measured_to = '2010-11-07 00:00:00.000' THEN '2010'
        WHEN measured_to = '2010-11-21 00:00:00.000' THEN '2010'
        WHEN measured_to = '2010-12-12 00:00:00.000' THEN '2010'        
        WHEN measured_to = '2011-11-13 00:00:00.000' THEN '2011'
        WHEN measured_to = '2011-12-18 00:00:00.000' THEN '2011'        
        WHEN measured_to = '2012-01-15 00:00:00.000' THEN '2012'
        WHEN measured_to = '2012-02-19 00:00:00.000' THEN '2012'
        WHEN measured_to = '2012-03-18 00:00:00.000' THEN '2012'
        WHEN measured_to = '2012-12-16 00:00:00.000' THEN '2012'        
        WHEN measured_to = '2013-05-19 00:00:00.000' THEN '2013'
        WHEN measured_to = '2013-10-20 00:00:00.000' THEN '2013'
        WHEN measured_to = '2013-11-17 00:00:00.000' THEN '2013'
        WHEN measured_to = '2013-12-15 00:00:00.000' THEN '2013'        
        WHEN measured_to = '2014-03-16 00:00:00.000' THEN '2014'
        WHEN measured_to = '2014-04-20 00:00:00.000' THEN '2014'
        WHEN measured_to = '2014-05-18 00:00:00.000' THEN '2014'
        WHEN measured_to = '2014-07-20 00:00:00.000' THEN '2014'
        WHEN measured_to = '2014-12-14 00:00:00.000' THEN '2014'        
        WHEN measured_to = '2015-10-18 00:00:00.000' THEN '2015'
        WHEN measured_to = '2015-11-15 00:00:00.000' THEN '2015'
        WHEN measured_to = '2015-12-20 00:00:00.000' THEN '2015'        
        WHEN measured_to = '2016-08-14 00:00:00.000' THEN '2016'
        WHEN measured_to = '2016-09-18 00:00:00.000' THEN '2016'
        WHEN measured_to = '2016-12-18 00:00:00.000' THEN '2016'        
        WHEN measured_to = '2017-09-17 00:00:00.000' THEN '2017'
        WHEN measured_to = '2017-10-15 00:00:00.000' THEN '2017'
        WHEN measured_to = '2017-11-19 00:00:00.000' THEN '2017'
        WHEN measured_to = '2017-12-17 00:00:00.000' THEN '2017'      
        WHEN measured_to = '2018-01-21 00:00:00.000' THEN '2018'
        WHEN measured_to = '2018-12-16 00:00:00.000' THEN '2018'       
                ELSE 'none'
    END;
    
   
SELECT 
	*	
FROM preparation_one po;

SELECT 
	*	
FROM preparation_two pt ;


SELECT
    curr.food_year AS current_year,
    prev.food_year AS previous_year,
    ((curr.average_price - prev.average_price) / prev.average_price) * 100 AS price_growth_percentage
FROM (
    SELECT
        food_year,
        average_price,
        ROW_NUMBER() OVER (ORDER BY food_year) AS row_num
    FROM preparation_two
) curr
JOIN (
    SELECT
        food_year,
        average_price,
        ROW_NUMBER() OVER (ORDER BY food_year) AS row_num
    FROM preparation_two
) prev ON curr.row_num = prev.row_num + 1
ORDER BY curr.food_year;


CREATE TABLE food_price_growth AS
SELECT
    curr.food_code,
    curr.food_year AS current_year,
    prev.food_year AS previous_year,
    ((curr.average_price - prev.average_price) / prev.average_price) * 100 AS price_growth_percentage
FROM (
    SELECT
        food_code,
        food_year,
        average_price,
        ROW_NUMBER() OVER (PARTITION BY food_code ORDER BY food_year) AS row_num
    FROM preparation_two
) curr
JOIN (
    SELECT
        food_code,
        food_year,
        average_price,
        ROW_NUMBER() OVER (PARTITION BY food_code ORDER BY food_year) AS row_num
    FROM preparation_two
) prev ON curr.food_code = prev.food_code AND curr.row_num = prev.row_num + 1
ORDER BY curr.food_code, curr.food_year;

SELECT 
 	*
FROM food_price_growth
order by price_growth_percentage DESC;
 
SELECT 
	*	
FROM preparation_one po;

CREATE TABLE average_payroll_growth AS
SELECT
	curr.sector_code,
	curr.measure_year AS current_year,
	prev.measure_year AS previous_year,
	((curr.average_payroll - prev.average_payroll) / prev.average_payroll) * 100 AS payroll_growth_percentage
FROM
	(
	SELECT
		sector_code,
		measure_year,
		average_payroll,
		ROW_NUMBER() OVER (PARTITION BY sector_code
	ORDER BY
		measure_year) AS row_num
	FROM
		preparation_one po 
) curr
JOIN (
	SELECT
		sector_code,
		measure_year,
		average_payroll,
		ROW_NUMBER() OVER (PARTITION BY sector_code
	ORDER BY
		measure_year) AS row_num
	FROM
		preparation_one
) prev ON
	curr.sector_code = prev.sector_code
	AND curr.row_num = prev.row_num + 1
ORDER BY
	curr.sector_code,
	curr.measure_year;
	
SELECT 
	*	
FROM average_payroll_growth
order by  previous_year ;

SELECT 
 	*
FROM food_price_growth
order by price_growth_percentage DESC;

CREATE TABLE IF NOT EXISTS table_question_four
SELECT 
	 fpg.food_code,
	 fpg.current_year as current_year_food ,
	 fpg.previous_year as previous_year_food,
	 fpg.price_growth_percentage,
	 apg.sector_code,
	 apg.current_year as current_year_payroll,
	 apg.previous_year as previous_year_payroll,
	 apg.payroll_growth_percentage
FROM food_price_growth fpg
LEFT JOIN average_payroll_growth apg 
	ON fpg.current_year = apg.current_year; 

SELECT
	food_code,
	current_year_food,
	price_growth_percentage,
	sector_code,
	current_year_payroll,
	payroll_growth_percentage,
CASE WHEN (price_growth_percentage - payroll_growth_percentage) > 10 then 'yes' 
	ELSE 'no'
	END AS 'significant_growth'
FROM table_question_four
ORDER BY significant_growth DESC;
