{{config(materialized='table')}}

WITH date_series AS (
    SELECT
        date AS date
    FROM
        UNNEST(GENERATE_DATE_ARRAY('2020-01-01', '2040-12-31')) AS date
),

MST_DIAS_INHABILES AS (
    SELECT
        SAFE.PARSE_TIMESTAMP('%d/%m/%Y %H:%M', FechaInhabil) AS FECHA_INHABIL,       
        FechaUltimaMod AS FECHA_ULTIMA_MOD
    FROM {{ref("dias_inhabiles")}}
)

SELECT 
    date AS DATE,
    EXTRACT(YEAR FROM date) AS YEAR,
    EXTRACT(MONTH FROM date) AS MONTH,
    EXTRACT(DAY FROM date) AS DAY,
    FORMAT_DATE('%A', date) AS DAY_OF_WEEK,
    FORMAT_DATE('%Y-%m', date) AS YEAR_MONTH,
    FORMAT_DATE('%B.%Y', date) AS MONTH_YEAR,
    FORMAT_DATE('%Y%m%d', date) AS YEAR_MONTH_DAY,
    FORMAT_DATE('%m/%d/%Y', date) AS US_FORMAT,
    CONCAT('Trim ', EXTRACT(quarter from date)) as QUARTER,
    CASE WHEN EXTRACT(MONTH from date) <= 6 THEN 'Sem 1' ELSE 'Sem 2' END AS SEMESTER,
    EXTRACT(YEAR FROM date)  || '' || {{ dbt_date.iso_week_of_year("date") }} AS YEAR_WEEK,
    date = CURRENT_DATE() AS IS_TODAY,
    1 AS DAY_MONTH,
    CASE 
        WHEN EXTRACT(DAYOFWEEK FROM date)=1 
            OR EXISTS (SELECT FECHA_INHABIL FROM MST_DIAS_INHABILES WHERE CAST(FECHA_INHABIL AS date) = date) THEN 0.0 
        WHEN EXTRACT(DAYOFWEEK FROM date)=7 THEN 0.5 
        ELSE 1 
    END AS DIAS_HABILES_MES,
    CASE WHEN EXTRACT(DAYOFWEEK FROM date)=1 
    OR EXISTS (SELECT FECHA_INHABIL FROM MST_DIAS_INHABILES WHERE CAST(FECHA_INHABIL AS date) = date) THEN 0 ELSE
        CASE WHEN date < date_sub(current_date(), interval 1 day) THEN
            CASE WHEN EXTRACT(DAYOFWEEK FROM date)=7 THEN 0.5 ELSE 1 END
        ELSE 0 END
    END AS DIAS_HABILES_TRANSCURRIDOS_MES,
    CASE WHEN EXTRACT(DAYOFWEEK FROM date)=1 
    OR EXISTS (SELECT FECHA_INHABIL FROM MST_DIAS_INHABILES WHERE CAST(FECHA_INHABIL AS date) = date) THEN 0 ELSE
        CASE WHEN date < date_sub(current_date(), interval 1 day) THEN 0 ELSE
            CASE WHEN EXTRACT(DAYOFWEEK FROM date)=7 THEN 0.5 ELSE 1 END
        END
    END AS DIAS_HABILES_RESTANTES_MES

FROM date_series
--LEFT JOIN   MST_DIAS_INHABILES          ON date_series.date = CAST(MST_DIAS_INHABILES.FECHA_INHABIL AS date)