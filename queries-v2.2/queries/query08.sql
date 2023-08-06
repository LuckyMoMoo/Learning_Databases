-- Retrieve the list of counties sorted by the ratio 
-- between male and female population for each county 
-- in descending order or the aforementioned ratio, and then in the ascending order of county FIP.
-- Exclude tuples with ratio of 1:1 from returned result.

-- 1.05 marks: < 7 operators
-- 1.0 marks: < 8 operators
-- 0.8 marks: correct answer

-- ******************************************
-- 'Try 1'
-- select gba.county, gba.population, gbb.population 
-- from genderbreakdown gba 
-- join genderbreakdown gbb 
-- on gba.county = gbb.county and gba.gender = 'male' and gbb.gender = 'female' 
-- limit 30;
-- ******************************************

select gba.county, (gba.population/gbb.population) as ratio 
from genderbreakdown gba 
join genderbreakdown gbb 
on gba.county = gbb.county and gba.gender = 'male' and gbb.gender = 'female' and (gba.population/gbb.population) <> 1 
order by ratio desc, gba.county;
