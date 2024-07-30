with stg_mswcatcategoria as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_mswcatcategoria,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`claniv1` as INT64) as claniv1,
		safe_cast(`claniv2` as INT64) as claniv2,
		safe_cast(`claniv3` as INT64) as claniv3,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`esinvplanta` as INT64) as esinvplanta,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`aplicaventas` as INT64) as aplicaventas,
		safe_cast(`clacategoria` as INT64) as clacategoria,
		safe_cast(`expvtacompra` as INT64) as expvtacompra,
		safe_cast(`nomcategoria` as STRING) as nomcategoria,
		safe_cast(`aplicacompras` as INT64) as aplicacompras,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`clavecategoria` as STRING) as clavecategoria,
		safe_cast(`esinventariado` as INT64) as esinventariado,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`clatipoinventario` as INT64) as clatipoinventario,
		safe_cast(`nomcategoriaingles` as STRING) as nomcategoriaingles,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`clavecuentainventario` as STRING) as clavecuentainventario,
		safe_cast(`nomcategoriaotroidioma` as STRING) as nomcategoriaotroidioma,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no
	from {{source('src_prod_kraken_abt','FESCH_MSWCatCategoria')}}
)
select * from stg_mswcatcategoria