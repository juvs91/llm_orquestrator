from typing import List, Any

from pydantic import BaseModel
from llm_tools.common.Nodes import NodeAbstract, NodeConfig, NodeOutput, Graph
import json
from llm_tools.common import print_object


class AppendToArrayNodeConfig(BaseModel):
    next_node: str | None
    context_key_var_to_append: str
    context_key_array_append_to: str


class AppendToArrayNode(NodeAbstract):
    def __init__(self, config: NodeConfig, graph: Graph):
        super().__init__(config, graph)
        self.append_to_array_node_config: AppendToArrayNodeConfig = AppendToArrayNodeConfig(**self.config.options)

    def _get_or_create_array(self) -> List[Any]:
        context_key_array = self.append_to_array_node_config.context_key_array_append_to
        if not self.graph.check_if_context_exists(context_key_array):
            self.graph.set_context(context_key_array, [])
        return self.graph.get_context(context_key=context_key_array)

    def _validate_context_array(self) -> None:
        arr = self._get_or_create_array()
        context_key_array = self.append_to_array_node_config.context_key_array_append_to
        if not isinstance(arr, list):
            raise Exception(f"The value of context key {context_key_array} is not an instance of a list")

    def process_input(self) -> NodeOutput:

        self._validate_context_array()

        context_key_var_to_append = self.append_to_array_node_config.context_key_var_to_append
        context_key_array_append_to = self.append_to_array_node_config.context_key_array_append_to
        print(f"Appending {context_key_var_to_append} into {context_key_array_append_to}")

        arr = self._get_or_create_array()
        obj = self.graph.get_context(context_key_var_to_append)
        if isinstance(obj, list):
            new_arr = arr + obj
            self.graph.set_context(context_key_array_append_to, new_arr)
            print("Joined two lists...")
        else:
            arr.append(obj)
            self.graph.set_context(context_key_array_append_to, arr)
            print("Appended to array...")

        return NodeOutput(
            next_node=self.append_to_array_node_config.next_node
        )
