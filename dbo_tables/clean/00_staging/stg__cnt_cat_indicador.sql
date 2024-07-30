with stg_cntcatindicador as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_cntcatindicador,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`orden` as FLOAT64) as orden,
		safe_cast(`clarubro` as INT64) as clarubro,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`esresultado` as INT64) as esresultado,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`claindicador` as INT64) as claindicador,
		safe_cast(`esporcentaje` as INT64) as esporcentaje,
		safe_cast(`nomindicador` as STRING) as nomindicador,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`clatipocalculo` as INT64) as clatipocalculo,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`nomindicadoren` as STRING) as nomindicadoren,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`escoloreadosuma` as INT64) as escoloreadosuma,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`claindicadorpadre` as INT64) as claindicadorpadre,
		safe_cast(`clagrupoindicador` as INT64) as clagrupoindicador,
		safe_cast(`esusoeliminaciones` as INT64) as esusoeliminaciones,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`essoloflujoefectivo` as INT64) as essoloflujoefectivo,
		safe_cast(`clausuarioresponsable` as INT64) as clausuarioresponsable,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','CntSch_CNTCatIndicador')}}
)
select * from stg_cntcatindicador