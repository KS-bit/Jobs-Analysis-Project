--Most Demanded Skills for Data Analyst
SELECT 
    skills,
    count(job_posting.job_id) as Count_of_jobs
FROM job_posting
Inner join skills_job on job_posting.job_id = skills_job.job_id
Inner join skills on skills_job.skill_id = skills.skill_id
Where 
    job_title_short = 'Data Analyst'
Group by skills
order by Count_of_jobs DESC
Limit 10