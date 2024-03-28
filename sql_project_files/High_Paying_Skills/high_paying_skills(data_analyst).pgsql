--High Paying Skills

Select     
    skills,
    AVG(salary_year_avg) as AVG_Salary
FROM job_posting
Inner JOIN skills_job on job_posting.job_id = skills_job.job_id
Inner JOIN skills on skills_job.skill_id = skills.skill_id
Where 
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
group by skills.skills
Order by AVG_Salary DESC
Limit 10