
  
    

  create  table "analytics_db"."main"."int_company__dim__dbt_tmp"
  
  
    as
  
  (
    

WITH company_info AS (SELECT * FROM "analytics_db"."main"."stg_company_info")

SELECT
    company_id,
    industry_back,
    industry_front,
    hq_country
FROM company_info ci
WHERE company_id IS NOT NULL
  );
  