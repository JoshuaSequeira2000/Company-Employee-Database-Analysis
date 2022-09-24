#Create a visualization that provides a breakdown
#between the male and female employees working in 
#the company each year, starting from 1990.


SELECT 
	YEAR(de.from_date) AS Calender_Year,
    e.gender AS Gender,
    COUNT(e.emp_no) AS Number_Of_Employees
FROM
	t_employees e
JOIN 
	t_dept_emp de ON e.emp_no = de.emp_no
WHERE YEAR(de.from_date) >= '1990'
GROUP BY Calender_Year, e.gender
ORDER BY Calender_YEAR ASC;