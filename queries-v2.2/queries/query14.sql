-- Retrieve the distinct abbreviations of states which have a county that does NOT have the 
-- "Management of companies and enterprises" industry 
-- and also the corresponding total number of counties in each state
-- in descending order of the number of distinct counties in each state, then in alphebatical order of the abbreviations.
-- Your query need to use the name "Management of companies and enterprises" to filter the tuples, instead of just the industry id as prior knowledge.

-- 1.05 marks: < 13 operators
-- 1.0 marks: < 15 operators
-- 0.8 marks: correct answer

-- ******************************************
-- 'Try 1'
-- select distinct county 
-- from countyindustries 
-- where county not in (select county from  countyindustries where industry = 17);
-- ******************************************

-- ******************************************
-- 'Try 2'
-- select c.state, count(*) as cons 
-- from county c 
-- join (select distinct county 
-- 	from countyindustries 
-- 	where county not in (select county from  countyindustries where industry = 17)) as cy 
-- on c.fips = cy.county 
-- group by c.state;
-- ******************************************

-- ******************************************
-- 'Try 3'
-- select s.abbr, count(*) as cons 
-- from county c 
-- join state s 
-- on c.state = s.id 
-- group by c.state 
-- order by cons desc;
-- ******************************************

select s.abbr, ss.cons as numCounties 
from state s 
join (select c.state, count(*) as cons 
	from county c 
	join (select distinct county 
		from countyindustries 
		where county not in (select county from  countyindustries where industry = 17)) as cy 
	on c.fips = cy.county 
	group by c.state) as ss 
on s.id = ss.state 
order by numCounties desc;
