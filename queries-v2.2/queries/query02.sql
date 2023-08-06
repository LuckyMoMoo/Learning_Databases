-- Retrieve the list of states (showing both the id and abbreviation) 
-- and their corresponding total area, 
-- not accounting for the counties that have more than 10000 population in the year of 2010, 
-- sorted by area in descending order.

-- 1.05 marks: < 11 operators
-- 1.0 marks: < 13 operators
-- 0.8 marks: correct answer

-- ******************************************
-- 'Try 1'
-- select c.state, sum(cp.population) 
-- from county c 
-- join countypopulation cp 
-- on c.fips = cp.county and cp.year = 2010 and cp.population < 10000 
-- group by c.state;
-- ******************************************

select s.id, s.abbr, sum(c.sq_km) as area 
from state s 
join county c 
on s.id = c.state 
join countypopulation cp 
on c.fips = cp.county and cp.year = 2010 and cp.population < 10000 
group by s.id 
order by area desc;
