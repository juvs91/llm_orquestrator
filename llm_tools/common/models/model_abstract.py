from abc import ABC, abstractmethod
from typing import Dict, Any


class ModelAbstract(ABC):
    """
    Abstract class for models
    """

    def __init__(self, model_config: Dict[str, Any]) -> None:
        """
            Initiliazer

            :arg model_config: Configuration for the model, all models have "SYSTEM_PROMPT"
        """
        self.model_config = model_config
        self.system_prompt: str = model_config["SYSTEM_PROMPT"]
        self.initialize_model()

    @abstractmethod
    def initialize_model(self) -> None:
        pass

    @abstractmethod
    def generate_response(self, prompt: str) -> str:
        pass
