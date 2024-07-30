with stg_pplcatgrupomaquina as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_pplcatgrupomaquina,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`porcmto` as FLOAT64) as porcmto,
		safe_cast(`porcmts` as FLOAT64) as porcmts,
		safe_cast(`subgrupo` as INT64) as subgrupo,
		safe_cast(`porcpref1` as FLOAT64) as porcpref1,
		safe_cast(`porcpref2` as FLOAT64) as porcpref2,
		safe_cast(`porcpref3` as FLOAT64) as porcpref3,
		safe_cast(`porcpref4` as FLOAT64) as porcpref4,
		safe_cast(`porcpref5` as FLOAT64) as porcpref5,
		safe_cast(`porcpref6` as FLOAT64) as porcpref6,
		safe_cast(`porcpref7` as FLOAT64) as porcpref7,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`nummaquina` as INT64) as nummaquina,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`anchobancada` as FLOAT64) as anchobancada,
		safe_cast(`claubicacion` as INT64) as claubicacion,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`porcsubgrupo1` as FLOAT64) as porcsubgrupo1,
		safe_cast(`factorrelativo` as FLOAT64) as factorrelativo,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`loteminimoprod` as FLOAT64) as loteminimoprod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`clagrupomaquina` as INT64) as clagrupomaquina,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`nomgrupomaquina` as STRING) as nomgrupomaquina,
		safe_cast(`claareaproduccion` as INT64) as claareaproduccion,
		safe_cast(`clavegrupomaquina` as INT64) as clavegrupomaquina,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','PplSch_PPLCatGrupoMaquina')}}
)
select * from stg_pplcatgrupomaquina