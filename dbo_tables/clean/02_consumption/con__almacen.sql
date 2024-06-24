{{config(materialized='table')}}
WITH
CAT_ALMACEN
as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_opecatalmacen,
		 _airbyte_raw_id,
		 _airbyte_extracted_at,
		 _airbyte_meta,
		 bajalogica,
		 claalmacen,
		 nomalmacen,
		 nombrepcmod,
		 _ab_cdc_lsn,
		 claubicacion,
		 clausuariomod,
		 fechaultimamod,
		 _ab_cdc_cursor,
		 fechabajalogica,
		 clatipoinventario,
		 _ab_cdc_deleted_at,
		 _ab_cdc_updated_at,
		 ultimonivelafectable,
		 _ab_cdc_event_serial_no,
		 permiteexistencianegativa
	from {{ref('stg__ope_cat_almacen')}}
)
	SELECT
			claalmacen as CLA_ALMACEN,
			clatipoinventario as CLA_TIPO_INVENTARIO,
			claubicacion as CLA_UBICACION,
			nomalmacen as NOM_ALMACEN
	FROM CAT_ALMACEN

