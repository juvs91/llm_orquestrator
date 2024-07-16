from pydantic import BaseModel
from llm_tools.common.Nodes import NodeAbstract, NodeConfig, NodeOutput, Graph
import yaml


class ObjectToYamlNodeConfig(BaseModel):
    next_node: str | None
    context_key_object_to_convert: str
    context_key_yaml_to_save: str


class ObjectToYamlNode(NodeAbstract):
    def __init__(self, config: NodeConfig, graph: Graph):
        super().__init__(config, graph)
        self.object_to_yaml_node_config: ObjectToYamlNodeConfig = ObjectToYamlNodeConfig(**self.config.options)

    def process_input(self) -> NodeOutput:
        object_to_convert = self.graph.get_context(self.object_to_yaml_node_config.context_key_object_to_convert)
        yaml_string = yaml.dump(object_to_convert, sort_keys=False)
        self.graph.set_context(
            context_key=self.object_to_yaml_node_config.context_key_yaml_to_save,
            context_value=yaml_string
        )
        print(f"Converted object in key {self.object_to_yaml_node_config.context_key_object_to_convert} into key "
              f"{self.object_to_yaml_node_config.context_key_yaml_to_save}")
        return NodeOutput(
            next_node=self.object_to_yaml_node_config.next_node
        )
