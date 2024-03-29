# Data Analyst Jobs Analysis Project

# Introduction

🔍 This project draws inspiration from [Luke Barousse](https://www.linkedin.com/in/luke-b/) and his work on [datanerd.tech](https://datanerd.tech/). Our goal is to delve into various aspects of Data Analyst jobs, leveraging SQL for analysis.


## Topics Explored 🚀
1. **Top Paying Jobs**
    - a. Top paying Data Analyst Jobs
    - b. Top paying Data Analyst Jobs In India
    - c. Top paying Data Analyst Jobs (Remote)

2. **Skills For Top Paying Jobs**
    - a. Skills for Top paying Data Analyst Jobs
    - b. Programming Skills Required for Top paying Data Analyst Jobs

3. **Most Demanded Skills**

4. **Skills Associated with Higher Salaries (Data Analyst)**

5. **Most Optimal Skills**


## Analysis Overview 📈

We conducted SQL queries to address each topic:

### a. Top paying Data Analyst Jobs

We will focusing on top paying jobs for Data Analyst

```sql

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
limit 10

```

![Top paying Data Analyst Jobs](Results/Top%20Paying%20Data%20Analyst%20Jobs.png)

* Here is the Visulization for the result of above query 

### b. Top paying Data Analyst Jobs In India

As I thought this will be more useful for me 😉

```sql
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
Select  
    job_id,
	job_title,
    Company_name,  
	job_schedule_type,
	salary_year_avg
FROM top_paying_job
WHERE job_location = 'India'
Limit 10
```

![Top paying Data Analyst Jobs In India](Results/Top%20Paying%20Data%20Analyst%20Jobs%20(India).png)

* Here is the Visulization for the result of above query 

### c. Top paying Data Analyst Jobs(Remote)

This Query is quite smilar to the above one 
[Top paying Data Analyst Jobs(Remote)](/sql_project_files/Top_Paying_jobs/top_paying_jobs(Remote).pgsql)
 

## 2. Skills For Top Paying Jobs

### a. Skills for Top paying Data Analyst Jobs

Here we will be analyzing skills needed by these top paying Data Analyst jobs

```sql
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
    Round(AVG(salary_year_avg),2) as AVG_Salary
FROM top_paying_job
Inner JOIN skills_job on top_paying_job.job_id = skills_job.job_id
Inner JOIN skills on skills_job.skill_id = skills.skill_id
group by skills.skills
Order by AVG_Salary DESC

Limit 10;
```
![Skills For Top Paying Jobs](/Results/Top%20paying%20Skills.png)

* Here is the Visulization for the result of above query 


### b. Programming Skills Requried for Top paying Data Analyst Jobs

Here by using Group BY we have analyzed Top Programming skills required 

[SQL_Query_for_This](/sql_project_files/Skills_for_top_paying_jobs/skills_top_paying(Specific%20Type%20of%20skills).pgsql)

* We can Analyze Different Type of Skills just by doing Some Minor Changes in this query 

![Programming Skills For Top Paying Jobs](/Results/Top%20Paying%20Programming%20Skills.png)

* Here is the Visulization for the result of above query 

## 3. Most Demanded Skills 

This query helped identify the skills most frequently requested in job postings, directing focus to areas with high demand.

```sql
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
```
![Most Demanded Skills ](/Results/Top%20Demanded%20Skills.png)

* Here is the Visulization for the result of above query 


## 4. Skills which are associated with higher salaries(Data Analyst)

Exploring the average salaries associated with different skills revealed which skills are the highest paying.

```sql
Select     
    skills,
    Round(AVG(salary_year_avg),2) as AVG_Salary
FROM job_posting
Inner JOIN skills_job on job_posting.job_id = skills_job.job_id
Inner JOIN skills on skills_job.skill_id = skills.skill_id
Where 
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
group by skills.skills
Order by AVG_Salary DESC
Limit 10
```

![Most Demanded ](/Results/High%20Paying%20Skills.png)

* Here is the Visulization for the result of above query 

## 5. Most Optimal Skills 
Here we are focusing on Optimal Skills(optimal skills are which offers both job security (high demand) and financial benefits (high salaries))

[Query for This](/sql_project_files/Optimal_skills/top_optimal_skills.pgsql)
![Optimal Skills](/Results/Top%20Optimal%20Skills.png)
*Here is the Visulization for the result of above query 



## Summary💡
1. **Top Paying Jobs**
    - Analyzed top-paying Data Analyst roles, including those in India and remote positions.

2. **Skills For Top Paying Jobs**
    - Explored skills necessary for high-paying Data Analyst roles, including programming skills.

3. **Most Demanded Skills**
    - Identified skills most sought after in Data Analyst job postings.

4. **Skills Associated with Higher Salaries**
    - Explored skills correlated with higher salaries in the Data Analyst field.

5. **Most Optimal Skills**
    - Focused on skills offering both job security and financial benefits for Data Analysts.