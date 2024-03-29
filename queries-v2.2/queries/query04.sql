-- Retrieve the years that exist in CensusYear but not in LabourSurvey. 
-- The ordering should be in the existing physical order of the data.

-- 1.05 marks: < 4 operators
-- 1.0 marks: < 5 operators
-- 0.8 marks: correct answer

-- ******************************************
-- 'Try 1'
-- select cy.year 
-- from censusyear cy 
-- natural join laboursurvey ls;
-- ******************************************

select cy.year 
from censusyear cy 
left join laboursurvey ls 
on cy.year = ls.year 
where ls.year is null;
