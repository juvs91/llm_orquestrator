import os
from typing import Dict, Type, Any, List

from pydantic import BaseModel, field_validator

from llm_tools.common import read_file
from llm_tools.common.Nodes import NodeAbstract, NodeConfig, Graph
from llm_tools.common.Nodes.llm_node import LLMNode
from llm_tools.common.Nodes.read_file_node import ReadFileNode
from llm_tools.common.Nodes.save_file_node import SaveFileNode
from llm_tools.common.Nodes.parse_yaml import ParseYamlNode
from llm_tools.common.Nodes.set_context_node import SetContextNode

AVAILABLE_NODES: Dict[str, Type[NodeAbstract]] = {
    "LLM_NODE": LLMNode,
    "READ_FILE_NODE": ReadFileNode,
    "SAVE_FILE_NODE": SaveFileNode,
    "PARSE_YAML_NODE": ParseYamlNode,
    "SET_CONTEXT_NODE": SetContextNode
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

    


