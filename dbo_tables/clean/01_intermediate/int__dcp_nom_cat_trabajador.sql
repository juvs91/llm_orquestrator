with de_duplicacion_nom_cat_trabajador as (
    select *
    ,
    row_number() over(
    partition by clatrabajador, clanomina, claubicacion, claempresa
    order by fechaultimamod desc
    ) as rownum
    from {{ ref('stg__nom_cat_trabajador') }}
),

sel_nom_cat_trabajador as (
    select
        pk_nomcattrabajador,
        _airbyte_raw_id,
        _airbyte_extracted_at,
        _airbyte_meta,
        cup,
        nss,
        rfc,
        sexo,
        cp_sat,
        clacrc,
        claarea,
        clajefe,
        clapais,
        clabanco,
        esactivo,
        fechains,
        telefono,
        claestado,
        clanomina,
        clapuesto,
        codpostal,
        direccion,
        estadoisn,
        bajalogica,
        clacolonia,
        claempresa,
        claentidad,
        clajefeeun,
        claliqimss,
        clacriterio,
        gruposeguro,
        nombrepcmod,
        _ab_cdc_lsn,
        clamunicipio,
        claubicacion,
        fechaingreso,
        numerocuenta,
        clatrabajador,
        clausuarioins,
        clausuariomod,
        salariodiario,
        claestadocivil,
        fechaultimamod,
        _ab_cdc_cursor,
        apellidomaterno,
        apellidopaterno,
        cladepartamento,
        fechabajalogica,
        fechanacimiento,
        clatrabajadoreun,
        nombretrabajador,
        clagrupoasignacion,
        _ab_cdc_deleted_at,
        _ab_cdc_updated_at,
        _ab_cdc_event_serial_no,
        trim(nombretrabajador)
        || ' '
        || trim(apellidopaterno)
        || ' '
        || trim(apellidomaterno) as nomtrabajador

    from de_duplicacion_nom_cat_trabajador
    where rownum = 1
)

select *
from sel_nom_cat_trabajador
