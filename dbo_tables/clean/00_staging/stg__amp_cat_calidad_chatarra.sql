with stg_ampcatcalidadchatarra as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_ampcatcalidadchatarra,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`esartimmex` as INT64) as esartimmex,
		safe_cast(`descripcion` as STRING) as descripcion,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`claarticuloaceria` as INT64) as claarticuloaceria,
		safe_cast(`claarticulopatios` as INT64) as claarticulopatios,
		safe_cast(`claclasifarticulo` as INT64) as claclasifarticulo,
		safe_cast(`clacalidadchatarra` as INT64) as clacalidadchatarra,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`clavearticuloaceria` as STRING) as clavearticuloaceria,
		safe_cast(`clavearticulopatios` as STRING) as clavearticulopatios,
		safe_cast(`porcdescuentosuelta` as FLOAT64) as porcdescuentosuelta,
		safe_cast(`porccontaminacionsuelta` as FLOAT64) as porccontaminacionsuelta,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','AMPSch_AmpCatCalidadChatarra')}}
)
select * from stg_ampcatcalidadchatarra