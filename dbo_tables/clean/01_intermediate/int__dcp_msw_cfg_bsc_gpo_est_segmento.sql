with de_duplicacion_mswcfgbscgpoestsegmento as ( 
select _airbyte_raw_id,
		_airbyte_extracted_at,
		_airbyte_meta,
		clasegmento,
		nomsegmento,
		nombrepcmod,
		_ab_cdc_lsn,
		clausuariomod,
		fechaultimamod,
		_ab_cdc_cursor,
		_ab_cdc_deleted_at,
		_ab_cdc_updated_at,
		nomgrupomismonombre,
		clagrupoestadistico1,
		clagrupoestadistico2,
		clagrupoestadistico3,
		clasegmentomanufactura,
		_ab_cdc_event_serial_no,
		CASE WHEN clasegmento = 1006 THEN NULL ELSE clasegmento END AS clamarketsegment
		from {{ref('stg__msw_cfg_bsc_gpo_est_segmento')}}
 )
 select * from 
 de_duplicacion_mswcfgbscgpoestsegmento