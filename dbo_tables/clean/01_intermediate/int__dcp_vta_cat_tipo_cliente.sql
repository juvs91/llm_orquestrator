with de_duplicacion_vtacattipocliente as (
	select
		*,
		row_number() over(
			partition by clatipocliente
			order by
				fechaultimamod desc
		) as rownum
	from
		{{ ref('stg__vta_cat_tipo_cliente') }}
),
sel_vtacattipocliente as (
	select
		_airbyte_raw_id,
		_airbyte_extracted_at,
		_airbyte_meta,
		bajalogica,
		nombrepcmod,
		_ab_cdc_lsn,
		clausuariomod,
		clatipocliente,
		fechaultimamod,
		nomtipocliente,
		_ab_cdc_cursor,
		fechabajalogica,
		nomtipoclienteing,
		_ab_cdc_deleted_at,
		_ab_cdc_updated_at,
		_ab_cdc_event_serial_no
	from
		de_duplicacion_vtacattipocliente
	where
		rownum = 1
)
select
	*
from
	sel_vtacattipocliente