#Create an SQL stored procedure that will 
#allow you to obtain the average male and female
#salary per department within a certain salary 
#range. Let this range be defined by two values 
#the user can insert when calling the procedure.

DELIMITER $$
CREATE PROCEDURE salary(IN P_salary_1 INT,
							IN P_salary_2 INT)
BEGIN
SELECT
	e.gender AS Gender, AVG(s.salary) AS Salary,
    d.dept_name AS Department_Name
FROM
	t_employees e
JOIN
	t_salaries s ON e.emp_no = s.emp_no
JOIN
	t_dept_emp de ON s.emp_no = de.emp_no
JOIN
	t_departments d ON de.dept_no = d.dept_no
WHERE
	s.salary BETWEEN P_salary_1 AND P_salary_2
GROUP BY d.dept_no, e.gender;

END $$

DELIMITER ;