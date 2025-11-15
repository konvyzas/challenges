
  
    

  create  table "analytics_db"."main"."companies_kpis__dbt_tmp"
  
  
    as
  
  (
    

WITH company_performance AS (SELECT * FROM "analytics_db"."main"."company_performance"),
consent_metrics AS (SELECT * FROM "analytics_db"."main"."consent_metrics")

SELECT
    cp.company_id,
    cp.total_events,
    total_pageviews,
    total_consent_given,
    total_consent_asked,
    total_ui_actions,
    distinct_countries
    given_extrapolated_count,
    asked_extrapolated_count,
    consent_conversion_rate_pct,
    total_empty_consent_statuses,
    total_full_opt_in_consent_statuses,
    total_partial_opt_in_consent_statuses,
    median_seconds_to_consented
FROM company_performance cp
LEFT JOIN consent_metrics cm USING(company_id)
  );
  