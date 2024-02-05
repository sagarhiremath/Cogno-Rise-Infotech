create database salary;
use salary;
select * from salaries;

-- Assuming a table named 'employee_salaries' with the given column headers

-- Display the first few rows of the dataset
SELECT *
FROM salaries
LIMIT 5;

-- Basic statistics of salary
SELECT
  MIN(salary) AS min_salary,
  MAX(salary) AS max_salary,
  AVG(salary) AS avg_salary,
  COUNT(*) AS total_employees
FROM salaries;

-- Job title distribution
SELECT
  job_title,
  COUNT(*) AS employee_count
FROM salaries
GROUP BY job_title
ORDER BY employee_count DESC;

-- Average salary by job title and experience level
SELECT
  job_title,
  experience_level,
  AVG(salary) AS avg_salary
FROM salaries
GROUP BY job_title, experience_level
ORDER BY job_title, experience_level;

-- Top 5 companies with the highest average salary
SELECT
  company_location,
  AVG(salary) AS avg_salary
FROM salaries
GROUP BY company_location
ORDER BY avg_salary DESC
LIMIT 5;

-- Distribution of employment types
SELECT
  employment_type,
  COUNT(*) AS employee_count
FROM salaries
GROUP BY employment_type
ORDER BY employee_count DESC;

-- Average remote work ratio by company size
SELECT
  company_size,
  AVG(remote_ratio) AS avg_remote_ratio
FROM salaries
GROUP BY company_size
ORDER BY company_size;

-- Employees with the highest salary in each job title
WITH ranked_salaries AS (
  SELECT
    job_title,
    employee_residence,
    salary,
    ROW_NUMBER() OVER (PARTITION BY job_title ORDER BY salary DESC) AS rank_within_job
  FROM salaries
)
SELECT
  job_title,
  employee_residence,
  salary
FROM ranked_salaries
WHERE rank_within_job = 1;

-- Average salary by work year and experience level
SELECT
  work_year,
  experience_level,
  AVG(salary) AS avg_salary
FROM salaries
GROUP BY work_year, experience_level
ORDER BY work_year, experience_level;


