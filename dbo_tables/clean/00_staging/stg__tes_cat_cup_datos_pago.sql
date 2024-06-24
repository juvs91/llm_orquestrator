with stg_tescatcupdatospago as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_tescatcupdatospago,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`clabe` as STRING) as clabe,
		safe_cast(`esach` as INT64) as esach,
		safe_cast(`achaba` as STRING) as achaba,
		safe_cast(`clacup` as INT64) as clacup,
		safe_cast(`eswire` as INT64) as eswire,
		safe_cast(`esswift` as INT64) as esswift,
		safe_cast(`clabanco` as INT64) as clabanco,
		safe_cast(`claswift` as INT64) as claswift,
		safe_cast(`clamoneda` as INT64) as clamoneda,
		safe_cast(`fechaalta` as DATETIME) as fechaalta,
		safe_cast(`nombrecup` as STRING) as nombrecup,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`claestatus` as INT64) as claestatus,
		safe_cast(`clapaiscon` as INT64) as clapaiscon,
		safe_cast(`escuentaffc` as INT64) as escuentaffc,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`numsucursal` as INT64) as numsucursal,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`claestadocon` as INT64) as claestadocon,
		safe_cast(`numcuentaffc` as STRING) as numcuentaffc,
		safe_cast(`subcuentaffc` as STRING) as subcuentaffc,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`nombretitular` as STRING) as nombretitular,
		safe_cast(`claempresaalta` as INT64) as claempresaalta,
		safe_cast(`claroutingcode` as STRING) as claroutingcode,
		safe_cast(`clausuarioalta` as INT64) as clausuarioalta,
		safe_cast(`cuentabancaria` as STRING) as cuentabancaria,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`nombrebancoffc` as STRING) as nombrebancoffc,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`clacupdatospago` as INT64) as clacupdatospago,
		safe_cast(`clamunicipiocon` as INT64) as clamunicipiocon,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`clatipocuentacup` as INT64) as clatipocuentacup,
		safe_cast(`clatipodoctopago` as INT64) as clatipodoctopago,
		safe_cast(`fechacancelacion` as DATETIME) as fechacancelacion,
		safe_cast(`clacupdatospago_l` as INT64) as clacupdatospago_l,
		safe_cast(`clausuariocancela` as INT64) as clausuariocancela,
		safe_cast(`cuentabancariaach` as STRING) as cuentabancariaach,
		safe_cast(`cuentahabienteffc` as STRING) as cuentahabienteffc,
		safe_cast(`escuentaenviada_l` as INT64) as escuentaenviada_l,
		safe_cast(`motivocancelacion` as STRING) as motivocancelacion,
		safe_cast(`cartaresponsivaext` as STRING) as cartaresponsivaext,
		safe_cast(`documentofiscalext` as STRING) as documentofiscalext,
		safe_cast(`esachdiferentewire` as INT64) as esachdiferentewire,
		safe_cast(`esrechazoenviado_l` as INT64) as esrechazoenviado_l,
		safe_cast(`nombretitularbanco` as STRING) as nombretitularbanco,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`cladepartamentoalta` as INT64) as cladepartamentoalta,
		safe_cast(`extarchivodatospago` as STRING) as extarchivodatospago,
		safe_cast(`clabancointermediario` as INT64) as clabancointermediario,
		safe_cast(`clacupdatospagoorigen` as INT64) as clacupdatospagoorigen,
		safe_cast(`comprobantebanxicoext` as STRING) as comprobantebanxicoext,
		safe_cast(`fechaultimaautorizacion` as DATETIME) as fechaultimaautorizacion,
		safe_cast(`fechaultimamoddatospago` as DATETIME) as fechaultimamoddatospago,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no,
		safe_cast(`esbancointermediariodefault` as INT64) as esbancointermediariodefault
	from {{source('src_prod_kraken_abt','dbo_TesCatCUPDatosPago')}}
)
select * from stg_tescatcupdatospago