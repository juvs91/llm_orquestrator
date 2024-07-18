from typing import Dict, Any

from pydantic import BaseModel
from llm_tools.common.Nodes import NodeAbstract, NodeConfig, NodeOutput, Graph
from llm_tools.common.CustomProcesses.custom_process_builder import get_custom_process
from llm_tools.common.CustomProcesses import CustomProcess


class CustomProcessNodeConfig(BaseModel):
    next_node: str | None
    process_name: str
    context_vars_input_context: Dict[str, str]
    context_save_vars_output_context: Dict[str, str]


class CustomProcessNode(NodeAbstract):
    def __init__(self, config: NodeConfig, graph: Graph):
        super().__init__(config, graph)
        self.custom_process_node_config: CustomProcessNodeConfig = CustomProcessNodeConfig(**self.config.options)
        self.custom_process: CustomProcess = get_custom_process(self.custom_process_node_config.process_name)

    def _construct_input(self) -> Dict[str, Any]:
        input_dict = {}
        for input_key, input_context_key in self.custom_process_node_config.context_vars_input_context.items():
            if not self.graph.check_if_context_exists(input_context_key):
                raise Exception(f"Context key {input_context_key} does not exists")
            value = self.graph.get_context(input_context_key)
            input_dict[input_key] = value
        return input_dict

    def _save_output(self, raw_process_output: Dict[str, Any]) -> None:
        for key_output, context_key_to_save in self.custom_process_node_config.context_save_vars_output_context.items():
            if key_output not in raw_process_output:
                name = self.custom_process_node_config.process_name
                raise Exception(f"Custom process {name} does not have key {key_output}")
            value = raw_process_output[key_output]
            self.graph.set_context(context_key_to_save, value)
            print(f"Saved process output {key_output} into context key {context_key_to_save}")

    def process_input(self) -> NodeOutput:
        input_dict = self._construct_input()
        raw_process_output = self.custom_process.process(input_dict)
        self._save_output(raw_process_output.output)
        return NodeOutput(
            next_node=self.custom_process_node_config.next_node
        )
