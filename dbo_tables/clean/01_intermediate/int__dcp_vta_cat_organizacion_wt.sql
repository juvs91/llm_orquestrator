with de_duplicacion_vtacatorganizacionwt as (
    select
        _airbyte_raw_id,
        _airbyte_extracted_at,
        _airbyte_meta,
        email,
        nivel,
        clazona,
        idorden,
        clagrupo,
        fechains,
        bajalogica,
        clagerencia,
        clatipozona,
        nombrepcmod,
        _ab_cdc_lsn,
        cladireccion,
        clausuariomod,
        nombretitular,
        claflujocuenta,
        fechaultimamod,
        _ab_cdc_cursor,
        claorganizacion,
        clasubdireccion,
        fechabajalogica,
        nomorganizacion,
        telefonocelular,
        clausuariotitular,
        _ab_cdc_deleted_at,
        _ab_cdc_updated_at,
        clagerenciaregional,
        claniveltopelistaprecio,
        _ab_cdc_event_serial_no,
        claniveltopelistadescuento,
        escuentaautorizacionrequerida
    from {{ ref('stg__vta_cat_organizacion_wt') }}
)

select * from de_duplicacion_vtacatorganizacionwt
