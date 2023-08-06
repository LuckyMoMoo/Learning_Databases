-- Retrieve the abbreviations of states that have over 150 counties 
-- which have an employment rate of at least 90% for each county in 2008, 
-- ordered by the number of counties in each state in descending order.

-- 1.05 marks: <8 operators
-- 1.0 marks: <10 operators
-- 0.8 marks: correct answer

-- ******************************************
-- 'Try 1'
-- select cls.county, c.state cs 
-- from countylabourstats cls 
-- join county c 
-- on cls.year = 2008 and (cls.employed/cls.labour_force) >= 0.9 and cls.county = c.fips 
-- order by cs;
-- ******************************************

-- ******************************************
-- 'Try 2'
-- select c.state cs, count(cls.county) ccc 
-- from countylabourstats cls 
-- join county c 
-- on cls.year = 2008 and (cls.employed/cls.labour_force) >= 0.9 and cls.county = c.fips 
-- group by cs 
-- order by cs;
-- ******************************************

select abbr 
from state 
join 
	(select c.state cs, count(cls.county) ccc 
	from countylabourstats cls 
	join county c 
	on cls.year = 2008 and (cls.employed/cls.labour_force) >= 0.9 and cls.county = c.fips 
	group by cs) as temp 
on state.id = temp.cs and temp.ccc > 150 
order by temp.ccc;
