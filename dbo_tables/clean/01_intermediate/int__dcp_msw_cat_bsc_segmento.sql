with de_duplicacion_mswcatbscsegmento as ( 
select _airbyte_raw_id,
		_airbyte_extracted_at,
		_airbyte_meta,
		bajalogica,
		clasegmento,
		nomsegmento,
		nombrepcmod,
		_ab_cdc_lsn,
		clausuariomod,
		fechaultimamod,
		_ab_cdc_cursor,
		fechabajalogica,
		clasegmentopadre,
		_ab_cdc_deleted_at,
		_ab_cdc_updated_at,
		_ab_cdc_event_serial_no,
		CASE (nomsegmento) WHEN 'OTHER' THEN NULL ELSE (nomsegmento) END as nommarketsegment
		from {{ref('stg__msw_cat_bsc_segmento')}}
 )
 select * from 
 de_duplicacion_mswcatbscsegmento