import os.path
from typing import Any, Dict
from pydantic import BaseModel, field_validator

from llm_tools.common.Nodes import NodeAbstract, NodeConfig, NodeOutput, Graph
from llm_tools.common import save_to_file


class LogNodeConfig(BaseModel):
    next_node: str
    print_context_var: str | None
    print_context: bool


class LogNode(NodeAbstract):
    def __init__(self, config: NodeConfig, graph: Graph):
        super().__init__(config, graph)
        self.log_node_config: LogNodeConfig = LogNodeConfig(**self.config.options)

    def process_input(self) -> NodeOutput:
        print_context_var = self.log_node_config.print_context_var
        if print_context_var is not None:
            value = self.graph.get_context(print_context_var)
            print(f"{print_context_var}: {value}")

        if self.log_node_config.print_context:
            print("CONTEXT", "-"*30, sep="\n")
            self.graph.print_context()
            print("-"*30)
        return NodeOutput(
            next_node=self.log_node_config.next_node
        )


