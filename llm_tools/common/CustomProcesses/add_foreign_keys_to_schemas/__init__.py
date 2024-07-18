from typing import List, Any, Dict

from llm_tools.common.CustomProcesses import CustomProcess, CustomProcessOutput
from llm_tools.common.utils.schema_modifier import add_foreign_keys


class AddForeignKeysToSchemas(CustomProcess):
    def __init__(self):
        print("Initialized Custom Process:: AddForeignKeysToSchemas")


    @staticmethod
    def _validate_args(args: Dict[str, Any]) -> None:
        if not isinstance(args["schemas"], list):
            raise Exception("AddForeignKeysToSchemas:: args[0] first argument is not a list")
        if not isinstance(args["foreign_key_statements"], list):
            raise Exception("AddForeignKeysToSchemas:: args[1] second argument is not a list")

    def process(self, args: Dict[str, Any]) -> CustomProcessOutput:
        AddForeignKeysToSchemas._validate_args(args)
        schemas = args["schemas"]
        foreign_key_statements = args["foreign_key_statements"]
        updated_schemas = add_foreign_keys(schemas=schemas, foreign_keys=foreign_key_statements)
        return CustomProcessOutput(
            output={
                "updated_schemas": updated_schemas
            }
        )

