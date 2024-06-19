from langchain.prompts import PromptTemplate

_template = """{tickets}"""

GENERATE_CATEGORIES_PROMPT_TEMPLATE = PromptTemplate(
    template=_template,
    input_variables=["tickets"]
)

if __name__ == "__main__":
    print(GENERATE_CATEGORIES_PROMPT_TEMPLATE.invoke(input={"tickets": "tititickets"}).text)
