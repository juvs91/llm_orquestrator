import os.path
from typing import Any
from pydantic import BaseModel, field_validator

from llm_tools.common.Nodes import NodeAbstract, NodeConfig, NodeOutput, Graph
from llm_tools.common import read_file


class ReadFileNodeConfig(BaseModel):
    next_node: str | None
    output_context: str
    context_var_path: str | None
    fixed_path: str | None


class ReadFileNode(NodeAbstract):
    def __init__(self, config: NodeConfig, graph: Graph):
        super().__init__(config, graph)
        self.read_file_config: ReadFileNodeConfig = ReadFileNodeConfig(**self.config.options)

    def process_input(self) -> NodeOutput:
        if self.read_file_config.context_var_path is None and self.read_file_config.fixed_path is None:
            raise Exception("There is no path for read file node named:", self.config.name)

        if self.read_file_config.fixed_path is not None:
            path = self.read_file_config.fixed_path
        else:
            path = self.graph.get_context(self.read_file_config.context_var_path)

        if not os.path.exists(path):
            raise Exception(f"Error on node {self.config.name}: File {path} does not exists")

        file_content = read_file(path)
        self.graph.set_context(self.read_file_config.output_context, file_content)
        print(f"node {self.config.name} read file from {path} and saved to context key:",
              f"{self.read_file_config.output_context}")
        return NodeOutput(
            next_node=self.read_file_config.next_node
        )
