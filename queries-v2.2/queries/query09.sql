-- Out of those counties with temperature of more than 60, 
-- retrieve the pair that had the largest absolute difference in temperature
-- and their corresponding temperatures.
-- The second county in the pair has a temperature larger than the first county's temperature. 
-- If multiple pairs exist, retrieve the pair with the smallest FIP of the first county in the pair.


-- 1.05 marks: < 10 operators
-- 1.0 marks: < 12 operators
-- 0.8 marks: correct answer

select ca.name, ca.temp, cb.name, cb.temp 
from county ca 
join county cb 
on ca.temp > 60 and cb.temp > 60 
	and cb.temp - ca.temp = (select max(cg.temp - cf.temp) from county cf join county cg on cg.temp > 60 and cf.temp > 60) 
order by ca.fips 
limit 1;
