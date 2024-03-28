-- Focusing on top paying Jobs In India
With top_paying_job AS (
    SELECT 
    job_id,
	job_title,
	job_location,
    name as Company_name,  
	job_schedule_type,
	salary_year_avg,
	job_posted_date
FROM job_posting
left join company on job_posting.company_id = company.company_id
Where 
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
Order by 
    salary_year_avg DESC 
)
Select * FROM top_paying_job
WHERE job_location = 'India'
Limit 10