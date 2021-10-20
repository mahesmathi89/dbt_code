
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (

   select distinct LOCATION_ISO_CODE,
LOCATION,
LOCATION_LEVEL,
COUNTRY,
CONTINENT,
ISLAND,
PROVINCE,
SPECIAL_STATUS,
LATITUDE,
LONGITUDE,
TOTAL_REGENCIES,
POPULATION_DENSITY,
POPULATION,
TOTAL_CITIES,
TOTAL_DISTRICTS,
TOTAL_URBAN_VILLAGES,
AREA_KM_2_ from
"FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS_MAHESWARAN_MATHIVANAN"."COVID_19_INDONESIA_MAHESWARAN_MATHIVANAN" 
)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
