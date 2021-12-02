/* 12/2/2021, 11:49:04 AM */
-- Get employee summary
SELECT employee_id,first_name,m_initial,last_name,job_title,department_name
FROM employee e
	JOIN job j
	ON e.job_id = j.job_id
	JOIN department d
	ON j.department_id = d.department_id
ORDER BY last_name ASC
OFFSET 0
LIMIT 10;

/* 12/2/2021, 11:49:14 AM */
-- Get departments
SELECT COUNT(DISTINCT j.job_id) AS job_count,COUNT(DISTINCT e.employee_id) AS employee_count,d.department_id,department_name,creation_date,department_head_id,h.first_name,h.m_initial,h.last_name
FROM department d
	LEFT JOIN job j
	ON j.department_id = d.department_id
	LEFT JOIN employee e
	ON e.job_id = j.job_id
	LEFT JOIN employee h
	ON h.employee_id = d.department_head_id
GROUP BY d.department_id,department_name,creation_date,department_head_id,h.first_name,h.m_initial,h.last_name
ORDER BY department_id ASC
OFFSET 0
LIMIT 10;

