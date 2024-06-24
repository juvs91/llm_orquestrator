with stg_concatcuentadependenciaeng as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_concatcuentadependenciaeng,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`nivel` as INT64) as nivel,
		safe_cast(`estatus` as INT64) as estatus,
		safe_cast(`clacuenta` as INT64) as clacuenta,
		safe_cast(`esafectable` as INT64) as esafectable,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`clacuentahija` as INT64) as clacuentahija,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`clatipocatalogo` as INT64) as clatipocatalogo,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','ConSch_ConCatCuentaDependenciaEng')}}
)
select * from stg_concatcuentadependenciaeng