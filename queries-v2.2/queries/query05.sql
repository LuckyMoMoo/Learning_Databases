-- Retrieve the list of abbreviations of states that have
-- a total precipitation of more than 1000 for each state,
-- ordered by the total precipitation in descending order.

-- 1.05 marks: < 7 operators
-- 1.0 marks: < 8 operators
-- 0.8 marks: correct answer

select s.abbr, sum(c.precip) as total 
from state s 
join county c 
on s.id = c.state 
group by s.id 
having total > 1000 
order by total desc;
