/*
What skills are required for the top-paying data analyst jobs?
-- Use the top 10 highest-paying Data Analyst jobs from top_paying_job query 
-- Add the specific skills required for these roles 
*/
WITH top_paying_job AS (
    SELECT 
        job_postings_fact.job_id,
        job_title,
        job_schedule_type,
        salary_year_avg,
        company_dim.name AS company_name
    FROM 
        job_postings_fact INNER JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        salary_year_avg IS NOT NULL AND
        job_location = 'Anywhere' AND 
        job_title_short = 'Data Analyst'
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_job.*,
    skills
FROM 
    skills_job_dim INNER JOIN top_paying_job ON skills_job_dim.job_id = top_paying_job.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC

/*
From here, export the file and analyze it further using excel
Results found that the toping paying jobs frequencies are: 
1. SQL 
2. Python 
3. Tableau
*/