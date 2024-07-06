from langchain.prompts import PromptTemplate

_template = """ tu tarea es validar la siguiente estructura

categories con tickets a validar {categories_to_validate_tickets}

donde la estructura sigue el siguiente formato

- clasificacion: nombre de la clasificacion que viene de la categoria dada
  descripcion: descripcion que viene de la categoria dada
  tickets: [id ticket de jira relacionado que vienen en los tickets dados]

en los apartados de tickets validar que cada uno de los tickets de jira sigan el siguiente formato
DEAC-number

en caso de que todos los tickets sigan el formato regresa unicamente la estructura validada como se proporciono

en caso de que no siga el formato regresar un yml incorrecto

"""

VALIDATE_JIRA_FORMAT_IN_TICKETS = PromptTemplate(
    template=_template,
    input_variables=["categories_to_validate_tickets"]
)

if __name__ == "__main__":
    print(VALIDATE_JIRA_FORMAT_IN_TICKETS.invoke(input={"categories_to_validate_tickets": "tititickets"}).text)
