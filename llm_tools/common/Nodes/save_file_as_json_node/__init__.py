import json
import os.path
from typing import Any
from pydantic import BaseModel, field_validator

from llm_tools.common.Nodes import NodeAbstract, NodeConfig, NodeOutput, Graph
from llm_tools.common import save_to_file


class SaveFileAsJsonNodeConfig(BaseModel):
    next_node: str | None
    context_var_content_to_save: str
    context_var_path_to_save: str | None
    fixed_path_to_save: str | None


class SaveFileAsJsonNode(NodeAbstract):
    def __init__(self, config: NodeConfig, graph: Graph):
        super().__init__(config, graph)
        self.save_file_config: SaveFileAsJsonNodeConfig = SaveFileAsJsonNodeConfig(**self.config.options)

    def process_input(self) -> NodeOutput:
        if self.save_file_config.fixed_path_to_save is None and self.save_file_config.context_var_path_to_save is None:
            raise Exception("There is no save path for save node named:", self.config.name)

        if self.save_file_config.fixed_path_to_save:
            path = self.save_file_config.fixed_path_to_save
        else:
            path = self.graph.get_context(self.save_file_config.context_var_path_to_save)

        content = self.graph.get_context(self.save_file_config.context_var_content_to_save)
        content = json.dumps(content, indent=2)
        print(f"node {self.config.name} saved contents of context key {self.save_file_config.context_var_content_to_save}",
              f"into {path}")

        save_to_file(content=content, path=path)
        return NodeOutput(
            next_node=self.save_file_config.next_node
        )


