from typing import Dict, List

from llm_tools.common.prompts.group_ticket_to_category import GROUP_TICKETS_TO_CATEGORIES
from llm_tools.common.prompts.si_continue_categories_tickets_grouping import SI_CONTINUE_CATEGORIES_TICKET_GROUPING
from llm_tools.common.prompts.si_generate_categories import SI_GENERATE_CATEGORIES_PROMPT_TEMPLATE
from llm_tools.common.prompts.generate_categories import GENERATE_CATEGORIES_PROMPT_TEMPLATE
from pydantic import BaseModel, field_validator
from langchain.prompts import PromptTemplate
from llm_tools.common.prompts.si_get_possible_origin_fields_from_dbt import SI_GET_POSSIBLE_ORIGIN_FIELDS_FROM_DBT
from llm_tools.common.prompts.get_possible_origin_fields_from_dbt import GET_POSSIBLE_ORIGIN_FIELDS_FROM_DBT
from llm_tools.common.prompts.si_group_tickets_to_categories import SI_GROUP_TICKETS_TO_CATEGORIES
from llm_tools.common.prompts.si_stop_ticket_grouping import SI_STOP_GROUPING_TICKETS
from llm_tools.common.prompts.si_validator import SI_VALIDATOR
from llm_tools.common.prompts.tickets_categories_grouping import GROUPING_CATEGORIES_TICKETS
from llm_tools.common.prompts.validate_jira_tickets_in_yml import VALIDATE_JIRA_FORMAT_IN_TICKETS
from llm_tools.common.prompts.category_assigner import CATEGORY_ASSIGNER
from llm_tools.common.prompts.si_category_assigner import SI_CATEGORY_ASSIGNER
from llm_tools.common.prompts.si_generate_sample_sql_data import SI_GENERATE_SAMPLE_SQL_DATA
from llm_tools.common.prompts.generate_sample_sql_data import GENERATE_SAMPLE_SQL_DATA

AVAILABLE_PROMPT_TEMPLATES: Dict[str, PromptTemplate] = {
    "SI_GENERATE_CATEGORIES_PROMPT_TEMPLATE": SI_GENERATE_CATEGORIES_PROMPT_TEMPLATE,
    "GENERATE_CATEGORIES_PROMPT_TEMPLATE": GENERATE_CATEGORIES_PROMPT_TEMPLATE,
    "SI_GET_POSSIBLE_ORIGIN_FIELDS_FROM_DBT": SI_GET_POSSIBLE_ORIGIN_FIELDS_FROM_DBT,
    "GET_POSSIBLE_ORIGIN_FIELDS_FROM_DBT": GET_POSSIBLE_ORIGIN_FIELDS_FROM_DBT,
    "SI_GROUP_TICKETS_TO_CATEGORIES": SI_GROUP_TICKETS_TO_CATEGORIES,
    "GROUP_TICKETS_TO_CATEGORIES": GROUP_TICKETS_TO_CATEGORIES,
    "VALIDATE_JIRA_FORMAT_IN_TICKETS": VALIDATE_JIRA_FORMAT_IN_TICKETS,
    "SI_VALIDATOR": SI_VALIDATOR,
    "SI_STOP_GROUPING_TICKETS": SI_STOP_GROUPING_TICKETS,
    "GROUPING_CATEGORIES_TICKETS": GROUPING_CATEGORIES_TICKETS,
    "SI_CONTINUE_CATEGORIES_TICKET_GROUPING": SI_CONTINUE_CATEGORIES_TICKET_GROUPING,
    "CATEGORY_ASSIGNER": CATEGORY_ASSIGNER,
    "SI_CATEGORY_ASSIGNER": SI_CATEGORY_ASSIGNER,
    "SI_GENERATE_SAMPLE_SQL_DATA": SI_GENERATE_SAMPLE_SQL_DATA,
    "GENERATE_SAMPLE_SQL_DATA": GENERATE_SAMPLE_SQL_DATA
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