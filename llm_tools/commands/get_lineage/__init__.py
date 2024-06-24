from typing import Any, Dict
from llm_tools.common.Nodes.graph_builder import build_graph_from_config
from llm_tools.common.origin_mapping import get_origin
from llm_tools.common.origin_mapping.bigquery_tables import get_bigquery_tables


def _add_origins(
        data: Dict[str, Any],
        dbt_table_path: str,
) -> Dict[str, Any]:
    for match in data["MATCHES"]:
        view_name = match["NOMBRE_VISTA"]
        field_name = match["NOMBRE_CAMPO_VISTA"]
        origin_schema_table = get_origin(views_directory=dbt_table_path, view_name=view_name, field_name=field_name)
        if origin_schema_table.__contains__("_"):
            components = origin_schema_table.split("_")
            schema = components[0]
            table = components[1]
            match["ORIGIN_TABLE"] = table
            match["ORIGIN_SCHEMA"] = schema
        else:
            match["ORIGIN_TABLE"] = origin_schema_table
            match["ORIGIN_SCHEMA"] = "NOT FOUND"
        table_origins = get_bigquery_tables(match["ORIGIN_TABLE"])
        match["TABLE_ORIGIN"] = table_origins

    return data


def get_lineage(
        user_prompt: str,
        lineage_graph_config_path: str,
        dbt_table_path: str
) -> Any:
    graph = build_graph_from_config(lineage_graph_config_path)
    graph.set_context("user_prompt", user_prompt)
    context_result = graph.process_input()
    result = context_result.get("result_object")
    result = _add_origins(data=result, dbt_table_path=dbt_table_path)

    return result
