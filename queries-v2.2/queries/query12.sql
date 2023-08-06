-- Retrieve the top 5 industries 
-- in a decreasing order by number of employees, 
-- together with the corresponding number of employments 
-- and the average payroll. 

-- 1.05 marks: < 12 operators
-- 1.0 marks: < 14 operators
-- 0.8 marks: correct answer

-- ******************************************
-- 'Try 1'
-- select i.name, sum(ci.employees) as totalEmployees, avg(ci.payroll) as avgPayroll 
-- from industry i 
-- join countyindustries ci 
-- on i.id = ci.industry 
-- group by i.id 
-- order by totalEmployees desc 
-- limit 5;
-- ******************************************


select i.name, sum(ci.employees) as totalEmployees, avg(ci.payroll) as avgPayroll 
from industry i 
join countyindustries ci 
on i.id = ci.industry 
group by i.id 
order by totalEmployees desc 
limit 5;
