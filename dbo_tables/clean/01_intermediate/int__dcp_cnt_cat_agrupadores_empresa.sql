with de_duplicacion_cntcatagrupadoresempresa as ( 
select _airbyte_raw_id,
		_airbyte_extracted_at,
		_airbyte_meta,
		bajalogica,
		claaniomes,
		nombrepcmod,
		_ab_cdc_lsn,
		clausuariomod,
		fechaultimamod,
		_ab_cdc_cursor,
		fechabajalogica,
		_ab_cdc_deleted_at,
		_ab_cdc_updated_at,
		claagrupadorempresa,
		nomagrupadorempresa,
		claempresaeliminadora,
		_ab_cdc_event_serial_no
		from {{ref('stg__cnt_cat_agrupadores_empresa')}} 
 )
 select * from 

 de_duplicacion_cntcatagrupadoresempresa