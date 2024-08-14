/*
What is the average salary of remote skills for data analyst
*/

WITH job_remote AS (
    SELECT
        skill_id,
        AVG(job_postings_fact.salary_year_avg) AS Avg_yearly_salary,
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
    skills_dim.skill_id,
    ROUND(Avg_yearly_salary,2) AS Average_yearly_salary
FROM 
    skills_dim INNER JOIN job_remote ON skills_dim.skill_id = job_remote.skill_id
ORDER BY number_of_jobs DESC;

/* 
The data are 2023 job postings, and it gives valuable insight into the demand and compensation for various technical skills in the job market. Among the most sought-after skills, SQL stands out with the highest number of job openings at 7,291, and an average yearly salary of $97,237.16. This indicates the widespread need for professionals proficient in SQL, particularly in roles related to data management and analysis.

Python, another high-demand skill, has 4,330 job openings with an average salary of $101,397.22. Python's versatility in programming and data analysis, combined with its use in machine learning and automation, makes it a critical skill in the technology sector. Similarly, Tableau and Power BI, tools used for data visualization, show strong demand with 3,745 and 2,609 job openings, and average salaries of $99,287.65 and $97,431.30, respectively. These tools are essential for turning complex data into actionable insights, a necessity for business intelligence and analytics roles.

Advanced programming and cloud-related skills command some of the highest salaries. For instance, the programming language Go, despite having only 815 job openings, offers an impressive average salary of $115,319.89. This high pay reflects its specialized use in building scalable and efficient software systems. Similarly, Azure and AWS, both cloud computing platforms, offer lucrative average salaries of $111,225.10 and $108,317.30, respectively. These platforms are integral to modern IT infrastructure, driving demand for skilled professionals in these areas.

Other notable skills include R, a programming language used for statistical computing and graphics, which has an average salary of $100,498.77 with 2,142 job openings. Looker, a data platform for business intelligence, also commands a high average salary of $103,795.30 despite having only 868 job openings, indicating its value in specialized data roles. Tools like SAS and SPSS, used for advanced analytics and statistical analysis, offer average salaries close to $99,000, reflecting their importance in data-driven decision-making.

On the lower end of the demand spectrum, skills like HTML, VBA, and MongoDB have fewer job openings and comparatively lower average salaries, though they remain essential in their respective niches. For example, MongoDB, a NoSQL database, offers an average salary of $66,019.67, with 91 job openings. In contrast, more specialized skills like GitLab, with just 57 job openings, command a significantly higher average salary of $154,500.00, highlighting the premium placed on expertise in version control systems.

In summary, the data reveals a strong demand for data-related skills, programming languages, and cloud computing expertise, with corresponding salaries that reflect the value these skills bring to the market. Skills in high demand, such as SQL, Python, and cloud platforms, are widely needed across industries, while more specialized skills, though fewer in demand, offer substantial financial rewards.
*/


