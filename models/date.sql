
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (

    select DISTINCT TO_NUMBER(to_char(TO_DATE(DATE),'yyyymmdd')) as date_id,
TO_DATE(DATE) as date,
Month(TO_DATE(DATE)) as Month,
year(TO_DATE(DATE)) as year,
week(TO_DATE(DATE)) as week ,
QUARTER(TO_DATE(DATE)) as QUARTER ,
case when TIME_ZONE is null then 'NA' else TIME_ZONE end as TIME_ZONE from
"FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS_MAHESWARAN_MATHIVANAN"."COVID_19_INDONESIA_MAHESWARAN_MATHIVANAN"

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
