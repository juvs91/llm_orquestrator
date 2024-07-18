from langchain.prompts import PromptTemplate

_template = """A continuación se te proporcionara una lista de tablas de SQL, tu tarea es generar datos de prueba para cada una de las tablas,
crea tres registros de prueba para cada tabla.
Para los identificadores solo usa números entre el 1 y el 10

Tu salida solo contendra la respuesta en el formato especificado, sin informacion adicional.
No agregues elementos de formato markdown , solo el formato
Formato:
- insert_statement: sample insert here
- insert_statement: sample insert here
- insert_statement: sample insert here
"""

SI_GENERATE_SAMPLE_SQL_DATA = PromptTemplate(
    template=_template,
    input_variables=[]
)

if __name__ == "__main__":
    print(SI_GENERATE_SAMPLE_SQL_DATA.invoke(input={}).text)
