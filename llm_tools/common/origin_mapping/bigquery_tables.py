from google.cloud import bigquery
import decimal

project = "dfor-prj-prod"
dataset = "deadwh_timonitor_abt"
bq_table = "TiTraMovimientoDatosVw"
bq_table_envs = "TiCatServidorAmbiente"
client = bigquery.Client(project=project)


def _is_decimal(value):
    return isinstance(value, decimal.Decimal)


def _convert_data(data):
    converted_data = []
    for item in data:
        # Create a copy to avoid modifying the original dictionary
        converted_item = dict(item)
        for key, value in converted_item.items():
            if _is_decimal(value):
                rounded_value = float(value.quantize(decimal.Decimal('0.001')))
                formatted_string = f"{rounded_value:,.3f}"
                converted_item[key] = formatted_string

        converted_data.append(converted_item)
    return converted_data


def generate_bq_sql(table: str):
    sql = f"""WITH first_query AS (
    SELECT DISTINCT TRIM(LOWER(a.Servidor_Origen)) AS Servidor_Origen,
                    TRIM(LOWER(a.BD_Origen)) AS BD_Origen,
                    TRIM(LOWER(a.Esquema_Origen)) AS Esquema_Origen,
                    a.Tabla_Origen,
                    'first' AS query_source
    FROM `{project}.{dataset}.{bq_table}` a
    INNER JOIN `{project}.{dataset}.{bq_table_envs}` b 
    ON a.Servidor_Origen = b.Servidor AND b.Ambiente = 'Producción'
    WHERE Tabla_Origen = '{table}'
    AND TipoObjeto LIKE '%Replica%'
),
second_query AS (
    SELECT DISTINCT TRIM(LOWER(a.Servidor_Origen)) AS Servidor_Origen,
                    TRIM(LOWER(a.BD_Origen)) AS BD_Origen,
                    TRIM(LOWER(a.Esquema_Origen)) AS Esquema_Origen,
                    a.Tabla_Origen,
                    'second' AS query_source
    FROM `{project}.{dataset}.{bq_table}` a
    INNER JOIN `{project}.{dataset}.{bq_table_envs}` b 
    ON a.Servidor_Origen = b.Servidor AND b.Ambiente = 'Producción'
    WHERE Tabla_Origen = '{table}'
),
combined_query AS (
    SELECT * FROM first_query
    UNION ALL
    SELECT * FROM second_query
)
SELECT Servidor_Origen, BD_Origen, Esquema_Origen, Tabla_Origen
FROM combined_query
WHERE query_source = 'first'
UNION ALL
SELECT Servidor_Origen, BD_Origen, Esquema_Origen, Tabla_Origen
FROM combined_query
WHERE query_source = 'second'
AND NOT EXISTS (
    SELECT 1
    FROM combined_query
    WHERE query_source = 'first'
);"""
    return sql


def get_bigquery_tables(table: str):
    sql = generate_bq_sql(table)
    print("Query", sql)
    query_job = client.query(sql)
    rows = query_job.result()
    results = []
    for row in rows:
        results.append(dict(row))
    print("result", results, flush=True)
    results = _convert_data(results)
    return results
