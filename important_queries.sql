/* General search queries */
SELECT -- [...]                 --| 
FROM -- [table]                 --| Static (pi projection + join if necessary)
  JOIN -- [...]                 --| 
  ON -- [...]                   --| 

WHERE --[...]                   -- Dynamic filtering based on search parameters (sigma selection)

ORDER BY -- [...] [ASC | DESC]  --|
OFFSET -- [...]                 --| Dynamic ordering based on search parameters
LIMIT -- [...];                 --|

-- Example: Getting a summary of the first 10 employees who are interns sorted by last name descending
SELECT  employee_id, 
        first_name, 
        m_initial, 
        last_name, 
        job_title, 
        department_name
FROM employee e
	JOIN job j        ON e.job_id = j.job_id
	JOIN department d ON j.department_id = d.department_id
WHERE job_title LIKE '%INTERN%'
ORDER BY last_name DESC
OFFSET 0
LIMIT 10;

/* Getting managers and number of employees managed by manager */
SELECT COUNT(*) AS manages -- , [basic employee information]

FROM employee e
	JOIN employee m   ON e.manager_id = m.employee_id
	JOIN job j        ON m.job_id = j.job_id
	JOIN department d ON j.department_id = d.department_id

GROUP BY -- [basic employee information]
-- [Dynamic filtering based on search parameters]
-- [Dynamic ordering based on search parameters]

-- Example: Getting a summary of the first 10 managers who work in the finance department
SELECT  COUNT(*), 
        m.employee_id,
        m.first_name,
        m.m_initial, 
        m.last_name, 
        job_title, 
        department_name
FROM employee e
	JOIN employee m   ON e.manager_id = m.employee_id
	JOIN job j        ON m.job_id = j.job_id
	JOIN department d ON j.department_id = d.department_id
WHERE department_name LIKE 'FINANCE%'
GROUP BY  m.employee_id, 
          m.first_name, 
          m.m_initial, 
          m.last_name, 
          job_title, 
          department_name
ORDER BY job_title ASC
OFFSET 0
LIMIT 10;

/* Getting department information, including the number of jobs and employees in the department */
SELECT  COUNT(DISTINCT j.job_id) AS job_count,
        COUNT(DISTINCT e.employee_id) AS employee_count,
        d.department_id,
        department_name,
        creation_date,
        department_head_id,
        h.first_name,
        h.m_initial,
        h.last_name
FROM department d
	JOIN job j      ON j.department_id = d.department_id    
	JOIN employee e ON e.job_id = j.job_id                  
	JOIN employee h ON h.employee_id = d.department_head_id 
GROUP BY  d.department_id,
          department_name,
          creation_date,
          department_head_id,
          h.first_name,
          h.m_initial,
          h.last_name
ORDER BY department_id ASC
OFFSET 0
LIMIT 10;

/* Create a new payroll entry for employee 1000000 who worked for 360 hours in the month of November 1979 with a 10% tax rate*/
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

INSERT INTO payroll (employee_id, hours_worked, pay_period, tax_rate, gross_income, taxed_income, net_income)
SELECT  employee_id,
        hours_worked,
        pay_period,
        tax_rate,
        gross_income,
        gross_income * tax_rate       AS taxed_income,
        gross_income * (1 - tax_rate) AS net_income
FROM (
	SELECT  e.employee_id, 
          '360'::INT          AS hours_worked, 
          '1979-11-01'::DATE  AS pay_period, 
          '0.1'::REAL         AS tax_rate,
		      CASE
		      	WHEN '360'::INT <= 4.4 * weekly_hours THEN '360'::INT * hourly_wage   -- No overtime
		      	ELSE (1.5 * '360'::INT - 0.5 * 4.4 * weekly_hours) * hourly_wage      -- 50% more pay for overtime hours 
		      END gross_income
	FROM employee e
		JOIN job j    ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
	  AND e.employee_id = '1000000'
) AS gross_calc;

COMMIT;
END TRANSACTION;

/* Create a payroll entry for every assigned employee for December with 15% tax rate, assuming every employee worked their required hours*/
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

INSERT INTO payroll (pay_period, tax_rate, gross_income, taxed_income, net_income, hours_worked, employee_id)
SELECT  pay_period,
        tax_rate,
        gross_income,
        gross_income * tax_rate       AS taxed_income,
        gross_income * (1 - tax_rate) AS net_income,
        hours_worked,
        employee_id
FROM (
	SELECT  e.employee_id, 
          (4.4 * weekly_hours)::real                AS hours_worked, 
          '2021-12-01'::DATE                        AS pay_period, 
          '0.15'::REAL                              AS tax_rate, 
          (4.4 * weekly_hours)::real * hourly_wage  AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;

COMMIT;
END TRANSACTION;

