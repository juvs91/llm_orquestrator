from langchain.prompts import PromptTemplate

_template = """
Pregunta del usuario
{user_prompt}

Vistas DBT en formato YAML
{dbt_tables}
"""

GET_POSSIBLE_ORIGIN_FIELDS_FROM_DBT = PromptTemplate(
    template=_template,
    input_variables=["user_prompt", "dbt_tables"]
)

if __name__ == "__main__":
    print(GET_POSSIBLE_ORIGIN_FIELDS_FROM_DBT.invoke(input={"user_prompt": "Aiuda", "dbt_tables": "tables"}).text)
