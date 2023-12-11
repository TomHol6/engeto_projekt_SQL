
-- Množství chleba v prvním porovnatelném období--

SELECT 
	`Průměrná měsíční mzda`,
	`Rok měření mezd`,
	`Druh potraviny`,
	`Cena v KČ`,
	`Měřeno od`,
	`Měřeno do`,
	`Průměrná měsíční mzda`/`Cena v KČ` AS 'Množství chleba v kg'
FROM t_tomas_holub_project_sql_primary_final tthpspf 
WHERE  `Druh potraviny` LIKE '%Chléb%' AND `Rok měření mezd`= '2016' 
AND `Měřeno od` = '2006-01-02 00:00:00.000' AND  `Měřeno do`= '2006-01-08 00:00:00.000'
ORDER BY `Množství chleba v kg` DESC; 

-- Množství mléka v prvním porovnatelném období--

SELECT 
	`Průměrná měsíční mzda`,
	`Rok měření mezd`,
	`Druh potraviny`,
	`Cena v KČ`,
	`Měřeno od`,
	`Měřeno do`,
	`Průměrná měsíční mzda`/`Cena v KČ` AS 'Množství mléka v l'
FROM t_tomas_holub_project_sql_primary_final tthpspf 
WHERE  `Druh potraviny` LIKE '%Mléko%' AND `Rok měření mezd`= '2016' 
AND `Měřeno od` = '2006-01-02 00:00:00.000' AND  `Měřeno do`= '2006-01-08 00:00:00.000' 
ORDER BY `Množství mléka v l` DESC; 

-- Množství chleba v posledním porovnatelném období--

SELECT 
	`Průměrná měsíční mzda`,
	`Rok měření mezd`,
	`Druh potraviny`,
	`Cena v KČ`,
	`Měřeno od`,
	`Měřeno do`,
	`Průměrná měsíční mzda`/`Cena v KČ` AS 'Množství chleba v kg'
FROM t_tomas_holub_project_sql_primary_final tthpspf 
WHERE  `Druh potraviny` LIKE '%Chléb%' AND `Rok měření mezd`= '2018' 
AND `Měřeno od` = '2018-12-10 00:00:00.000' AND  `Měřeno do`= '2018-12-16 00:00:00.000'
ORDER BY `Množství chleba v kg` DESC;

-- Množství mléka v posledním porovnatelném období--

SELECT 
	`Průměrná měsíční mzda`,
	`Rok měření mezd`,
	`Druh potraviny`,
	`Cena v KČ`,
	`Měřeno od`,
	`Měřeno do`,
	`Průměrná měsíční mzda`/`Cena v KČ` AS 'Množství mléka v l'
FROM t_tomas_holub_project_sql_primary_final tthpspf 
WHERE  `Druh potraviny` LIKE '%Mléko%' AND `Rok měření mezd`= '2018' 
AND `Měřeno od` = '2018-12-10 00:00:00.000' AND  `Měřeno do`= '2018-12-16 00:00:00.000'
ORDER BY `Množství mléka v l` DESC;

