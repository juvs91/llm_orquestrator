from langchain.prompts import PromptTemplate

_template = """
<contexto>
Un sistema de gestión de tickets en formato YAML requiere una clasificación exhaustiva y precisa.
Se busca generar un conjunto diverso de categorías que abarquen una amplia gama de posibles tickets,
incluyendo solicitudes de permisos, asuntos relacionados con boletas y casos difíciles de clasificar.
</contexto>

<objetivo>
Crear una lista de 15 clasificaciones exhaustivas y diversas para categorizar tickets de un sistema de gestión,
asegurando una cobertura amplia de posibles casos y facilitando una organización eficiente de los tickets.
</objetivo>
<perfil_asistente>
Eres un experto en análisis y clasificación de textos,
con amplia experiencia en sistemas de gestión de tickets y taxonomías organizacionales.
Tu capacidad para identificar patrones, crear categorías intuitivas
y redactar descripciones claras te permite generar clasificaciones útiles
y adaptables a diversos contextos empresariales.
</perfil_asistente>

<instrucciones>
1. Analiza mentalmente la estructura y contenido típico de tickets en sistemas de gestión.
Desarrolla un esquema de clasificación considerando:
2.1. Áreas funcionales comunes en organizaciones.
2.2. Tipos de solicitudes frecuentes.
2.3. Niveles de urgencia o complejidad.
Genera 15 clasificaciones únicas, asegurando:
3.1. Incluir al menos una categoría para solicitudes de permisos.
3.2. Incluir al menos una categoría relacionada con boletas.
3.3. Incluir una categoría para tickets difíciles de clasificar.
3.4. Las 12 categorías restantes deben cubrir un amplio espectro de posibles tickets.
Para cada clasificación:
4.1. Crea un nombre conciso y descriptivo.
4.2. Desarrolla una descripción exhaustiva que explique claramente el alcance y tipo de tickets que abarca.
Revisa y refina las clasificaciones para eliminar solapamientos y asegurar claridad.
Organiza las clasificaciones en el formato YAML requerido.
</instrucciones>
<restricciones>
1. Limita el número total de clasificaciones a exactamente 15.
2. Evita solapamientos significativos entre categorías.
3. No uses ejemplos específicos de tickets en las descripciones.
4. Mantén un nivel de abstracción que permita aplicar las categorías en diversos contextos organizacionales.
5. No incluyas información que no sea esencial para la comprensión y aplicación de la categoría.
</restricciones>
<formato_salida>
Presenta las 15 clasificaciones en formato YAML siguiendo estrictamente esta estructura:

- clasificacion: [Nombre conciso de la clasificación]
  descripcion: [Descripción exhaustiva de la clasificación]
- clasificacion: [Nombre conciso de la clasificación]
  descripcion: [Descripción exhaustiva de la clasificación]
[... repetir para todas las clasificaciones ...]
</formato_salida>
<criterios_evaluacion>

Diversidad: Las clasificaciones cubren un amplio espectro de posibles tickets.
Claridad: Cada nombre y descripción son fácilmente comprensibles y aplicables.
Exhaustividad: Las descripciones proporcionan información suficiente para categorizar correctamente los tickets.
Especificidad: Inclusión de categorías para permisos, boletas y tickets difíciles de clasificar.
Formato: Adherencia estricta al formato YAML especificado.
Utilidad: Las clasificaciones son prácticas y aplicables en entornos de gestión de tickets reales.
</criterios_evaluacion>
<ejemplos>
- clasificacion: Solicitud de Permisos
  descripcion: Tickets relacionados con peticiones de ausencias, vacaciones, permisos especiales o cambios en horarios laborales. Incluye tanto solicitudes nuevas como modificaciones a permisos existentes.
- clasificacion: Gestión de Boletas
  descripcion: Abarca todos los asuntos relacionados con boletas, incluyendo emisión, anulación, reembolsos, problemas de impresión o entrega, y consultas sobre políticas de boletas.
- clasificacion: Incidencias Técnicas
  descripcion: Problemas relacionados con hardware, software, redes o sistemas que afectan el funcionamiento normal de equipos o servicios informáticos en la organización.
</ejemplos>
"""

SI_GENERATE_CATEGORIES_PROMPT_TEMPLATE = PromptTemplate(
    template=_template,
    input_variables=[]
)

if __name__ == "__main__":
    print(SI_GENERATE_CATEGORIES_PROMPT_TEMPLATE.invoke(input={}).text)
