with de_duplicacion_vtacattipooperacion as (
	select
		*,
		row_number() over(
			partition by clatipooperacion
			order by
				fechaultimamod desc
		) as rownum
	from
		{{ ref('stg__vta_cat_tipo_operacion') }}
),
sel_vtacattipooperacion as (
	select
		_airbyte_raw_id,
		_airbyte_extracted_at,
		_airbyte_meta,
		bajalogica,
		nombrepcmod,
		_ab_cdc_lsn,
		clausuariomod,
		fechaultimamod,
		_ab_cdc_cursor,
		fechabajalogica,
		clatipooperacion,
		nomtipooperacion,
		_ab_cdc_deleted_at,
		_ab_cdc_updated_at,
		nomtipooperacioning,
		_ab_cdc_event_serial_no
		from de_duplicacion_vtacattipooperacion
	where
		rownum = 1
)
select
	*
from
	sel_vtacattipooperacion