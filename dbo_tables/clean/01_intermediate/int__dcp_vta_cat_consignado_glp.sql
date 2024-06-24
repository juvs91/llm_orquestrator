with de_duplicacion_vtacatconsignadoglp as ( 
select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_vtacatconsignadoglp,
		_airbyte_raw_id,
		_airbyte_extracted_at,
		_airbyte_meta,
		radio,
		latitud,
		longitud,
		bajalogica,
		_ab_cdc_lsn,
		claconsignado,
		fechaultimamod,
		_ab_cdc_cursor,
		claclienteunico,
		_ab_cdc_deleted_at,
		_ab_cdc_updated_at,
		_ab_cdc_event_serial_no
		from {{ref('stg__vta_cat_consignado_glp')}}
 )
select * from de_duplicacion_vtacatconsignadoglp