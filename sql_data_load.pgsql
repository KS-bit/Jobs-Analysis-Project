Create DATABASE sql_project_db;

--Table company
Create Table Company(
    company_id int,	
    name text,	
    link text,	
    link_google text,	
    thumbnail text
)
Copy Company(company_id,name,link,link_google,thumbnail)
from 'C:\Users\kirti\OneDrive\Desktop\SQL Project\Data\company_dim.csv'
DELIMITER ','
CSV HEADER

--Table Job posting 
CREATE TABLE Job_Posting
(
    job_id INT,
    company_id INT,
    job_title_short VARCHAR(255),
    job_title TEXT,
    job_location TEXT,
    job_via TEXT,
    job_schedule_type TEXT,
    job_work_from_home BOOLEAN,
    search_location TEXT,
    job_posted_date TIMESTAMP,
    job_no_degree_mention BOOLEAN,
    job_health_insurance BOOLEAN,
    job_country TEXT,
    salary_rate TEXT,
    salary_year_avg NUMERIC,
    salary_hour_avg NUMERIC
);

Copy Job_Posting(
    job_id,
    company_id,
    job_title_short,
    job_title,
    job_location,
    job_via,
    job_schedule_type,
    job_work_from_home,
    search_location,
    job_posted_date,
    job_no_degree_mention,
    job_health_insurance,
    job_country,
    salary_rate,
    salary_year_avg,
    salary_hour_avg
)
from 'C:\Users\kirti\OneDrive\Desktop\SQL Project\Data\job_postings_fact.csv'
DELIMITER ','
CSV HEADER


--Table Skills
CREATE TABLE Skills (
    skill_id int,
    skills text, 
    type text
)

COPY Skills (skill_id, skills, type)
from 'C:\Users\kirti\OneDrive\Desktop\SQL Project\Data\skills_dim.csv'
DELIMITER ','
CSV HEADER

--Table Skills_job
CREATE TABLE Skills_job(
    job_id Int,	
    skill_id Int
)

COPY Skills_job(job_id, skill_id)
from 'C:\Users\kirti\OneDrive\Desktop\SQL Project\Data\skills_job_dim.csv'
DELIMITER ','
CSV HEADER


-- Creation of PRIMARY keys and FOREIGN KEYS(Should be done with Table Creation)
ALTER TABLE Company ADD PRIMARY KEY (company_id);
ALTER TABLE Job_Posting ADD PRIMARY KEY (job_id);
ALTER TABLE Skills ADD PRIMARY KEY (skill_id);
ALTER TABLE Skills_job ADD PRIMARY KEY (job_id, skill_id);

ALTER TABLE Job_Posting
    ADD CONSTRAINT company_id FOREIGN KEY (company_id) REFERENCES Company (company_id);
ALTER TABLE Skills_job
    ADD CONSTRAINT job_id FOREIGN KEY (job_id) REFERENCES Job_Posting (job_id);
ALTER TABLE Skills_job
    ADD CONSTRAINT skill_idd FOREIGN KEY (skill_id) REFERENCES Skills (skill_id);

--Changing job_location from 'Anywhere' to 'remote'(In the raw data remote was denoted as Anywhere)
UPDATE Job_posting
SET job_location = REPLACE(job_location, 'Anywhere', 'Remote');