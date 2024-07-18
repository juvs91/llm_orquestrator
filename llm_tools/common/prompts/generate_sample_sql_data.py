from langchain.prompts import PromptTemplate

_template = """{prompt_schemas}"""

GENERATE_SAMPLE_SQL_DATA = PromptTemplate(
    template=_template,
    input_variables=["prompt_schemas"]
)

if __name__ == "__main__":
    print(GENERATE_SAMPLE_SQL_DATA.invoke(input={"prompt_schemas": "tititickets"}).text)
