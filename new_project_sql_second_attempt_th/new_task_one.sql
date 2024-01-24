
SELECT 
    payroll_year,
    branch_name,
    final_avg_payroll
FROM new_t_tomas_holub_sql_primary_final
WHERE industry_branch_code IN 
('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S')
GROUP BY 
	branch_name, 
	payroll_year;



