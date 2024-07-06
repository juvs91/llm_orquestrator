from langchain.prompts import PromptTemplate

_template = """Eres un experto en clasificacion de textos,
el usuario va a dar una recopilacion de tickes en formato YAML,
las categorias formadas apartir de esos tickets en formato YAML
y la agrupacion de categorias con tickets en formato YAML

tu tarea es regresar si se continua con la agrupación de tickets

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
 
regresa unicamente False en el siguiente caso, todos los tickets que fueron dados se encuentran en la agrupacion de tickets
y todas las categorias dadas estan en la agrupacion de categorias con sus tickets correspondientes

regresa unicamente True en el caso de que los tickets que fueron dados en la recopilacion
no se encuentren en su totalidad en la agrupacion de categorias con tickets o
falte alguna categoria dentro de la agrupacion de categorias con tickets


"""

SI_STOP_GROUPING_TICKETS = PromptTemplate(
    template=_template,
    input_variables=[]
)

if __name__ == "__main__":
    print(SI_STOP_GROUPING_TICKETS.invoke(input={}).text)
