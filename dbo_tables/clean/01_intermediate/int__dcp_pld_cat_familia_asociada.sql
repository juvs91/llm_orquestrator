with de_duplicacion_pldcatfamiliaasociada as ( 
select _airbyte_raw_id,
		_airbyte_extracted_at,
		_airbyte_meta,
		fechains,
		bajalogica,
		nombrepcmod,
		_ab_cdc_lsn,
		clausuarioins,
		clausuariomod,
		fechaultimamod,
		_ab_cdc_cursor,
		fechabajalogica,
		clafamiliaasociada,
		(100000 + clafamiliaasociada) AS idfamiliaasociada,
		nomfamiliaasociada,
		_ab_cdc_deleted_at,
		_ab_cdc_updated_at,
		_ab_cdc_event_serial_no
		from {{ref('stg__pld_cat_familia_asociada')}}
 )
 select * from 

 de_duplicacion_pldcatfamiliaasociada