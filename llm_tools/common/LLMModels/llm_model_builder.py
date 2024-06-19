from llm_tools.common.LLMModels import LLMModelAbstract
from llm_tools.common.LLMModels.gemini_model import GeminiModel,LLMModelConfig
from typing import Dict, Any, Type
from pydantic import BaseModel, field_validator

AVAILABLE_LLM_MODELS: Dict[str, Type[LLMModelAbstract]] = {
    "GEMINI": GeminiModel
}


class AvailableLLMModel(BaseModel):
    name: str

    @field_validator('name')
    @classmethod
    def validate_template_name(cls, value: float):
        assert value in AVAILABLE_LLM_MODELS, f"LLM MODEL {value} not in available models"
        return value


def build_llm_model(llm_model_name: str, options: Any) -> LLMModelAbstract:
    model = AvailableLLMModel(name=llm_model_name)
    return AVAILABLE_LLM_MODELS[model.name](options)
