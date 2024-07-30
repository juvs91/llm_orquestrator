with stg_carcatmovcartera as (
    select

        safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
        safe_cast(`_airbyte_extracted_at` as TIMESTAMP)
            as _airbyte_extracted_at,
        safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
        safe_cast(`tipomov` as INT64) as tipomov,
        safe_cast(`fechains` as DATETIME) as fechains,
        safe_cast(`desccorta` as STRING) as desccorta,
        safe_cast(`bajalogica` as INT64) as bajalogica,
        safe_cast(`afectaivasn` as BOOL) as afectaivasn,
        upper(safe_cast(`descripcion` as STRING)) as descripcion,
        safe_cast(`letreroref1` as STRING) as letreroref1,
        safe_cast(`letreroref2` as STRING) as letreroref2,
        safe_cast(`letreroref3` as STRING) as letreroref3,
        safe_cast(`letreroref4` as STRING) as letreroref4,
        safe_cast(`letreroref5` as STRING) as letreroref5,
        safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
        safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
        safe_cast(`clamovcartera` as INT64) as clamovcartera,
        safe_cast(`clausuarioins` as INT64) as clausuarioins,
        safe_cast(`clausuariomod` as INT64) as clausuariomod,
        safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
        safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
        safe_cast(`capturamanualsn` as BOOL) as capturamanualsn,
        safe_cast(`desccortaingles` as STRING) as desccortaingles,
        safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
        safe_cast(`gennotafiscalsn` as BOOL) as gennotafiscalsn,
        safe_cast(`clagpomovcartera` as INT64) as clagpomovcartera,
        safe_cast(`descripcioningles` as STRING) as descripcioningles,
        safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
        safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
        coalesce(safe_cast(`esaplicacargoventas` as INT64), 0)
            as esaplicacargoventas,
        safe_cast(`afectapreciomezclasn` as BOOL) as afectapreciomezclasn,
        safe_cast(`esaplicacargocartera` as INT64) as esaplicacargocartera,
        coalesce(safe_cast(`esaplicacreditoventas` as INT64), 0)
            as esaplicacreditoventas,
        safe_cast(`esaplicacreditocartera` as INT64) as esaplicacreditocartera,
        safe_cast(`_ab_cdc_event_serial_no` as STRING)
            as _ab_cdc_event_serial_no,
        coalesce(safe_cast(`esaplicacargocostointegral` as INT64), 0)
            as esaplicacargocostointegral,
        safe_cast(`esaplicacargootrosingresos` as INT64)
            as esaplicacargootrosingresos,
        coalesce(safe_cast(`esaplicacreditocostointegral` as INT64), 0)
            as esaplicacreditocostointegral,
        safe_cast(`esaplicacreditootrosingresos` as INT64)
            as esaplicacreditootrosingresos
    from {{ source('src_prod_kraken_abt','dbo_CarCatMovCartera') }}
)

select * from stg_carcatmovcartera
