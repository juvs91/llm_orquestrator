with stg_flecatchofer as (
	select
		--{{ dbt_utils.generate_surrogate_key(['col_pk1', 'col_pk2']) }} as pk_flecatchofer,
		safe_cast(`_airbyte_raw_id` as STRING) as _airbyte_raw_id,
		safe_cast(`_airbyte_extracted_at` as TIMESTAMP) as _airbyte_extracted_at,
		safe_cast(`_airbyte_meta` as JSON) as _airbyte_meta,
		safe_cast(`rfc` as STRING) as rfc,
		safe_cast(`curp` as STRING) as curp,
		safe_cast(`calle` as STRING) as calle,
		safe_cast(`email` as STRING) as email,
		safe_cast(`nombre` as STRING) as nombre,
		safe_cast(`colonia` as STRING) as colonia,
		safe_cast(`folioine` as STRING) as folioine,
		safe_cast(`claestado` as INT64) as claestado,
		safe_cast(`municipio` as STRING) as municipio,
		safe_cast(`numeroext` as STRING) as numeroext,
		safe_cast(`numeroint` as STRING) as numeroint,
		safe_cast(`bajalogica` as INT64) as bajalogica,
		safe_cast(`numeroimss` as STRING) as numeroimss,
		safe_cast(`reqregimss` as INT64) as reqregimss,
		safe_cast(`idchofercen` as INT64) as idchofercen,
		safe_cast(`nombrepcmod` as STRING) as nombrepcmod,
		safe_cast(`numerolocal` as STRING) as numerolocal,
		safe_cast(`_ab_cdc_lsn` as STRING) as _ab_cdc_lsn,
		safe_cast(`eslistanegra` as INT64) as eslistanegra,
		safe_cast(`idchoferalta` as INT64) as idchoferalta,
		safe_cast(`claantiguedad` as INT64) as claantiguedad,
		safe_cast(`clausuariomod` as INT64) as clausuariomod,
		safe_cast(`escertificado` as INT64) as escertificado,
		safe_cast(`numerocelular` as STRING) as numerocelular,
		safe_cast(`claestadocivil` as INT64) as claestadocivil,
		safe_cast(`fechaultimamod` as DATETIME) as fechaultimamod,
		safe_cast(`numerolicencia` as STRING) as numerolicencia,
		safe_cast(`_ab_cdc_cursor` as INT64) as _ab_cdc_cursor,
		safe_cast(`apellidomaterno` as STRING) as apellidomaterno,
		safe_cast(`apellidopaterno` as STRING) as apellidopaterno,
		safe_cast(`fechabajalogica` as DATETIME) as fechabajalogica,
		safe_cast(`fechanacimiento` as DATETIME) as fechanacimiento,
		safe_cast(`lugarnacimiento` as STRING) as lugarnacimiento,
		safe_cast(`claubicacionalta` as INT64) as claubicacionalta,
		safe_cast(`vigencialicencia` as DATETIME) as vigencialicencia,
		safe_cast(`numerocertificado` as STRING) as numerocertificado,
		safe_cast(`clacausalistanegra` as INT64) as clacausalistanegra,
		safe_cast(`fotografiawfileext` as STRING) as fotografiawfileext,
		safe_cast(`_ab_cdc_deleted_at` as STRING) as _ab_cdc_deleted_at,
		safe_cast(`_ab_cdc_updated_at` as STRING) as _ab_cdc_updated_at,
		safe_cast(`clatransportistacen` as INT64) as clatransportistacen,
		safe_cast(`fotografiawfilename` as STRING) as fotografiawfilename,
		safe_cast(`fotografiawfilepath` as STRING) as fotografiawfilepath,
		safe_cast(`vigenciacertificado` as DATETIME) as vigenciacertificado,
		safe_cast(`claantiguedadanterior` as INT64) as claantiguedadanterior,
		safe_cast(`claempresacertificadora` as INT64) as claempresacertificadora,
		safe_cast(`_ab_cdc_event_serial_no` as STRING) as _ab_cdc_event_serial_no,
		safe_cast(`clatransportistacenanterior` as INT64) as clatransportistacenanterior
	from {{source('src_prod_kraken_abt','FleSch_FLECatChofer')}}
)
select * from stg_flecatchofer