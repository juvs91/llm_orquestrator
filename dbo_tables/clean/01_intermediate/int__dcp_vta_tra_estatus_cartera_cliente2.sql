with de_duplicacion_vtatraestatuscarteracliente2 as (
	select
		_airbyte_raw_id,
		_airbyte_extracted_at,
		_airbyte_meta,
		clamoneda,
		sobregiro,
		nombrepcmod,
		_ab_cdc_lsn,
		estatusfinal,
		estatuspaso1,
		clausuariomod,
		limitecredito,
		porcsobregiro,
		fechaultimamod,
		importecartera,
		_ab_cdc_cursor,
		claclienteunico,
		estatussobregiro,
		porcfactvencidas,
		claofertaservicio,
		creditodisponible,
		estatusdiasatraso,
		tiene45diasatraso,
		estatusfinalmesant,
		_ab_cdc_deleted_at,
		_ab_cdc_updated_at,
		estatusfactvencidas,
		estatusrecuperacion,
		importefactvencidas,
		tienecontadosatpend,
		porcdiasatrasomesant,
		porcrecuperacionmesant,
		_ab_cdc_event_serial_no,
        CASE WHEN IFNULL(estatusfinal,-1) = 1	 THEN 'VERDE'
				 WHEN IFNULL(estatusfinal,-1) = 2 THEN 'AMARILLO'
				 WHEN IFNULL(estatusfinal,-1) = 3 THEN 'ROJO'
				 ELSE 'OTROS'
			END	AS nomestatuscarteracuc
		from {{ref('stg__vta_tra_estatus_cartera_cliente2')}}	
)
select
	*
from
	de_duplicacion_vtatraestatuscarteracliente2