from typing import Dict, Type

from llm_tools.common.CustomProcesses import CustomProcess
from llm_tools.common.CustomProcesses.add_foreign_keys_to_schemas import AddForeignKeysToSchemas
from pydantic import BaseModel, field_validator

AVAILABLE_CUSTOM_PROCESSES: Dict[str, Type[CustomProcess]] = {
    "ADD_FOREIGN_KEYS_TO_SCHEMAS": AddForeignKeysToSchemas
}


class CustomProcessName(BaseModel):
    custom_process_name: str

    @field_validator('custom_process_name')
    @classmethod
    def validate_custom_process_name(cls, value: str):
        assert value in AVAILABLE_CUSTOM_PROCESSES, f"Custom process {value} not in available custom processes"
        return value


def get_custom_process(name: str) -> CustomProcess:
    custom_process_name: CustomProcessName = CustomProcessName(
        custom_process_name=name
    )
    return AVAILABLE_CUSTOM_PROCESSES[custom_process_name.custom_process_name]()
