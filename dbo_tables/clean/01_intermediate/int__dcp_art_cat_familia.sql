with de_duplicacion_artcatfamilia as ( 
select _airbyte_raw_id,
		_airbyte_extracted_at,
		_airbyte_meta,
		bajalogica,
		clafamilia,
		esagrupado,
		nomfamilia,
		nombrepcmod,
		_ab_cdc_lsn,
		clavefamilia,
		clausuariomod,
		fechaultimamod,
		_ab_cdc_cursor,
		fechabajalogica,
		nomfamiliaingles,
		clatipoinventario,
		_ab_cdc_deleted_at,
		_ab_cdc_updated_at,
		nomfamiliaotroidioma,
		_ab_cdc_event_serial_no,
		clavefamiliaalfanumerica,
		(200000 + clafamilia) AS clafamiliaasociada,
        ('(' || (clafamilia_string) || ') ' || NOMFAMILIA) AS nomfamiliaasociada,
		(200000 + clafamilia) AS idfamiliaasociada
		from {{ref('stg__art_cat_familia')}} 
 )
 select * from 

 de_duplicacion_artcatfamilia