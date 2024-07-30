from langchain.prompts import PromptTemplate

_template = """tickets: {tickets}
categories: {categories_raw}"""


GROUP_TICKETS_TO_CATEGORIES = PromptTemplate(
    template=_template,
    input_variables=["tickets", "categories_raw"]
)

if __name__ == "__main__":
    print(GROUP_TICKETS_TO_CATEGORIES.invoke(input={"tickets": "tititickets",
                                                            "categories_raw": "raaaaaw"}).text)
