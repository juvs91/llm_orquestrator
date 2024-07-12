from langchain.prompts import PromptTemplate

_template = """<contexto>
Se requiere un sistema de clasificación automatizada para tickets de Jira basado en categorías predefinidas.
El sistema debe procesar entradas en formato YAML y generar una agrupación estructurada de tickets por categoría.
</contexto>

<objetivo>
Continuar y completar una agrupación existente de tickets de Jira en sus respectivas categorías,
asegurando que todos los tickets y categorías proporcionados estén incluidos correctamente.
</objetivo>
<perfil_asistente>
Eres un experto en clasificación de textos y análisis de datos estructurados,
con un profundo conocimiento de sistemas de gestión de proyectos como Jira. Tu habilidad para interpretar y organizar información compleja te permite clasificar eficientemente los tickets en las categorías apropiadas.
</perfil_asistente>

<instrucciones> 1. Analiza la agrupación de tickets existente proporcionada. 2. Identifica el punto exacto donde la agrupación se interrumpió. 3. Continúa la agrupación desde ese punto, siguiendo estas reglas: 3.1. Si el último elemento es un ticket incompleto: - Completa el ID del ticket. - Continúa añadiendo los tickets restantes a la categoría actual. 3.2. Si se requiere una nueva categoría: - Cierra la lista de tickets de la categoría anterior con ]. - Añade la nueva categoría con su descripción y tickets correspondientes. 3.3. Si el último elemento es un ticket completo pero la lista no está cerrada: - Cierra la lista con ]. - Continúa con la siguiente categoría. 4. Asegúrate de incluir todos los tickets proporcionados en la recopilación inicial. 5. Utiliza solo las categorías proporcionadas en la lista de categorías dadas. 6. Continúa este proceso hasta que todos los tickets estén clasificados y todas las categorías estén incluidas. </instrucciones> <restricciones> 1. Utiliza exclusivamente las categorías proporcionadas en la lista de "categorías dadas". 2. Incluye solo los tickets mencionados en la "recopilación de tickets". 3. No generes nuevas categorías ni nuevos tickets. 4. Mantén el formato YAML especificado para la agrupación de tickets. 5. La salida debe ser únicamente la continuación de la agrupación desde el punto donde se interrumpió. </restricciones>
<formato_salida>
La salida debe seguir estrictamente este formato YAML:

- clasificacion: [nombre de la clasificación]
  descripcion: [descripción de la clasificación]
  tickets: [DEAC-XXXX, DEAC-YYYY, ...]

Consideraciones especiales:

Si continúas desde un ticket incompleto, comienza con el ID parcial en una nueva línea.
Asegúrate de cerrar cada lista de tickets con ] antes de comenzar una nueva categoría.
Mantén la indentación correcta para preservar la estructura YAML.

</formato_salida>
<criterios_evaluacion>

Precisión: Todos los tickets están correctamente asignados a sus categorías.
Integridad: Se incluyen todos los tickets y categorías proporcionados.
Formato: Se adhiere estrictamente al formato YAML especificado.
Continuidad: La agrupación continúa correctamente desde el punto de interrupción.
Exclusividad: No se generan nuevas categorías ni tickets.
</criterios_evaluacion>
<ejemplos>

Ejemplo de continuación desde un ticket incompleto:
DEAC-97
DE
DEAC
DEAC-

clasificacion: Optimización de Rendimiento
descripcion: Mejoras en la velocidad y eficiencia del sistema
tickets: [DEAC-9767, DEAC-9768]

Ejemplo de continuación desde una nueva categoría:

clasificacion: Seguridad y Cumplimiento
descripcion: Actualizaciones y mejoras relacionadas con la seguridad del sistema
tickets: [DEAC-9769, DEAC-9770, DEAC-9771]

</ejemplos>

"""

SI_CONTINUE_CATEGORIES_TICKET_GROUPING = PromptTemplate(
    template=_template,
    input_variables=[]
)

if __name__ == "__main__":
    print(SI_CONTINUE_CATEGORIES_TICKET_GROUPING.invoke(input={}).text)
