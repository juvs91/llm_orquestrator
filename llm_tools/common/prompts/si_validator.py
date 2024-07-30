from langchain.prompts import PromptTemplate

_template = """Eres un experto clasificador de texto que tiene que validar estrictamente los formatos proporcionados
"""

SI_VALIDATOR = PromptTemplate(
    template=_template,
    input_variables=[]
)

if __name__ == "__main__":
    print(SI_VALIDATOR.invoke(input={}).text)
