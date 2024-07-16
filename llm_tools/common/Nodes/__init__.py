import copy
import os
from abc import ABC, abstractmethod
from pydantic import BaseModel, field_validator
from typing import Dict, Any, TypeVar, Type, ForwardRef

from llm_tools.common import read_file

T_concrete_node_config = TypeVar("T_concrete_node_config")


class NodeConfig(BaseModel):
    max_iterations: int
    name: str
    type: str
    options: T_concrete_node_config


class NodeOutput(BaseModel):
    next_node: str | None


class NodeAbstract(ABC):
    def __init__(self, config: NodeConfig, graph: 'Graph'):
        self.config = config
        self.iterations = 0
        self.graph = graph

    def increment_iteration(self):
        self.iterations += 1
        if self.iterations > self.config.max_iterations:
            raise Exception(f"Max Iterations({self.config.max_iterations}) reached for node {self.config.name}")

    @abstractmethod
    def process_input(self) -> NodeOutput:
        pass


class Graph:
    def __init__(self, nodes: Dict[str, NodeAbstract]):
        self.nodes = nodes
        self._context: Dict[str, Any] = {}

    def add_node(self, node: NodeAbstract):
        if node.config.name in self.nodes:
            raise Exception(f"Node {node.config.name} already exists")
        self.nodes[node.config.name] = node

    def set_context(self, context_key: str, context_value: Any) -> None:
        self._context[context_key] = context_value

    def get_context(self, context_key: str) -> Any:
        return self._context[context_key]

    def check_if_context_exists(self, context_key: str) -> bool:
        if context_key in self._context:
            return True
        else:
            return False

    def print_context(self) -> None:
        print(f"{self._context}")

    def _get_node(self, node_name) -> NodeAbstract:
        if node_name not in self.nodes:
            raise Exception(f"Node {node_name} not found in graph: {self.nodes.keys()}")
        return self.nodes[node_name]

    def validate(self):
        if "START" not in self.nodes:
            raise Exception("No node named START, this node should be used to start the graph")
        if "END" not in self.nodes:
            raise Exception("No node named END, this node should be used to end the graph")

    def process_input(self) -> Dict[str, Any]:
        current_node = self._get_node("START")

        while True:
            print(f"--------------- Processing node {current_node.config.name} --------------------")
            current_node_results = current_node.process_input()
            if current_node.config.name == "END":
                break
            current_node = self._get_node(current_node_results.next_node)
        return self._context

    def process_input_from_node(self, node_name: str) -> Dict[str, Any]:
        current_node = self._get_node(node_name)

        while True:
            print(f"--------------- Processing node {current_node.config.name} --------------------")
            current_node_results = current_node.process_input()
            if current_node.config.name == "END":
                break
            if current_node_results.next_node is None:
                break
            current_node = self._get_node(current_node_results.next_node)
        return self._context
