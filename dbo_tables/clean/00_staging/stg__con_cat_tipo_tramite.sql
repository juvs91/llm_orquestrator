with stg_concattipotramite as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_concattipotramite,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`espago` as BOOL) as espago,
		safe_cast(`esmanual` as BOOL) as esmanual,
		safe_cast(`esbloqueo` as BOOL) as esbloqueo,
		safe_cast(`esenlinea` as BOOL) as esenlinea,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`comentarios` as STRING) as comentarios,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`clatipopoliza` as INT64) as clatipopoliza,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`clatipotramite` as INT64) as clatipotramite,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`idautorizacion` as INT64) as idautorizacion,
		upper(safe_cast(`nomtipotramite` as STRING)) as nomtipotramite,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`clacontabilidad` as INT64) as clacontabilidad,
		safe_cast(`desctipotramite` as STRING) as desctipotramite,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`vigenciaenlinea` as DATETIME) as vigenciaenlinea,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`autorizacancelacion` as INT64) as autorizacancelacion,
		safe_cast(`claestatustipotramite` as INT64) as claestatustipotramite,
		safe_cast(`claclasificacionpoliza` as INT64) as claclasificacionpoliza,
		safe_cast(`claflujotramitedirecto` as INT64) as claflujotramitedirecto,
		safe_cast(`esreqcomprobantefiscal` as BOOL) as esreqcomprobantefiscal,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no,
		safe_cast(`esrespetafechaelaboracion` as INT64) as esrespetafechaelaboracion
	from {{source('src_prod_kraken_abt','dbo_ConCatTipoTramite')}}
)
select * from stg_concattipotramite