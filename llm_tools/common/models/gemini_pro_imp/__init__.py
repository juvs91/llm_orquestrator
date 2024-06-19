from typing import Dict, Any

import vertexai.preview.generative_models as generative_models
import vertexai
from vertexai.generative_models import GenerativeModel
from llm_tools.common.models.model_abstract import ModelAbstract

DEFAULT_GENERATION_CONFIG = {
    "max_output_tokens": 8192,
    "top_p": 0.95,
    "temperature": 0
}

DEFAULT_SAFETY_SETTINGS = {
    generative_models.HarmCategory.HARM_CATEGORY_HATE_SPEECH: generative_models.HarmBlockThreshold.BLOCK_MEDIUM_AND_ABOVE,
    generative_models.HarmCategory.HARM_CATEGORY_DANGEROUS_CONTENT: generative_models.HarmBlockThreshold.BLOCK_MEDIUM_AND_ABOVE,
    generative_models.HarmCategory.HARM_CATEGORY_SEXUALLY_EXPLICIT: generative_models.HarmBlockThreshold.BLOCK_MEDIUM_AND_ABOVE,
    generative_models.HarmCategory.HARM_CATEGORY_HARASSMENT: generative_models.HarmBlockThreshold.BLOCK_MEDIUM_AND_ABOVE,
}


class GeminiProModel(ModelAbstract):
    """
    Implementation for claude gemini pro models
    Config parameters
      "PROJECT_ID": "dea-analytics-prj-gemini",
      "LLM_LOCATION": "us-central1",
      "LLM_MODEL": "gemini-1.5-pro-preview-0514"
    """

    def __init__(self, model_config: Dict[str, Any]):
        self.model_name = model_config["LLM_MODEL"]
        self.project_id = model_config["PROJECT_ID"]
        self.location = model_config["LLM_LOCATION"]
        self.model_client: GenerativeModel | None = None
        super().__init__(model_config)

    def initialize_model(self) -> None:
        vertexai.init(project=self.project_id, location=self.location)
        self.model_client = GenerativeModel(
            model_name=self.model_name,
            system_instruction=[self.system_prompt],
        )

    def generate_response(self, prompt: str) -> str:
        if not isinstance(self.model_client, GenerativeModel):
            raise ValueError("No model initialized")

        try:
            response = self.model_client.generate_content(
                [prompt],
                generation_config=DEFAULT_GENERATION_CONFIG,
                safety_settings=DEFAULT_SAFETY_SETTINGS,
                stream=False,
            ).text
            return response
        except Exception as error:
            print("Could not generate response", "-"*30 + "prompt", prompt, "-"*30,"-"*30 + "Error", error, sep="\n")
            raise
