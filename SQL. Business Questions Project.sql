
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
Based on the highest sales in the month of the most recent year,
what has the trend been for that month over the past years ? 

-- monthly sales for the year on 2001 only
select CALENDAR_MONTH_DESC, to_char(dollars,'L999G999G999G999') as dollars
from sh.CAL_MONTH_SALES_MV
where CALENDAR_MONTH_DESC like '%2001%'
order by dollars desc

-- the partenr of sales for december every year
select CALENDAR_MONTH_DESC, to_char(dollars,'L999G999G999G999') as dollars
from sh.CAL_MONTH_SALES_MV
where CALENDAR_MONTH_DESC like '%12%'
order by dollars desc
