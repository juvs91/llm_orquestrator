with VtaRelModeloAtencionNivelCanal as (
	select
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
        safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
        safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
        safe_cast(`BajaLogica` as INT64) as BajaLogica,
        safe_cast(`NombrePcMod` as STRING) as NombrePcMod,
        safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
        safe_cast(`ClaNivelCanal` as INT64) as ClaNivelCanal,
        safe_cast(`ClaUsuarioMod` as INT64) as ClaUsuarioMod,
        safe_cast(`FechaUltimaMod` as DATETIME) as FechaUltimaMod,
        safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
        safe_cast(`FechaBajaLogica` as DATETIME) as FechaBajaLogica,
        safe_cast(`ClaModeloAtencion` as INT64) as ClaModeloAtencion,
        safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
        safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
        safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no,

 	from {{source('src_prod_kraken_abt','VtaSch_VtaRelModeloAtencionNivelCanal')}}
)
select * from VtaRelModeloAtencionNivelCanal
