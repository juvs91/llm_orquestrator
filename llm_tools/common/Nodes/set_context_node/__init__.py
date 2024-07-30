import os.path
from typing import Any, Dict
from pydantic import BaseModel, field_validator

from llm_tools.common.Nodes import NodeAbstract, NodeConfig, NodeOutput, Graph
from llm_tools.common import save_to_file


class SetContextNodeConfig(BaseModel):
    next_node: str | None
    context_to_save: Dict[str, Any]


class SetContextNode(NodeAbstract):
    def __init__(self, config: NodeConfig, graph: Graph):
        super().__init__(config, graph)
        self.set_context_node_config: SetContextNodeConfig = SetContextNodeConfig(**self.config.options)

    def process_input(self) -> NodeOutput:
        for key, value in self.set_context_node_config.context_to_save.items():
            self.graph.set_context(key, value)
        print(f"Node {self.config.name} saved context vars:", *self.set_context_node_config.context_to_save.items())
        return NodeOutput(
            next_node=self.set_context_node_config.next_node
        )


