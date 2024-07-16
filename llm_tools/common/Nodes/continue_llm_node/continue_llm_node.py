
from llm_tools.common.Nodes import NodeAbstract, NodeOutput, NodeConfig, Graph
from llm_tools.common.LLMModels.llm_model_builder import build_llm_model
from llm_tools.common.Nodes.llm_node import LLMNodeConfig


class ContinueLLMNode(NodeAbstract):
    def __init__(self, config: NodeConfig, graph: 'Graph'):
        super().__init__(config, graph)
        self.stop_llm_config = LLMNodeConfig(**self.config.options['stop_llm_options'])
        self.ask_llm_config = LLMNodeConfig(**self.config.options['ask_llm_options'])
        self.continue_llm_config = LLMNodeConfig(**self.config.options['continue_llm_options'])
        self.stop_llm_model = build_llm_model(self.stop_llm_config.llm_node_type, self.stop_llm_config.options)
        self.ask_llm_model = build_llm_model(self.ask_llm_config.llm_node_type, self.ask_llm_config.options)
        self.continue_llm_model = build_llm_model(self.continue_llm_config.llm_node_type,
                                                  self.continue_llm_config.options)
        self.stop_criteria = self.config.options['stop_llm_options']['stop_criteria']

    def _get_prompt_input(self, llm_node_config):
        prompt_input = {}
        for key in llm_node_config.context_vars_prompt:
            prompt_input[key] = self.graph.get_context(key)
        return prompt_input
    
    def process_input(self) -> NodeOutput:
        self.increment_iteration()
        ask_prompt_input = self._get_prompt_input(self.ask_llm_config)
        print(f"node {self.config.name} generating the ask llm response with this prompts:",
              *self.ask_llm_config.context_vars_prompt)
        response = self.ask_llm_model.generate_response(prompt_input=ask_prompt_input)
        print(f"in the asking llm ------------- response : {response}")
        self.graph.set_context(self.ask_llm_config.output_context, response)
        stop_prompt_input = self._get_prompt_input(self.stop_llm_config)
        can_generate_more_response = self.stop_llm_model.generate_response(prompt_input=stop_prompt_input)
        print(f" before the loop ------------- response : {can_generate_more_response}")
        self.graph.set_context(self.stop_llm_config.output_context, can_generate_more_response)
        while self.stop_criteria in can_generate_more_response.lower():
            continue_prompt_input = self._get_prompt_input(self.continue_llm_config)
            added_response = self.continue_llm_model.generate_response(prompt_input=continue_prompt_input)
            print(f"agregating more thickets ------------- response : {added_response}")
            response = f"{response}{added_response}"
            print(f"tickets agregated more tickets ------------- response : {response}")
            self.graph.set_context(self.continue_llm_config.output_context, response)
            can_generate_more_response = self.stop_llm_model.generate_response(prompt_input=stop_prompt_input)
            print(f"in the continue and can generate more responses llm ------------- response : {can_generate_more_response}")
            self.graph.set_context(self.stop_llm_config.output_context, can_generate_more_response)
        print(f"node {self.config.name} finished response and saved to context key {self.ask_llm_config.output_context}")
        return NodeOutput(
            next_node=self.ask_llm_config.next_node
        )


if __name__ == "__main__":
    pass