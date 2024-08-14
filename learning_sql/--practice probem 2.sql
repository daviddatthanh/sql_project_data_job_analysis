--practice probem 2

SELECT  
    COUNT(job_id) AS num_of_jobs,
    EXTRACT(month from job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS month
FROM job_postings_fact
WHERE
    Extract(YEAR from job_posted_date) = 2023
GROUP BY
    month
ORDER BY
    month
    ;