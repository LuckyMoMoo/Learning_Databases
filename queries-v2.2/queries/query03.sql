-- Retrieve all states that have their abbreviartion names starting with 'A' 
-- and contain at least 20 counties,
-- ordered by the total area. 

-- 1.05 marks: < 7 operators
-- 1.0 marks: < 8 operators
-- 0.8 marks: correct answer

select s.abbr from state s 
join county c 
on s.id = c.state 
where s.abbr like 'A%'
group by s.id 
having count(c.name) >= 20 
order by sum(c.sq_km);
