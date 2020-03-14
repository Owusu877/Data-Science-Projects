
1. Which of our 10 employees have been with us the longest.

-- which 10 employees has been employed the longest.
select first_name, last_name, sysdates, hire_date, period_of_time
from
(
select first_name,last_name, to_char(sysdate,'DD-MON-YYYY') as sysdates,
to_char(hire_date,'DD-MON-YYYY') as hire_date,
round((sysdate - hire_date) / 365) || ' ' || 'Years' as period_of_time
from hr.employees
order by period_of_time desc
)
where rownum <= 10

2
Looking at the countries where we have customers, how many customers
are there in each country.

-- how many of our customers are in each country in our data base
select nls_territory, count(*) as num_of_customers
from oe.customers
group by nls_territory
order by num_of_customers desc



3
-- whats the number of employees in each department
select distinct count(*) as number_of_employees, job_title
from
(select first_name, last_name, job_title
from hr.employees emp
join hr.jobs jo
on emp.job_id = jo.job_id)
group by job_title
