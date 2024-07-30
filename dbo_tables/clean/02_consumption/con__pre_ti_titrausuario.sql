{{ config(materialized='table') }}

with pre_ti_titrausuario as (
    select
        --pk_titrausuario,
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
        emailalterno,
        nombreperfil,
        telefonocasa,
        clausuarioins,
        clausuariomod,
        loginusername,
        nombreusuario,
        fechaultimamod,
        idempleadojefe,
        apellidomaterno,
        apellidopaterno,
        fechabajalogica,
        fechanacimiento,
        telefonocelular,
        telefonooficina,
        claidiomadefault,
        dispositivomovil,
        nombremodificable,
        claubicaciondefault,
        autenticacionactived,
        fechaultintentoprincipal,
        intentosfallidosprincipal
    from {{ ref('stg__ti_tra_usuario') }}
)

select * from pre_ti_titrausuario
