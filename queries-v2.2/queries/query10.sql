-- Retrieve the abbreviations of states containing at least 5 counties
-- and their ratio of snow per square megameter.
-- Order by area. 
-- Use ROUND() to round the result to 2 decimal places, eg., ROUND(1.2345, 2) = 1.23. 
-- (1 sq kilometer = 0.000001 sq megameter)

-- 1.05 marks: < 7 operators
-- 1.0 marks: < 8 operators
-- 0.8 marks: correct answer

-- ******************************************
-- 'Try 1'
-- select (sum(c.snow)/sum(c.sq_km)*1000000) as snowRa 
-- from county c 
-- group by c.state 
-- having c.state = 8;
-- ******************************************

select s.abbr, round(sum(c.snow)/ sum(c.sq_km)* 1000000, 2) as snowAreaRatio 
from state s 
join county c 
on s.id = c.state 
group by c.state 
having count(c.fips)>= 5 
order by sum(c.sq_km);
