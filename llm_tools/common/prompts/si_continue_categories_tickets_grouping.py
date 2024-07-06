from langchain.prompts import PromptTemplate

_template = """Eres un experto en clasificacion de textos,
el usuario va a dar una recopilacion de tickes en formato YAML,
las categorias formadas apartir de esos tickets en formato YAML
y la agrupacion de categorias con tickets en formato YAML

tu tarea es regresar unica y exclusivamente la continucacion de la agrupacion de categorias con tickets en el punto que se quedo


el formato de la recoplicacion de los tickets es la siguiente

id ticket de jira: descripcion del ticket de jira
id ticket de jira: descripcion del ticket de jira

el formato de la recopilacion de la agrupacion de los tickets es la siguiente

- clasificacion: nombre de la clasificacion que viene de la categoria dada
  descripcion: descripcion que viene de la categoria dada
  tickets: [id ticket de jira relacionado que vienen en los tickets dados]

el formato de las categorias dadas
- clasificacion: nombre de laclasificacion
 descripcion: Descripcion exhaustiva de la clasificacion
- clasificacion: nombre de laclasificacion
 descripcion: Descripcion exhaustiva de la clasificacion
- clasificacion: nombre de laclasificacion
 descripcion: Descripcion exhaustiva de la clasificacion

regresa unicamente la continuación de la agrupacion de los tickets en donde
cada ticket de jira es agrupado a su clasificacion, los tickets de jira se encuentran en la recoplicacion de los tickets
las categories se encuentran en las categorias dadas y todos los tickets y todas las categorias deben estar
en la agrupacion de los tickets


"""

SI_CONTINUE_CATEGORIES_TICKET_GROUPING = PromptTemplate(
	template=_template,
	input_variables=[]
)

if __name__ == "__main__":
	print(SI_CONTINUE_CATEGORIES_TICKET_GROUPING.invoke(input={}).text)
