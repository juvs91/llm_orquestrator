with de_duplicacion_ti_tra_usuario as (
    select
        *,
        row_number() over (
            partition by idusuario
            order by fechaultimamod desc
        ) as rownum
    from {{ ref('stg__ti_tra_usuario') }}
),

sel_ti_tra_usuario as (
    select
        pk_titrausuario,
        _airbyte_raw_id,
        _airbyte_extracted_at,
        _airbyte_meta,
        rfc,
        email,
        clacrc,
        perfil,
        puesto,
        dominio,
        fechains,
        bloqueado,
        clapuesto,
        idusuario,
        bajalogica,
        bajanomina,
        claempleado,
        nombrepcmod,
        _ab_cdc_lsn,
        emailalterno,
        nombreperfil,
        telefonocasa,
        clausuarioins,
        clausuariomod,
        loginusername,
        nombreusuario,
        fechaultimamod,
        idempleadojefe,
        _ab_cdc_cursor,
        apellidomaterno,
        apellidopaterno,
        fechabajalogica,
        fechanacimiento,
        telefonocelular,
        telefonooficina,
        claidiomadefault,
        dispositivomovil,
        nombremodificable,
        _ab_cdc_deleted_at,
        _ab_cdc_updated_at,
        claubicaciondefault,
        autenticacionactived,
        _ab_cdc_event_serial_no,
        fechaultintentoprincipal,
        intentosfallidosprincipal,
        {{ concat_trim(['nombreusuario', 'apellidopaterno', 'apellidomaterno']) }}
        as nomusuario
    from de_duplicacion_ti_tra_usuario
    where rownum=1
)

select * from sel_ti_tra_usuario
