/* 
What are the top-paying data analst jobs?
- Top 10 remote
- with salary (no null)
*/

SELECT 
    job_id, 
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    company_dim.name AS company_name
FROM 
    job_postings_fact INNER JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    salary_year_avg IS NOT NULL AND
    job_location = 'Anywhere' AND 
    job_title_short = 'Data Analyst'
ORDER BY salary_year_avg DESC
LIMIT 10;

/*
Top Five comopanies are: Mantys, Meta, AT&T, Pinterest, UCLAHealth
*/