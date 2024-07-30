with de_duplicacion_cntcatagrupadorempresa as ( 
select _airbyte_raw_id,
		_airbyte_extracted_at,
		_airbyte_meta,
		bajalogica,
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
		_ab_cdc_event_serial_no
		from {{ref('stg__cnt_cat_agrupador_empresa')}}
 )
 select * from 

 de_duplicacion_cntcatagrupadorempresa