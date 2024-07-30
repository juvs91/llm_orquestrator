from pydantic import BaseModel
from llm_tools.common.Nodes import NodeAbstract, NodeConfig, NodeOutput, Graph
import json
from llm_tools.common import print_object


class ArrayToStringNodeConfig(BaseModel):
    next_node: str | None
    context_var_array: str
    context_var_to_save: str
    separator: str


class ArrayToStringNode(NodeAbstract):
    def __init__(self, config: NodeConfig, graph: Graph):
        super().__init__(config, graph)
        self.array_to_string_node_config: ArrayToStringNodeConfig = ArrayToStringNodeConfig(**self.config.options)

    def process_input(self) -> NodeOutput:
        arr = self.graph.get_context(self.array_to_string_node_config.context_var_array)
        if not isinstance(arr, list):
            raise Exception(f"Value of context {self.array_to_string_node_config.context_var_array} is not a list")
        separator = self.array_to_string_node_config.separator
        result = separator.join(arr)
        self.graph.set_context(
            context_key=self.array_to_string_node_config.context_var_to_save,
            context_value=result
        )
        print(f"Saved new string from array in {self.array_to_string_node_config.context_var_to_save}")
        return NodeOutput(
            next_node=self.array_to_string_node_config.next_node
        )
