with stg_catmarca as (
	select
		*
	from {{source('src_prod_kraken_abt','VtaSch_VtaCatMarca')}}
)
select * from stg_catmarca