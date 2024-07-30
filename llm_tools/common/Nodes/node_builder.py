from typing import Dict, Type, Any

from pydantic import BaseModel, field_validator

from llm_tools.common.Nodes import NodeAbstract, NodeConfig, Graph
from llm_tools.common.Nodes.continue_llm_node.continue_llm_node import ContinueLLMNode
from llm_tools.common.Nodes.llm_node import LLMNode
from llm_tools.common.Nodes.read_file_node import ReadFileNode
from llm_tools.common.Nodes.save_file_node import SaveFileNode
from llm_tools.common.Nodes.parse_yaml import ParseYamlNode
from llm_tools.common.Nodes.set_context_node import SetContextNode
from llm_tools.common.Nodes.log_node import LogNode
from llm_tools.common.Nodes.concatenate_files import ConcatenateFilesNode
from llm_tools.common.Nodes.append_to_array import AppendToArrayNode
from llm_tools.common.Nodes.batch_node import BatchNode
from llm_tools.common.Nodes.object_to_yaml import ObjectToYamlNode
from llm_tools.common.Nodes.save_file_as_json_node import SaveFileAsJsonNode
from llm_tools.common.Nodes.concatenate_files_in_array import ConcatenateFilesInArrayNode
from llm_tools.common.Nodes.array_to_string import ArrayToStringNode
from llm_tools.common.Nodes.custom_process_node import CustomProcessNode

AVAILABLE_NODES: Dict[str, Type[NodeAbstract]] = {
    "LLM_NODE": LLMNode,
    "CONTINUE_LLM_NODE": ContinueLLMNode,
    "READ_FILE_NODE": ReadFileNode,
    "SAVE_FILE_NODE": SaveFileNode,
    "SAVE_FILE_AS_JSON_NODE": SaveFileAsJsonNode,
    "PARSE_YAML_NODE": ParseYamlNode,
    "SET_CONTEXT_NODE": SetContextNode,
    "CONCATENATE_FILES_NODE": ConcatenateFilesNode,
    "LOG_NODE": LogNode,
    "APPEND_TO_ARRAY_NODE": AppendToArrayNode,
    "BATCH_NODE": BatchNode,
    "OBJECT_TO_YAML_NODE": ObjectToYamlNode,
    "CONCATENATE_FILES_IN_ARRAY_NODE": ConcatenateFilesInArrayNode,
    "ARRAY_TO_STRING_NODE": ArrayToStringNode,
    "CUSTOM_PROCESS_NODE": CustomProcessNode
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

    


