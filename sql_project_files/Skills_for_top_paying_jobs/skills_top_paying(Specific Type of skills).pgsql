--Top skills on the basis top 10 paying job in Data Anlyst(Specific Type of skills)
With top_paying_job AS (
    SELECT
    job_id,
	job_title,
	salary_year_avg
FROM job_posting
left join company on job_posting.company_id = company.company_id
Where 
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
Order by 
    salary_year_avg DESC 
Limit 10
)

Select     
    skills,
    AVG(salary_year_avg) as AVG_Salary
FROM top_paying_job 
Inner JOIN skills_job on top_paying_job.job_id = skills_job.job_id
Inner JOIN skills on skills_job.skill_id = skills.skill_id
Where skills.type = 'programming'--Change type of skill Here
group by skills.skills
Order by AVG_Salary DESC