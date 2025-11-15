
  
    

  create  table "analytics_db"."main"."int_consent__status_distribution__dbt_tmp"
  
  
    as
  
  (
    

WITH events AS (SELECT * FROM "analytics_db"."main"."stg_events"),

 events_light AS (
    SELECT
        company_id,
        consent_status,
        extrapolated_count_rounded
    FROM events
),

summaries AS (
    SELECT
        company_id,
        SUM(extrapolated_count_rounded) AS total_events,
        SUM(
            CASE 
                WHEN consent_status = 'empty'
                THEN extrapolated_count_rounded
                ELSE 0
            END
            ) AS total_empty_consent_statuses,

        SUM(
            CASE 
                WHEN consent_status = 'full opt-in'
                THEN extrapolated_count_rounded
                ELSE 0
            END
            ) AS total_full_opt_in_consent_statuses,
        SUM(
            CASE 
                WHEN consent_status = 'partial'
                THEN extrapolated_count_rounded
                ELSE 0
            END
            ) AS total_partial_opt_in_consent_statuses
    FROM events_light
    GROUP BY company_id
)

SELECT * FROM summaries
  );
  