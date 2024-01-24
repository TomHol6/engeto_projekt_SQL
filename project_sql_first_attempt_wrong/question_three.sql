


CREATE TABLE IF NOT EXISTS question_three
SELECT 
	avg (price) AS average_price,
	amount,
	weight_sign,
	food_kind,
	food_code, 
	measured_from,
	measured_to
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE measured_to LIKE '%2006%' 
GROUP BY food_code ;

INSERT INTO question_three
SELECT 
	avg (price) AS average_price,
	amount,
	weight_sign,
	food_kind,
	food_code, 
	measured_from,
	measured_to
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE measured_to LIKE '%2007%' 
GROUP BY food_code ;

INSERT INTO question_three
SELECT 
	avg (price) AS average_price,
	amount,
	weight_sign,
	food_kind,
	food_code, 
	measured_from,
	measured_to
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE measured_to LIKE '%2008%' 
GROUP BY food_code ;

INSERT INTO question_three
SELECT 
	avg (price) AS average_price,
	amount,
	weight_sign,
	food_kind,
	food_code, 
	measured_from,
	measured_to
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE measured_to LIKE '%2009%' 
GROUP BY food_code ;

INSERT INTO question_three
SELECT 
	avg (price) AS average_price,
	amount,
	weight_sign,
	food_kind,
	food_code, 
	measured_from,
	measured_to
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE measured_to LIKE '%2010%' 
GROUP BY food_code ;

INSERT INTO question_three
SELECT 
	avg (price) AS average_price,
	amount,
	weight_sign,
	food_kind,
	food_code, 
	measured_from,
	measured_to
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE measured_to LIKE '%2011%' 
GROUP BY food_code ;

INSERT INTO question_three
SELECT 
	avg (price) as average_price,
	amount,
	weight_sign,
	food_kind,
	food_code, 
	measured_from,
	measured_to
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE measured_to LIKE '%2012%'
GROUP BY food_code ;

INSERT INTO question_three
SELECT 
	avg (price) as average_price,
	amount,
	weight_sign,
	food_kind,
	food_code, 
	measured_from,
	measured_to
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE measured_to LIKE '%2013%'
GROUP BY food_code ;

INSERT INTO question_three
SELECT 
	avg (price) as average_price,
	amount,
	weight_sign,
	food_kind,
	food_code, 
	measured_from,
	measured_to
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE measured_to LIKE '%2014%'
GROUP BY food_code ;

INSERT INTO question_three
SELECT 
	avg (price) as average_price,
	amount,
	weight_sign,
	food_kind,
	food_code, 
	measured_from,
	measured_to
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE measured_to LIKE '%2015%'
GROUP BY food_code ;

INSERT INTO question_three
SELECT 
	avg (price) as average_price,
	amount,
	weight_sign,
	food_kind,
	food_code, 
	measured_from,
	measured_to
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE measured_to LIKE '%2016%'
GROUP BY food_code ;

INSERT INTO question_three
SELECT 
	avg (price) as average_price,
	amount,
	weight_sign,
	food_kind,
	food_code, 
	measured_from,
	measured_to
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE measured_to LIKE '%2017%'
GROUP BY food_code ;

INSERT INTO question_three
SELECT 
	avg (price) as average_price,
	amount,
	weight_sign,
	food_kind,
	food_code, 
	measured_from,
	measured_to
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE measured_to LIKE '%2018%'
GROUP BY food_code ;


SELECT 
    food_kind,
    MIN(average_price) AS lowest_average_price,
    ROUND(((MAX(average_price) - MIN(average_price)) / MIN(average_price)) * 100, 2) AS percentual_growth
FROM 
    question_three
GROUP BY 
    food_kind
ORDER BY 
    percentual_growth ;

