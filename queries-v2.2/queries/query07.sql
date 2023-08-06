-- Retrieve counties that have the life expectancy more than the average value of all life expectancies, 
-- and also have the average income less than the avaerge of all average incomes, 
-- order by county names alphabetically, then by life expectancy increasingly.

-- 1.05 marks: < 11 operators
-- 1.0 marks: < 13 operators
-- 0.8 marks: correct answer

-- ******************************************
-- Info: avg_life_exp = 77.75066204301724
-- 		 avg_avg_inc  = 44188.3447
-- ******************************************

select c.name, c.life_expectancy , c.avg_income 
from county c 
where c.life_expectancy > (select avg(life_expectancy) from county) 
	and c.avg_income < (select avg(avg_income) from county) 
order by c.name, c.life_expectancy;
