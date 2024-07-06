import os
from typing import Dict, Any, List

from llm_tools.common import read_file
from llm_tools.common.Nodes import NodeAbstract, NodeOutput, NodeConfig, Graph
from llm_tools.common.LLMModels import LLMModelConfig
from pydantic import BaseModel
from llm_tools.common.LLMModels.llm_model_builder import build_llm_model


class LLMNodeConfig(BaseModel):
    llm_node_type: str
    next_node: str
    output_context: str
    context_vars_prompt: List[str]
    options: LLMModelConfig


class LLMNode(NodeAbstract):
    def __init__(self, config: NodeConfig, graph: 'Graph'):
        super().__init__(config, graph)
        self.llm_node_config = LLMNodeConfig(**self.config.options)
        self.llm_model = build_llm_model(self.llm_node_config.llm_node_type, self.llm_node_config.options)

    def _get_prompt_input(self):
        prompt_input = {}
        for key in self.llm_node_config.context_vars_prompt:
            prompt_input[key] = self.graph.get_context(key)
        return prompt_input

    def process_input(self) -> NodeOutput:
        self.increment_iteration()
        prompt_input = self._get_prompt_input()
        print(f"node {self.config.name} generating llm response using following context keys to generate prompt:",
              *self.llm_node_config.context_vars_prompt)
        response = self.llm_model.generate_response(prompt_input=prompt_input)
        print(f"response from the single llm call, response is {response}")
        self.graph.set_context(self.llm_node_config.output_context, response)
        print(f"node {self.config.name} finished response and saved to context key {self.llm_node_config.output_context}")
        return NodeOutput(
            next_node=self.llm_node_config.next_node
        )


if __name__ == "__main__":
    os.environ.setdefault("GOOGLE_APPLICATION_CREDENTIALS",
                          "/Volumes/case-sensitive-volume/LLM_TOOLS/credentials/data-chat-credentials.json")
    tickets = read_file("/Volumes/case-sensitive-volume/LLM_TOOLS/llm_tools/jira_tickets/data/output_yamls.txt")
    _config = {
        "max_iterations": 0,
        "name": "END",
        "type": "llmnode",
        "options": {
            "llm_node_type": "GEMINI",
            "next_node": "NO NODE",
            "options": {
                "system_prompt_template_name": "SI_GENERATE_CATEGORIES_PROMPT_TEMPLATE",
                "system_prompt_input_values": {},
                "prompt_template_name": "GENERATE_CATEGORIES_PROMPT_TEMPLATE",
                "temperature": 0.0,
                "options": {
                    "project_id": "dea-analytics-prj-gemini",
                    "region": "us-central1",
                    "gcp_model_name": "gemini-1.5-pro-preview-0514"
                }
            }
        }
    }
    _node = LLMNode(NodeConfig(**_config), None)
    result = _node.process_input()
    print(result.next_node)
    print(result.output_data)
