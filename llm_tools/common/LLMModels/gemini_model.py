from typing import Dict, Any
from pydantic import BaseModel
import vertexai.preview.generative_models as generative_models
import vertexai
from vertexai.generative_models import GenerativeModel
from llm_tools.common import read_file
from llm_tools.common.LLMModels import LLMModelAbstract, LLMModelConfig
import os

DEFAULT_SAFETY_SETTINGS = {
    generative_models.HarmCategory.HARM_CATEGORY_HATE_SPEECH: generative_models.HarmBlockThreshold.BLOCK_NONE,
    generative_models.HarmCategory.HARM_CATEGORY_DANGEROUS_CONTENT: generative_models.HarmBlockThreshold.BLOCK_NONE,
    generative_models.HarmCategory.HARM_CATEGORY_SEXUALLY_EXPLICIT: generative_models.HarmBlockThreshold.BLOCK_NONE,
    generative_models.HarmCategory.HARM_CATEGORY_HARASSMENT: generative_models.HarmBlockThreshold.BLOCK_NONE,
}


class GeminiModelConfig(BaseModel):
    project_id: str
    gcp_model_name: str
    region: str


class GeminiModel(LLMModelAbstract):

    def __init__(self, config: LLMModelConfig):
        super().__init__(config)
        self.gemini_config: GeminiModelConfig = GeminiModelConfig(**self.config.options)
        vertexai.init(project=self.gemini_config.project_id, location=self.gemini_config.region)
        self.model_client = GenerativeModel(
            model_name=self.gemini_config.gcp_model_name,
            system_instruction=[self.evaluated_system_prompt],
        )
        self.generation_config = {
            "max_output_tokens": 8192,
            "top_p": 0.95,
            "temperature": self.config.temperature
        }

    def generate_response(self, prompt_input: Dict[str, Any]) -> str:
        prompt = self.prompt_template.invoke(input=prompt_input).text
        try:
            response = self.model_client.generate_content(
                [prompt],
                generation_config=self.generation_config,
                safety_settings=DEFAULT_SAFETY_SETTINGS,
                stream=False,
            )
            return response.text
        except Exception as error:
            print("Could not generate response", "-" * 30, "-" * 30, "-" * 30 + "Error", error,
                  sep="\n")
            raise

    def count_tokens(self, prompt_input: Dict[str, Any]) -> int:
        prompt = self.prompt_template.invoke(input=prompt_input)
        return self.model_client.count_tokens(prompt).total_tokens


if __name__ == "__main__":
    os.environ.setdefault("GOOGLE_APPLICATION_CREDENTIALS",
                          "/Volumes/case-sensitive-volume/LLM_TOOLS/credentials/data-chat-credentials.json")
    tickets = read_file("/Volumes/case-sensitive-volume/LLM_TOOLS/llm_tools/jira_tickets/data/output_yamls.txt")
    _config = LLMModelConfig(
        system_prompt_template_name="SI_GENERATE_CATEGORIES_PROMPT_TEMPLATE",
        system_prompt_input_values={},
        prompt_template_name="GENERATE_CATEGORIES_PROMPT_TEMPLATE",
        temperature=0.0,
        options=GeminiModelConfig(
            project_id="dea-analytics-prj-gemini",
            region="us-central1",
            gcp_model_name="gemini-1.5-pro-preview-0514"
        )
    )
    _llm = GeminiModel(_config)
    _res = _llm.generate_response({"tickets": tickets})
    print("res", _res)
