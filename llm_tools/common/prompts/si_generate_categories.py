from langchain.prompts import PromptTemplate

_template = """Eres un experto en clasificacion de textos, el usuario va a dar una recopilacion de tickes en formato YAML, tu tarea de dar 15 clasificaciones en las que estos tickes podrian estar.
Incluye categorias para solicitud de permisos, ticket relacionados a boletas y tickets dificiles de clasificar
Tu resultado sera en formato YAML como el siguiente ejemplo:
- clasificacion: nombre de laclasificacion
 descripcion: Descripcion exhaustiva de la clasificacion 
- clasificacion: nombre de laclasificacion
 descripcion: Descripcion exhaustiva de la clasificacion 
- clasificacion: nombre de laclasificacion
 descripcion: Descripcion exhaustiva de la clasificacion
"""

SI_GENERATE_CATEGORIES_PROMPT_TEMPLATE = PromptTemplate(
    template=_template,
    input_variables=[]
)

if __name__ == "__main__":
    print(SI_GENERATE_CATEGORIES_PROMPT_TEMPLATE.invoke(input={}).text)
