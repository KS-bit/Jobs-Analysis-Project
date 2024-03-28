--Top Optimal Skills(optimal skills is which offers both job security (high demand) and financial benefits (high salaries))

SELECT 
    skills,
    count(job_posting.job_id) as Demand,
    Round(AVG (salary_year_avg),0)as Salary_AVG
FROM job_posting
Inner join skills_job on job_posting.job_id = skills_job.job_id
Inner join skills on skills_job.skill_id = skills.skill_id
Where 
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
Group by 
    skills
Having 
    count(job_posting.job_id) > 10
order by 
    Salary_AVG DESC,
    Demand DESC
Limit 10