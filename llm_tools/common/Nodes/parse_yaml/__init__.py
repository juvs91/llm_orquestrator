import os.path
from pydantic import BaseModel
from llm_tools.common.Nodes import NodeAbstract, NodeConfig, NodeOutput, Graph
import yaml


class ParseYamlNodeConfig(BaseModel):
    next_node_on_valid: str
    next_node_on_invalid: str
    context_var_to_validate: str
    context_var_save_as_object: str | None


class ParseYamlNode(NodeAbstract):
    def __init__(self, config: NodeConfig, graph: Graph):
        super().__init__(config, graph)
        self.parse_yaml_config: ParseYamlNodeConfig = ParseYamlNodeConfig(**self.config.options)

    def process_input(self) -> NodeOutput:
        self.increment_iteration()
        print(f"Validating yaml in context key {self.parse_yaml_config.context_var_to_validate} in node"
              , f"{self.config.name}")
        yaml_content = self.graph.get_context(self.parse_yaml_config.context_var_to_validate)
        print(f"yaml_content : {yaml_content}")
        try:
            yaml_as_object = yaml.load(yaml_content, Loader=yaml.FullLoader)
            print("YAML is valid")
            if self.parse_yaml_config.context_var_save_as_object is not None:
                self.graph.set_context(self.parse_yaml_config.context_var_save_as_object, yaml_as_object)
                print("Saved yaml object to context key", self.parse_yaml_config.context_var_save_as_object)
            return NodeOutput(next_node=self.parse_yaml_config.next_node_on_valid)
        except Exception as exc:
            print(f"Error validating YAML content: {exc}")
            return NodeOutput(next_node=self.parse_yaml_config.next_node_on_invalid)
