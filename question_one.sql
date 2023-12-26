CREATE TABLE IF NOT EXISTS question_one
SELECT 
	avg (month_payroll) AS average_payroll,
	work_sector,
	sector_code,
	measure_year 
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE sector_code IN ('A')
AND measure_year in (2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018) 
GROUP BY measure_year ;

INSERT INTO question_one
SELECT 
	avg (month_payroll) AS average_payroll,
	work_sector,
	sector_code,
	measure_year 
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE sector_code IN ('B')
AND measure_year in (2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018) 
GROUP BY measure_year ;

INSERT INTO question_one
SELECT 
	avg (month_payroll) AS average_payroll,
	work_sector,
	sector_code,
	measure_year 
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE sector_code IN ('C')
AND measure_year in (2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018) 
GROUP BY measure_year ;

INSERT INTO question_one
SELECT 
	avg (month_payroll) AS average_payroll,
	work_sector,
	sector_code,
	measure_year 
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE sector_code IN ('D')
AND measure_year in (2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018) 
GROUP BY measure_year ;

INSERT INTO question_one
SELECT 
	avg (month_payroll) AS average_payroll,
	work_sector,
	sector_code,
	measure_year 
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE sector_code IN ('E')
AND measure_year in (2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018) 
GROUP BY measure_year ;

INSERT INTO question_one
SELECT 
	avg (month_payroll) AS average_payroll,
	work_sector,
	sector_code,
	measure_year 
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE sector_code IN ('F')
AND measure_year in (2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018) 
GROUP BY measure_year ;

INSERT INTO question_one
SELECT 
	avg (month_payroll) AS average_payroll,
	work_sector,
	sector_code,
	measure_year 
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE sector_code IN ('G')
AND measure_year in (2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018) 
GROUP BY measure_year ;

INSERT INTO question_one
SELECT 
	avg (month_payroll) AS average_payroll,
	work_sector,
	sector_code,
	measure_year 
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE sector_code IN ('H')
AND measure_year in (2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018) 
GROUP BY measure_year ;

INSERT INTO question_one
SELECT 
	avg (month_payroll) AS average_payroll,
	work_sector,
	sector_code,
	measure_year 
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE sector_code IN ('I')
AND measure_year in (2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018) 
GROUP BY measure_year ;

INSERT INTO question_one
SELECT 
	avg (month_payroll) AS average_payroll,
	work_sector,
	sector_code,
	measure_year 
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE sector_code IN ('J')
AND measure_year in (2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018) 
GROUP BY measure_year ;

INSERT INTO question_one
SELECT 
	avg (month_payroll) AS average_payroll,
	work_sector,
	sector_code,
	measure_year 
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE sector_code IN ('K')
AND measure_year in (2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018) 
GROUP BY measure_year ;

INSERT INTO question_one
SELECT 
	avg (month_payroll) AS average_payroll,
	work_sector,
	sector_code,
	measure_year 
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE sector_code IN ('L')
AND measure_year in (2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018) 
GROUP BY measure_year ;

INSERT INTO question_one
SELECT 
	avg (month_payroll) AS average_payroll,
	work_sector,
	sector_code,
	measure_year 
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE sector_code IN ('M')
AND measure_year in (2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018) 
GROUP BY measure_year ;

INSERT INTO question_one
SELECT 
	avg (month_payroll) AS average_payroll,
	work_sector,
	sector_code,
	measure_year 
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE sector_code IN ('N')
AND measure_year in (2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018) 
GROUP BY measure_year ;

INSERT INTO question_one
SELECT 
	avg (month_payroll) AS average_payroll,
	work_sector,
	sector_code,
	measure_year 
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE sector_code IN ('O')
AND measure_year in (2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018) 
GROUP BY measure_year ;

INSERT INTO question_one
SELECT 
	avg (month_payroll) AS average_payroll,
	work_sector,
	sector_code,
	measure_year 
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE sector_code IN ('P')
AND measure_year in (2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018) 
GROUP BY measure_year ;

INSERT INTO question_one
SELECT 
	avg (month_payroll) AS average_payroll,
	work_sector,
	sector_code,
	measure_year 
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE sector_code IN ('Q')
AND measure_year in (2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018) 
GROUP BY measure_year ;

INSERT INTO question_one
SELECT 
	avg (month_payroll) AS average_payroll,
	work_sector,
	sector_code,
	measure_year 
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE sector_code IN ('R')
AND measure_year in (2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018) 
GROUP BY measure_year ;

INSERT INTO question_one
SELECT 
	avg (month_payroll) AS average_payroll,
	work_sector,
	sector_code,
	measure_year 
FROM t_tomas_holub_project_sql_primary_final_correction tthpspfc
WHERE sector_code IN ('S')
AND measure_year in (2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018) 
GROUP BY measure_year ;

SELECT 
    work_sector,
    measure_year,
    average_payroll,
    LAG(average_payroll) OVER (PARTITION BY work_sector ORDER BY measure_year) AS previous_year_payroll,
    CASE
        WHEN LAG(average_payroll) OVER (PARTITION BY work_sector ORDER BY measure_year) IS NULL THEN 'N/A'
        WHEN average_payroll > LAG(average_payroll) OVER (PARTITION BY work_sector ORDER BY measure_year) THEN 'Growing'
        WHEN average_payroll < LAG(average_payroll) OVER (PARTITION BY work_sector ORDER BY measure_year) THEN 'Declining'
        ELSE 'Stable'
    END AS payroll_trend
FROM 
    question_one qo 
ORDER BY 
   work_sector, measure_year;

  

