{{ config(materialized='table') }}
WITH
RAW_CAT_CIUDAD
AS
(
    SELECT
            CLAPAIS     AS cla_pais,
    		CLAESTADO   AS cla_estado,
    		CLACIUDADUNICO AS cla_ciudad_unico,
    		NOMCIUDAD	AS nom_ciudad
    FROM {{ref('stg__vta_cat_ciudad')}}
),
RAW_CAT_ESTADO
AS
(
    SELECT
            CLAESTADO    AS cla_estado,
    		NOMESTADO	AS nom_estado,
            CLAPAIS    AS cla_pais
    FROM {{ref('stg__vta_cat_estado')}}
),
RAW_CAT_PAIS
AS
(
    SELECT
            CLAPAIS    AS cla_pais,
    		NOMPAIS    AS nom_pais
    FROM {{ref('stg__vta_cat_pais')}}
),
MST_CIUDAD_VW
AS
(
    SELECT
            ciudad.cla_pais,
    		pais.nom_pais,
    		ciudad.cla_estado,
    		estado.nom_estado,
    		ciudad.cla_ciudad_unico,
    		ciudad.nom_ciudad
    FROM RAW_CAT_CIUDAD ciudad
    LEFT JOIN RAW_CAT_ESTADO estado ON ciudad.cla_estado = estado.cla_estado AND ciudad.cla_pais = estado.cla_pais
    LEFT JOIN RAW_CAT_PAIS pais ON estado.cla_pais = pais.cla_pais
)

SELECT * FROM MST_CIUDAD_VW