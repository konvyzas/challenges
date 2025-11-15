
  
    

  create  table "analytics_db"."main"."company_performance__dbt_tmp"
  
  
    as
  
  (
    

WITH int_company__performance AS (SELECT * FROM "analytics_db"."main"."int_company__performance"),
int_company__dim AS (SELECT * FROM "analytics_db"."main"."int_company__dim")

SELECT
    dim.*,
    total_events,
    total_pageviews,
    total_consent_given,
    total_consent_asked,
    total_ui_actions,
    distinct_countries
FROM int_company__performance perf
LEFT JOIN int_company__dim dim USING(company_id)
  );
  