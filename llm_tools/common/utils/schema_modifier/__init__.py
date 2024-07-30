import copy
import re
from typing import List
import os
from llm_tools.common import read_file, concatenate_files_as_object


def _get_constrained_table_name_from_foreign_key(
        fk: str
) -> str:
    regex = r"\[([^\]]*)\]"
    matches = re.findall(regex, fk)
    return matches[2]


def _get_referenced_table_name_from_foreign_key(
        fk: str
) -> str:
    regex = r"\[([^\]]*)\]"
    matches = re.findall(regex, fk)
    return matches[5]


def _get_foreign_key_field(
        fk: str
) -> str:
    regex = r"\(([^\]]*)\)"
    match = re.search(regex, fk)
    if match is None:
        raise Exception(f"No referenced table found in {fk}")
    return match.group(1)


def _get_constrained_table_index_by_name(
        table_name: str,
        tables: List[str]
) -> int:
    regex = r"(?i)CREATE\s+TABLE\s+(" + re.escape(table_name) + r")\s+"
    for index, table in enumerate(tables):
        match = re.search(regex, table)
        if match:
            return index
    raise Exception(f"_get_table_index_by_name:: Table {table_name} not found")


def _add_foreign_key_constraint(
        table_name: str,
        table_sqls: List[str],
        field: str,
        referenced_table: str) -> List[str]:
    table_sql_index = _get_constrained_table_index_by_name(table_name, table_sqls)
    table_sql = table_sqls[table_sql_index]
    lines = table_sql.splitlines()
    text = f"FOREIGN KEY ({field}) REFERENCES {referenced_table}({field}),"
    lines.insert(1, text)
    new_sql = "\n".join(lines)
    table_sqls[table_sql_index] = new_sql
    return table_sqls


def add_foreign_keys(
        schemas: List[str],
        foreign_keys: List[str]
) -> List[str]:
    updated_table_sqls = copy.deepcopy(schemas)
    for fk in foreign_keys:
        table_name = _get_constrained_table_name_from_foreign_key(fk)
        referenced_table = _get_referenced_table_name_from_foreign_key(fk)
        fk_field = _get_foreign_key_field(fk)
        updated_table_sqls = _add_foreign_key_constraint(
            table_name=table_name,
            table_sqls=updated_table_sqls,
            field=fk_field,
            referenced_table=referenced_table
        )

    return updated_table_sqls


if __name__ == "__main__":
    schemas_path = "/Volumes/case-sensitive-volume/LLM_TOOLS/data/data_generation/Operacion/AMPSch/tables"
    foreign_keys_path = "/Volumes/case-sensitive-volume/LLM_TOOLS/data/data_generation/Operacion/AMPSch/fk"
    _schemas = concatenate_files_as_object(schemas_path, ".sql")
    _foreign_keys = concatenate_files_as_object(foreign_keys_path, ".sql")
    _sqls = add_foreign_keys(
        schemas=_schemas,
        foreign_keys=_foreign_keys
    )
    print(*_sqls[0:10], sep="\n\n")
