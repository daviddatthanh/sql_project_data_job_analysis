/* 
Find the count of the number of remote job postings per skill
	- Display the top 5 skills by their demand in remote skills 
	- Include skill ID, name, and count of postings requiring the skill
*/

WITH job_remote AS (
    SELECT
        skill_id,
        COUNT(*) AS number_of_jobs
    FROM 
        job_postings_fact 
        INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id

    WHERE
        job_work_from_home = True AND
        job_postings_fact.job_title_short = 'Data Analyst'
    GROUP BY skill_id
)

SELECT
    skills_dim.skills,
    number_of_jobs,
    skills_dim.skill_id
FROM 
    skills_dim INNER JOIN job_remote ON skills_dim.skill_id = job_remote.skill_id
ORDER BY number_of_jobs DESC
LIMIT 5;