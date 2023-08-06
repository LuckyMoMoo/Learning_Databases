-- Retrieve abbreviations for the states which contain at least 5 counties, 
-- and their population in year 2010 to area ratio 
-- in decreasing order of the aforementioned ratio. 
-- Round the ratio to 2 decimal places.

-- 1.05 marks: < 17 operators
-- 1.0 marks: < 19 operators
-- 0.9 marks: < 21 operators
-- 0.8 marks: correct answer

-- ******************************************
-- 'Try 1'
-- select county, population 
-- from countypopulation 
-- where year = 2010;
-- ******************************************

-- ******************************************
-- 'Try 2'
-- select c.state, round(sum(cp.population)/sum(c.sq_km), 2) as popra 
-- from county c 
-- join (select county, population 
-- 	from countypopulation 
-- 	where year = 2010) as cp 
-- on c.fips = cp.county 
-- group by c.state 
-- having count(*) >= 5;
-- ******************************************


select s.abbr, sp.popra as popPerSqKm 
from state s 
join (select c.state, round(sum(cp.population)/sum(c.sq_km), 2) as popra 
	from county c 
	join (select county, population 
		from countypopulation 
		where year = 2010) as cp 
	on c.fips = cp.county 
	group by c.state 
	having count(*) >= 5) as sp 
on s.id = sp.state 
order by popPerSqKm desc;
