-- Retrieve the distinct IDs for states that 
-- have a county with an average income more than $100,000. 
-- Order the results by state ID in ascending order.

-- 1.05 marks: < 6 operators
-- 1.0 marks: < 7 operators
-- 0.8 marks: correct answer

select distinct c.state as id 
from county c 
where c.avg_income > 100000;
