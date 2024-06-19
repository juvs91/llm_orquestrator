from typing import Dict, Any

from anthropic import AnthropicVertex

from llm_tools.common.models.model_abstract import ModelAbstract


class ClaudeModel(ModelAbstract):
    """
    Implementation for claude anthropic models
    Config parameters
     "PROJECT_ID": "dea-analytics-prj-gemini",
     "LLM_LOCATION": "us-east5"
     "LLM_MODEL": "claude-3-opus@20240229"
    """

    def __init__(self, model_config: Dict[str, Any]):
        self.model_name = model_config["LLM_MODEL"]
        self.project_id = model_config["PROJECT_ID"]
        self.location = model_config["LLM_LOCATION"]
        self.model_client = AnthropicVertex | None
        super().__init__(model_config)

    def initialize_model(self) -> None:
        self.model_client = AnthropicVertex(region=self.location, project_id=self.project_id)

    def generate_response(self, prompt: str) -> str:
        if not isinstance(self.model_client, AnthropicVertex):
            raise ValueError("No model initialized")

        message = self.model_client.messages.create(
            max_tokens=4096,
            system=self.system_prompt,
            messages=[
                {
                    "role": "user",
                    "content": prompt,
                }
            ],
            model=self.model_name,
        )
        return message.content[0].text
