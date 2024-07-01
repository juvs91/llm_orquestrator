from langchain.prompts import PromptTemplate

_template = """Eres un experto en clasificacion de textos, el usuario va a dar una recopilacion de tickes en formato YAML y las categorias formadas apartir de esos tickets en formato YAML,
tu tarea es agrupar cada ticket de jira a la categría que mas se le relacione.
Recuerda no dejar ni un solo ticket sin asignar, todos los tickets tienen que tener categoria
Recuerda escribir los tickets de jira completos, vienen en format de DEAC-number
Tu resultado sera en formato YAML como el siguiente ejemplo:
- clasificacion: nombre de la clasificacion que viene de la categoria dada
  descripcion: descripcion que viene de la categoria dada
  tickets: [id ticket de jira relacionado que vienen en los tickets dados]
"""

SI_GROUP_TICKETS_TO_CATEGORIES = PromptTemplate(
    template=_template,
    input_variables=[]
)

if __name__ == "__main__":
    print(SI_GROUP_TICKETS_TO_CATEGORIES.invoke(input={}).text)
