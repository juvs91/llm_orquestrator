from typing import Dict, Any

from llm_tools.common.models.model_abstract import ModelAbstract
from llm_tools.common.models.gemini_pro_imp import GeminiProModel
from llm_tools.common.models.claude_imp import ClaudeModel

AVAILABLE_MODELS = {
    "CLAUDE": ClaudeModel,
    "GEMINI_PRO": GeminiProModel
}


def build_model(config: Dict[str, Any]) -> ModelAbstract:
    model_implementation = config["MODEL_IMPLEMENTATION"]
    return AVAILABLE_MODELS[model_implementation](config)
