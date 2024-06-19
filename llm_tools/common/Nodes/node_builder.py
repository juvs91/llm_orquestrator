import os
from typing import Dict, Type, Any, List

from pydantic import BaseModel, field_validator

from llm_tools.common import read_file
from llm_tools.common.Nodes import NodeAbstract, NodeConfig, Graph
from llm_tools.common.Nodes.llm_node import LLMNode
from llm_tools.common.Nodes.read_file_node import ReadFileNode
from llm_tools.common.Nodes.save_file_node import SaveFileNode
from llm_tools.common.Nodes.parse_yaml import ParseYamlNode

AVAILABLE_NODES: Dict[str, Type[NodeAbstract]] = {
    "LLM_NODE": LLMNode,
    "READ_FILE_NODE": ReadFileNode,
    "SAVE_FILE_NODE": SaveFileNode,
    "PARSE_YAML_NODE": ParseYamlNode
}


def build_node(config: Dict[str, Any], graph: Graph) -> NodeAbstract:
    node_config = NodeConfig(**config)
    node_type = AvailableNodeType(type=node_config.type)
    return AVAILABLE_NODES[node_type.type](node_config, graph)


class AvailableNodeType(BaseModel):
    type: str

    @field_validator('type')
    @classmethod
    def validate_node_type(cls, value: str):
        assert value in AVAILABLE_NODES, f"Node {value} not in available nodes:{AVAILABLE_NODES.keys()}"
        return value

    


if __name__ == "__main__":
    os.environ.setdefault("GOOGLE_APPLICATION_CREDENTIALS",
                          "/Volumes/case-sensitive-volume/LLM_TOOLS/credentials/data-chat-credentials.json")
    tickets = read_file("/Volumes/case-sensitive-volume/LLM_TOOLS/llm_tools/jira_tickets/data/output_yamls.txt")
    _config = {
        "max_iterations": 0,
        "name": "END",
        "type": "LLM_NODE",
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
    _node = build_node(_config, None)
    result = _node.process_input(node_input={"tickets": tickets})
    print(result.next_node)
    print(result.output_data)


