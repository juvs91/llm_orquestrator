from llm_tools.common import find_file_in_directory_return_content, iterate_files
import re
from anthropic import AnthropicVertex
import os

_GET_ORIGIN_SYSTEM_PROMPT = """Eres un experto en DBT y en SQL, el usuario proporcionará el nombre de un campo junto con una VISTA de DBT, regresa al usuario el origen del cual el campo origina.
Tu respuesta solo será la tabla origen o de referencia, una palabra y nada más, no agregues información adicional. Incluye el nombre de la tabla tal cual como esta en el texto, incluyendo caracteres especiales como guiones bajos "-"
Ejemplos de respuesta: 
dbo_VtaCatClienteUnico
dbo_table
man_table_table
PALSch_PalCatInsumoCompra
JULSsc_Tabla
""".strip()

MODEL = "claude-3-opus@20240229"
REGION = "us-east5"
PROJECT_ID = "dea-analytics-prj-gemini"


def _get_origin_getter_model() -> AnthropicVertex:
    client = AnthropicVertex(region=REGION, project_id=PROJECT_ID)
    return client


def _get_field_origin_table(dbt_content, field_name) -> str:
    client = _get_origin_getter_model()
    prompt = f"""Campo a buscar:{field_name} Vista DBT: {dbt_content}"""
    message = client.messages.create(
        max_tokens=4096,
        system=_GET_ORIGIN_SYSTEM_PROMPT,
        messages=[
            {
                "role": "user",
                "content": prompt,
            }
        ],
        model=MODEL,
        temperature=0
    )
    return message.content[0].text


def _get_view(
        views_directory: str,
        view_name: str
):
    regex = r"(SELECT|select)\s+\*\s+(from|FROM)\s+(" + re.escape(view_name) + r")\b"
    for _file_content, _file_path in iterate_files(views_directory, ".sql"):
        _file_content = _file_content.strip()
        match = re.search(regex, _file_content, re.MULTILINE)
        if match:
            return _file_content, _file_path
    raise ValueError(f"View {view_name} was not found in {views_directory}")


def has_dbt_prefix(table: str) -> bool:
    if table.startswith("stg_") or table.startswith("con_") or table.startswith("int_"):
        return True
    else:
        return False


def get_origin(
        views_directory: str,
        view_name: str,
        field_name: str,
) -> str:
    try:
        _file_content, _file_path = _get_view(
            views_directory=views_directory,
            view_name=view_name
        )
        print(f"Finding origin of field '{field_name}' from view '{view_name}'")
        print(f"Found view {view_name} in {_file_path}")
        print("Calling llm to find origin table")
        origin_table = _get_field_origin_table(_file_content, field_name)
        print("Origin table:", origin_table)

        while has_dbt_prefix(origin_table):
            print(f"Finding file of {origin_table}.sql")
            view_content = find_file_in_directory_return_content(views_directory, f"{origin_table}.sql")
            print(f"Found content of {origin_table}.sql, calling llm to find origin of field {field_name}")
            origin_table = _get_field_origin_table(view_content, field_name)
        print(f"Found origin of field '{field_name}' from view '{view_name}' to be '{origin_table}'")
    except Exception as error:
        print(f"Could not find origin of field {field_name} of view {view_name}:", error)
        return "NOT FOUND"
    return origin_table


if __name__ == "__main__":
    os.environ.setdefault(
        "GOOGLE_APPLICATION_CREDENTIALS",
        "/Volumes/case-sensitive-volume/llm_test/data-chat-credentials.json"
    )
    get_origin(
        views_directory="/Volumes/case-sensitive-volume/llm_test/data/dbo_tables",
        view_name="stg_artcatarticuloace",
        field_name="claarticulo"
    )
