import os.path
from typing import Any, Dict
from pydantic import BaseModel, field_validator

from llm_tools.common.Nodes import NodeAbstract, NodeConfig, NodeOutput, Graph
from llm_tools.common import save_to_file, concatenate_files_as_object


class ConcatenateFilesConfig(BaseModel):
    next_node: str | None
    directory: str
    file_extension: str
    context_var_to_save: str


class ConcatenateFilesInArrayNode(NodeAbstract):
    def __init__(self, config: NodeConfig, graph: Graph):
        super().__init__(config, graph)
        self.concatenate_files_config: ConcatenateFilesConfig = ConcatenateFilesConfig(**self.config.options)

    def process_input(self) -> NodeOutput:
        value = concatenate_files_as_object(
            directory=self.concatenate_files_config.directory,
            file_extension=self.concatenate_files_config.file_extension
        )
        print("Concatenated files in object")
        self.graph.set_context(
            context_key=self.concatenate_files_config.context_var_to_save,
            context_value=value
        )
        print(f"Node {self.config.name} saved to context {self.concatenate_files_config.context_var_to_save}")
        return NodeOutput(
            next_node=self.concatenate_files_config.next_node
        )
