/* What are the top paying jobs for my role? In this case the role we are intrested in is Data Analyst.
Another role could be Senior Data Analyst if you are interested or ML engineer.
Methodology.
1. We need the job name, salary, job id and location
2. The salary section needs to have values ie no NULL valuse.
3. We need the top 10 therefore order by descending (High to Low). Limit to top 10 or 20.w
4. Where fIlter needs to include Data Analyst.
5. Nearest Country
6. BONUS: The roles are of no use to us without the company name so pull the company name from another table and incorporate it in
7. This is likely to be a JOIN function.
8. Write a brief statement on your findings.

*/

SELECT 
    job_id,
    name as company_name,
    job_title_short,
    salary_year_avg,
    job_schedule_type,
    job_via,
    job_country

FROM 
    job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id 
    -- join funcion gives access to the  company dim table where the company name resides

WHERE job_title_short = 'Data Analyst' AND
      job_country = 'United Kingdom' AND
      salary_year_avg IS NOT NULL

ORDER BY salary_year_avg DESC


