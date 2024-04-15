/* What skills are required for the top paying data analyst jobs?
Methodology.
- We need to build on our existing sql query for the highrdt paying jobs.
As we are buidling from the top baying jobs result set, a CTE would be the most suitable route 
- We need to pull from the skills id table and the relevant skills.
    1. The number question is what kind of JOIN to use.
    2. It is impotant we have a starting point, in the previous example we based the left join on company dim beacuse we were intrested in the salary for every job,
    - In this case, we are inrested in only jobs that have skills affiliated with it.
    - Meaning from the results of the job table,we only wat roles with skills on them hence INNER JOIN 

Write some notes on the findings.
*/

WITH top_paying_jobs AS (
    SELECT 
        job_id,
        name as company_name,
        job_title_short,
        salary_year_avg,
        job_schedule_type

    FROM 
        job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id 
        -- join funcion gives access to the  company dim table where the company name resides

    WHERE job_title_short = 'Data Analyst' AND
        job_country = 'United Kingdom' AND
        salary_year_avg IS NOT NULL

    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT
    top_paying_jobs.*,
    skills
FROM top_paying_jobs 
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

ORDER BY 
    salary_year_avg DESC