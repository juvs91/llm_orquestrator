with stg_ti_tra_usuario as (
    select
		{{ dbt_utils.generate_surrogate_key(['idusuario']) }} as pk_titrausuario,
        safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
        safe_cast(`_airbyte_extracted_at` as TIMESTAMP)
            as _airbyte_extracted_at,
        safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
        safe_cast(`rfc` as STRING) as rfc,
        safe_cast(`email` as STRING) as email,
        safe_cast(`clacrc` as INT64) as clacrc,
        safe_cast(`perfil` as INT64) as perfil,
        safe_cast(`puesto` as STRING) as puesto,
        safe_cast(`dominio` as STRING) as dominio,
        safe_cast(`fechains` as DATETIME) as fechains,
        safe_cast(`bloqueado` as INT64) as bloqueado,
        safe_cast(`clapuesto` as INT64) as clapuesto,
        safe_cast(`idusuario` as INT64) as idusuario,
        safe_cast(`bajalogica` as INT64) as bajalogica,
        safe_cast(`bajanomina` as INT64) as bajanomina,
        safe_cast(`claempleado` as INT64) as claempleado,
        safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
        safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
        safe_cast(`emailalterno` as STRING) as emailalterno,
        safe_cast(`nombreperfil` as STRING) as nombreperfil,
        safe_cast(`telefonocasa` as STRING) as telefonocasa,
        safe_cast(`clausuarioins` as INT64) as clausuarioins,
        safe_cast(`clausuariomod` as INT64) as clausuariomod,
        safe_cast(`loginusername` as STRING) as loginusername,
        upper(safe_cast(`nombreusuario` as STRING)) as nombreusuario,
        safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
        safe_cast(`idempleadojefe` as INT64) as idempleadojefe,
        safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
        upper(safe_cast(`apellidomaterno` as STRING)) as apellidomaterno,
        upper(safe_cast(`apellidopaterno` as STRING)) as apellidopaterno,
        safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
        safe_cast(`fechanacimiento` as DATETIME) as fechanacimiento,
        safe_cast(`telefonocelular` as STRING) as telefonocelular,
        safe_cast(`telefonooficina` as STRING) as telefonooficina,
        safe_cast(`claidiomadefault` as INT64) as claidiomadefault,
        safe_cast(`dispositivomovil` as STRING) as dispositivomovil,
        safe_cast(`nombremodificable` as INT64) as nombremodificable,
        safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
        safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
        safe_cast(`claubicaciondefault` as INT64) as claubicaciondefault,
        safe_cast(`autenticacionactived` as INT64) as autenticacionactived,
        safe_cast(`_ab_cdc_event_serial_no` as STRING)
            as _ab_cdc_event_serial_no,
        safe_cast(`fechaultintentoprincipal` as DATETIME)
            as fechaultintentoprincipal,
        safe_cast(`intentosfallidosprincipal` as INT64)
            as intentosfallidosprincipal
    from {{ source('src_prod_kraken_abt','dbo_TiTraUsuario') }}
)

select * from stg_ti_tra_usuario
