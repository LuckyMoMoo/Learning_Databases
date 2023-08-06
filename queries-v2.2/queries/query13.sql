-- Retrieve names of top 10 counties and 
-- their growth ratio in terms of population compared between the latest census year and the oldest census year, 
-- in an descending order by their growth ratio.

-- 1.05 marks: < 15 operators
-- 1.0 marks: < 17 operators
-- 0.9 marks: < 19 operators
-- 0.8 marks: correct answer

select c.name, (cpa.population / cpb.population) as popGrowthRatio 
from county c 
join countypopulation cpa 
on c.fips = cpa.county and cpa.year = (select max(year) from censusyear) 
join countypopulation cpb 
on c.fips = cpb.county and cpb.year = (select min(year) from censusyear) 
group by c.fips 
order by popGrowthRatio desc 
limit 10;
