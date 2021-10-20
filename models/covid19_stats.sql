
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (

   select LOCATION_ISO_CODE	,
TO_NUMBER(to_char(TO_DATE(DATE),'yyyymmdd')) as date_id	,
TOTAL_RECOVERED	,
TOTAL_CASES_PER_MILLION	,
TOTAL_RURAL_VILLAGES	,
GROWTH_FACTOR_OF_NEW_DEATHS	,
TOTAL_ACTIVE_CASES	,
NEW_CASES_PER_MILLION	,
NEW_DEATHS_PER_MILLION	,
NEW_RECOVERED	,
CASE_FATALITY_RATE	,
NEW_DEATHS	,
NEW_CASES	,
TOTAL_DEATHS	,
CASE_RECOVERED_RATE,
NEW_ACTIVE_CASES	,
TOTAL_CASES	,
TOTAL_DEATHS_PER_MILLION	,
GROWTH_FACTOR_OF_NEW_CASES,case when TIME_ZONE is null then 'NA' else TIME_ZONE end as TIME_ZONE	from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS_MAHESWARAN_MATHIVANAN"."COVID_19_INDONESIA_MAHESWARAN_MATHIVANAN" 
)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
