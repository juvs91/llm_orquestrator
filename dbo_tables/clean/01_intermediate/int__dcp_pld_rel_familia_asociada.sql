with de_duplicacion_pldrelfamiliaasociada as ( 
select _airbyte_raw_id,
		_airbyte_extracted_at,
		_airbyte_meta,
		fechains,
		bajalogica,
		clafamilia,
		nombrepcmod,
		_ab_cdc_lsn,
		clasubfamilia,
		clausuarioins,
		clausuariomod,
		fechaultimamod,
		_ab_cdc_cursor,
		fechabajalogica,
		clafamiliaasociada,
		_ab_cdc_deleted_at,
		_ab_cdc_updated_at,
		_ab_cdc_event_serial_no,
		(100000 + clafamiliaasociada) as idfamiliaasociada
		from {{ref('stg__pld_rel_familia_asociada')}} 
 )
 select * from 

 de_duplicacion_pldrelfamiliaasociada