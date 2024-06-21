from typing import Dict, List

from llm_tools.common.prompts.si_generate_categories import SI_GENERATE_CATEGORIES_PROMPT_TEMPLATE
from llm_tools.common.prompts.generate_categories import GENERATE_CATEGORIES_PROMPT_TEMPLATE
from pydantic import BaseModel, field_validator
from langchain.prompts import PromptTemplate
from llm_tools.common.prompts.si_get_possible_origin_fields_from_dbt import SI_GET_POSSIBLE_ORIGIN_FIELDS_FROM_DBT
from llm_tools.common.prompts.get_possible_origin_fields_from_dbt import GET_POSSIBLE_ORIGIN_FIELDS_FROM_DBT

AVAILABLE_PROMPT_TEMPLATES: Dict[str, PromptTemplate] = {
    "SI_GENERATE_CATEGORIES_PROMPT_TEMPLATE": SI_GENERATE_CATEGORIES_PROMPT_TEMPLATE,
    "GENERATE_CATEGORIES_PROMPT_TEMPLATE": GENERATE_CATEGORIES_PROMPT_TEMPLATE,
    "SI_GET_POSSIBLE_ORIGIN_FIELDS_FROM_DBT": SI_GET_POSSIBLE_ORIGIN_FIELDS_FROM_DBT,
    "GET_POSSIBLE_ORIGIN_FIELDS_FROM_DBT": GET_POSSIBLE_ORIGIN_FIELDS_FROM_DBT
}


class PromptTemplateName(BaseModel):
    template_name: str

    @field_validator('template_name')
    @classmethod
    def validate_template_name(cls, value: float):
        assert value in AVAILABLE_PROMPT_TEMPLATES, f"Prompt template {value} not in available prompts"
        return value


def get_prompt_template(name: str):
    template_name = PromptTemplateName(template_name=name)
    return AVAILABLE_PROMPT_TEMPLATES[template_name.template_name]


if __name__ == "__main__":
    _template = get_prompt_template("SI_GENERATE_CATEGORIES_PROMPT_TEMPLATE")
    print(_template.invoke(input={}).text)