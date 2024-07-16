from langchain.prompts import PromptTemplate

_template = """tickets: {tickets}
categories: {categories_raw}
grouped_categories_tickets: {grouped_categories_tickets}
"""


GROUPING_CATEGORIES_TICKETS = PromptTemplate(
    template=_template,
    input_variables=["tickets", "categories_raw"]
)

if __name__ == "__main__":
    print(GROUPING_CATEGORIES_TICKETS.invoke(input={"tickets": "tititickets",
                                                            "categories_raw": "raaaaaw"}).text)
