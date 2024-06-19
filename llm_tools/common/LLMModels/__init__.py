from abc import ABC, abstractmethod
from typing import Dict, Any, TypeVar
from langchain.prompts import PromptTemplate
from llm_tools.common.prompts import get_prompt_template

from pydantic import BaseModel, field_validator

T_concrete_model_config = TypeVar("T_concrete_model_config")


class LLMModelConfig(BaseModel):
    system_prompt_template_name: str
    system_prompt_input_values: Dict[str, Any]
    prompt_template_name: str
    temperature: float
    options: T_concrete_model_config

    @field_validator("temperature")
    @classmethod
    def validate_temperature(cls, v: float):
        assert (v >= 0) & (v <= 1), "Temperature must be between 1 and 0"
        return v


class LLMModelAbstract(ABC):
    def __init__(self, config: LLMModelConfig):
        self.config = config
        self.system_prompt_template = get_prompt_template(self.config.system_prompt_template_name)
        self.prompt_template = get_prompt_template(self.config.prompt_template_name)
        self.evaluated_system_prompt = self.system_prompt_template.invoke(input=self.config.system_prompt_input_values).text

    @abstractmethod
    def generate_response(self, prompt_input: Dict[str, Any]) -> str:
        pass

    @abstractmethod
    def count_tokens(self, prompt: str) -> int:
        pass
    
