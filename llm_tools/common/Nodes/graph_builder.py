import json
from typing import Dict, Any, List
from llm_tools.common.Nodes import NodeAbstract, Graph, NodeConfig
from llm_tools.common.Nodes.node_builder import build_node
from llm_tools.common import read_file
import os


def build_graph(node_configs: List[Dict[str, Any]]) -> Graph:
    graph = Graph({})
    for config in node_configs:
        node = build_node(config=config, graph=graph)
        graph.add_node(node)
    graph.validate()
    return graph


def build_graph_from_config(config_path: str) -> Graph:
    if not os.path.exists(config_path):
        raise Exception(f"Config path {config_path} does not exists")
    file_content = read_file(config_path)
    configs = json.loads(file_content)
    graph = build_graph(node_configs=configs)
    return graph

