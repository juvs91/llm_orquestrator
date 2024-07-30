from langchain.prompts import PromptTemplate

_template = """categories: 
{categories_raw}
Tickets
{tickets_chunk}
"""


CATEGORY_ASSIGNER = PromptTemplate(
    template=_template,
    input_variables=["tickets", "categories_raw"]
)

if __name__ == "__main__":
    print(CATEGORY_ASSIGNER.invoke(input={"tickets_chunk": "tititickets",
                                                            "categories_raw": "raaaaaw"}).text)
