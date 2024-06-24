{{ config(materialized='table') }}
WITH
CAT_ORGANIZACION_WT 
AS
(
	SELECT
        claorganizacion AS cla_organizacion,
        nivel,
        nomorganizacion as nom_organizacion,
        clagrupo AS cla_grupo,
        cladireccion AS cla_direccion,
        clasubdireccion AS cla_sub_direccion,
        clagerenciaregional AS cla_gerencia_regional,
        clagerencia AS cla_gerencia,
        clazona AS cla_zona
	FROM {{ref('stg__vta_cat_organizacion_wt')}}
),
CAT_ORGANIZACION_WT_GRUPO
AS
(
	SELECT
        claorganizacion AS cla_organizacion,
        nomorganizacion AS nom_grupo
	FROM  {{ref('stg__vta_cat_organizacion_wt')}}
	WHERE	nivel	= 10
),

CAT_ORGANIZACION_WT_DIRECCION
AS
(
	SELECT
        claorganizacion AS cla_organizacion,
        nomorganizacion AS nom_direccion	
	FROM  {{ref('stg__vta_cat_organizacion_wt')}}
	WHERE	nivel	= 20
),

CAT_ORGANIZACION_WT_SUBDIRECCION
AS
(
	SELECT
			claorganizacion AS cla_organizacion	,
			nomorganizacion	AS nom_sub_direccion
	FROM  {{ref('stg__vta_cat_organizacion_wt')}}
	WHERE	nivel	= 30
),

CAT_ORGANIZACION_WT_GERENCIA_REGIONAL
AS
(
	SELECT
			claorganizacion AS cla_organizacion	,
			nomorganizacion	AS nom_gerencia_regional
	FROM  {{ref('stg__vta_cat_organizacion_wt')}}
	WHERE	nivel	= 40
),

CAT_ORGANIZACION_WT_GERENCIA
AS
(
	SELECT
			claorganizacion	AS cla_organizacion,
			nomorganizacion	as nom_gerencia
	FROM  {{ref('stg__vta_cat_organizacion_wt')}}
	WHERE	nivel	= 45
),

CAT_ORGANIZACION_WT_ZONA
AS
(
	SELECT
			claorganizacion as cla_organizacion	,
			nomorganizacion	as nom_zona
	FROM  {{ref('stg__vta_cat_organizacion_wt')}}
	WHERE	nivel	= 50
),
MST_ORGANIZACION_VTA_VW
AS
(
		SELECT
			cwt.cla_organizacion,
			cwt.nivel,
			cwt.nom_organizacion,
			cwt.cla_grupo,
			cg.nom_grupo,
			cwt.cla_direccion,
			cd.nom_direccion,
			cwt.cla_sub_direccion,
			cs.nom_sub_direccion,
			cwt.cla_gerencia_regional,
			CASE WHEN cwt.cla_gerencia_regional = 477 THEN 'WHOLESALE USA' ELSE cr.nom_gerencia_regional END AS nom_gerencia_regional,
			cwt.cla_gerencia,
			cge.nom_gerencia,
			cwt.cla_zona,
			cz.nom_zona
	FROM CAT_ORGANIZACION_WT cwt
	LEFT JOIN CAT_ORGANIZACION_WT_GRUPO cg ON cwt.cla_grupo = cg.cla_organizacion
	LEFT JOIN CAT_ORGANIZACION_WT_DIRECCION cd ON cwt.cla_direccion = cd.cla_organizacion
	LEFT JOIN CAT_ORGANIZACION_WT_SUBDIRECCION cs ON cwt.cla_sub_direccion = cs.cla_organizacion
	LEFT JOIN CAT_ORGANIZACION_WT_GERENCIA_REGIONAL cr ON cwt.cla_gerencia_regional = cr.cla_organizacion
	LEFT JOIN CAT_ORGANIZACION_WT_GERENCIA cge ON cwt.cla_gerencia = cge.cla_organizacion
	LEFT JOIN CAT_ORGANIZACION_WT_ZONA cz ON cwt.cla_zona = cz.cla_organizacion
)

SELECT * FROM MST_ORGANIZACION_VTA_VW
