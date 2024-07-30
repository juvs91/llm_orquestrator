from typing import List, Any, Dict

from pydantic import BaseModel
from abc import ABC, abstractmethod


class CustomProcessOutput(BaseModel):
    output: Dict[str, Any]


class CustomProcess(ABC):

    @abstractmethod
    def __init__(self):
        pass

    @abstractmethod
    def process(self, args: Dict[str, Any]) -> CustomProcessOutput:
        pass
