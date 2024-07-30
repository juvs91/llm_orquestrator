
# Sistema de Abstracción de LLMs con Grafos

Este repositorio proporciona una forma de abstraer el uso de LLMs a través de grafos, que en conjunto generan un agente o un pipeline complejo.

### Descripción General

El sistema se basa en la construcción de grafos que representan flujos de trabajo para interactuar con LLMs. Cada nodo del grafo representa una acción específica, como leer un archivo, procesar un LLM, guardar datos o validar un formato.

### Configuración del Grafo

Cada nodo del grafo requiere la siguiente configuración:

```json
{
"max_iterations": int, // Número máximo de iteraciones para este nodo. Si se excede, se lanza una excepción.
"name": string, // Nombre del nodo.
"type": string, // Tipo de nodo. Debe ser un string válido entre los nodos disponibles.
"options": Dict, // Configuración específica del nodo, dependiendo del tipo.
}
```

### Ejecución del Grafo

Para ejecutar un grafo, se necesita una ruta hacia el archivo de configuración:

```bash
python main.py -path="ruta"
```

### Contexto del Grafo

El grafo tiene un diccionario interno que funciona como contexto al que los nodos pueden acceder para guardar o recuperar información.

### Tipos de Nodos Disponibles

#### 1. SaveFileNode

* **Descripción:** Lee de una variable de contexto y guarda el contenido en un archivo. La ruta puede ser dinámica o fija.
* **Configuración:**
* `next_node`: str | None: Nodo siguiente a ejecutar. Si es nulo, se termina la ejecución.
* `context_var_content_to_save`: str: Variable de contexto cuyo contenido se guardará.
* `context_var_path_to_save`: str | None: Variable de contexto de donde se recupera la ruta del archivo a guardar.
* `fixed_path_to_save`: str | None: Ruta fija del archivo donde se guardará el contenido.

#### 2. ParseYamlNode

* **Descripción:** Lee una variable de contexto y valida si es un YAML válido. Opcionalmente, puede guardar el contenido YAML como objeto en una variable de contexto.
* **Configuración:**
* `next_node_on_valid`: str | None: Nodo siguiente si el YAML es válido. Si es nulo, se termina la ejecución.
* `next_node_on_invalid`: str | None: Nodo siguiente si el YAML es inválido. Si es nulo, se termina la ejecución.
* `context_var_to_validate`: str: Variable de contexto que el nodo validará.
* `context_var_save_as_object`: str | None: Variable de contexto opcional donde se guardará el contenido como objeto de Python si el YAML es válido.

#### 3. SetContextNode

* **Descripción:** Guarda variables de contexto fijas.
* **Configuración:**
* `next_node`: str | None: Nodo siguiente. Si es nulo, se termina la ejecución.
* `context_to_save`: Dict[str, Any]: Variables de contexto a guardar. Las llaves son las claves de contexto.

#### 4. ReadFileNode

* **Descripción:** Lee el contenido de un archivo y guarda su contenido en una variable de contexto.
* **Configuración:**
* `next_node`: str | None: Nodo siguiente. Si es nulo, se termina la ejecución.
* `output_context`: str: Variable de contexto donde se guardará el contenido del archivo.
* `context_var_path`: str | None: Variable de contexto que contiene la ruta del archivo. Nulo si la ruta es fija.
* `fixed_path`: str | None: Ruta fija del archivo. Nulo si la ruta es dinámica.

#### 5. BatchNode

* **Descripción:** Ejecuta un array en batches. Cada batch se ejecuta en una rama del grafo.
* **Configuración:**
* `next_node`: str | None: Nodo siguiente al terminar de procesar todos los batches.
* `chunk_size`: int: Tamaño de los batches.
* `process_node`: str: Nodo donde empieza la rama del nodo a procesar por cada batch.
* `context_key_current_chunk`: str: Variable de contexto donde se guardará el batch actual a procesar.
* `context_key_array_to_process`: str: Variable de contexto que el nodo recuperará para procesar en batches. Debe ser una lista o un diccionario. Si es un diccionario, se convertirá a una lista.

#### 6. LogNode

* **Descripción:** Nodo para imprimir variables de contexto en consola.
* **Configuración:**
* `next_node`: str | None: Nodo siguiente, si es nulo, se termina la ejecución del grafo.
* `print_context_var`: str | None: Variable de contexto que el nodo va a imprimir en consola, opcional.
* `print_context`: bool : Si es verdadero, se imprimirá en consola todo el contexto del nodo.

#### 7. ConcatenateFiles

* **Descripción:** En base a un directorio, concatena en un string, todos los contenidos de los archivos del directorio con una extensión especificada y un separador de string.
* **Configuración:**
* `next_node`: str | None: Nodo siguiente, si es nulo, se termina la ejecución del grafo.
* `directory`: str : Directorio a leer.
* `file_extension`: str : Extension de los archivos a leer.
* `separator`: str : Separador de archivos.
* `context_var_to_save`: str : Variable de contexto en donde se guardará el string de los archivos concatenados.

#### 8. AppendToArrayNode

* **Descripción:** Añade una variable al final de una lista. Si la lista no existe, la crea, si la variable es otra lista, suma las dos listas.
* **Configuración:**
* `next_node`: str | None : Nodo siguiente, si es nulo, se termina la ejecución del grafo.
* `context_key_var_to_append`: str : Variable de contexto de la variable a agregar a una lista.
* `context_key_array_append_to`: str : Variable de contexto de la lista a crear o en caso de que existe a la que se va a agregar la variable al final de la lista.

#### 9. ObjectToYamlNode

* **Descripción:** Transforma un objeto a formato YAML en un string
* **Configuración:**
* `next_node`: str | None : Nodo siguiente, si es nulo, se termina la ejecución del grafo.
* `context_key_object_to_convert`: str : Variable de contexto que va a ser convertida a YAML
* `context_key_yaml_to_save`: Variable en donde se guardará el yaml string.

#### 10. SaveFileAsJson

* **Descripción:** Guarda un objeto de python en un archivo en formato json, error si el objeto no es serializable.
* **Configuración:**
* `next_node`: str | None : Nodo siguiente, si es nulo, se termina la ejecución del grafo.
* `context_var_content_to_save`: str : Variable de contexto que contiene el objeto a guardar.
* `context_var_path_to_save`: str | None : Variable de contexto que contiene la ruta a guardar, nulo si la ruta es fija.
* `fixed_path_to_save`: str | None : Ruta fija en donde se guardará el archivo, nulo si la ruta es dinámica.


#### 11. ArrayToString

* **Descripción:** Concatena todos los elementos de una lista en un string y guarda el resultado en contexto.
* **Configuración:**
* `next_node`: str | None : Nodo siguiente, si es nulo, se termina la ejecución del grafo.
* `context_var_array`: str : Variable de contexto que contiene la lista.
* `context_var_to_save`: str : Variable de contexto en donde se guardará el resultado.
* `separator`: str : Separador de la lista al momento de concatenar en un solo string.

#### 12. ConcatenateFilesInArray

* **Descripción:** Concatena todos los archivos con una extensión específica de un directorio en una lista.
* **Configuración:**
* `next_node`: str | None : Nodo siguiente, si es nulo, se termina la ejecución del grafo.
* `directory`: str : Directorio que contiene los archivos.
* `file_extension`: str : Extension de los archivos a concatenar.
* `context_var_to_save`: str : Variable de contexto en donde se gaurdara la lista.

#### 13. LLMNode

* **Descripción:** Ejecuta un LLM con un prompt y un system_prompt. El prompt se construye a partir de una lista de prompts, cada uno con diferentes inputs que se obtienen de las variables de contexto.
* **Configuración:**
* `llm_node_type`: str: Tipo de LLM a utilizar (ver LLMs Disponibles).
* `next_node`: str | None: Nodo siguiente. Si es nulo, se termina la ejecución del grafo.
* `output_context`: str: Variable de contexto donde se guardará el resultado del prompt.
* `context_vars_prompt`: List[str]: Variables de contexto que contienen los inputs necesarios para construir el prompt.
* `options`: dict: Opciones específicas del LLM seleccionado (ver LLMs Disponibles).

#### 14. CustomProcessNode

* **Descripción:** Ejecuta un proceso personalizado creado por el desarrollador.
* **Configuración:**
* `next_node`: str | None: Nodo siguiente. Si es nulo, se termina la ejecución del grafo.
* `process_name`: str: Nombre del proceso a ejecutar (ver `llm_tools/common/CustomProcesses/custom_process_builder.py`).
* `context_vars_input_context`: Dict[str, str]: Mapeo entre variables de contexto del grafo y nombres de variables del proceso.
* `context_save_vars_output_context`: Dict[str, str]: Mapeo entre nombres de variables del resultado del proceso y variables de contexto del grafo.

## LLMs Disponibles

Todos los LLMs tienen la siguiente configuración:

| Parámetro | Tipo | Descripción |
|---|---|---|
| `system_prompt_template_name` | string | Nombre del system prompt. |
| `system_prompt_input_values` | Dict[str, Any] | Variables de input que necesita el system prompt. |
| `prompt_template_name` | string | Prompt a generar al momento de ejecución del nodo. |
| `temperature` | float | Temperatura del LLM (valor por defecto: 0.0). |
| `options` | Dict | Opciones del LLM en específico. |

### Opciones de LLM:

#### GEMINI_PRO

**Descripción:** Accede a Gemini Pro o modelos específicos de Google.

**Configuración:**

| Parámetro | Tipo | Descripción |
|---|---|---|
| `PROJECT_ID` | string | Nombre del proyecto en donde se accede a Gemini. |
| `LLM_LOCATION` | string | Región de Google. |
| `LLM_MODEL` | string | Nombre del modelo. |

## Ejemplo de configuration de grafo:
```json
[
  {
        "max_iterations": 1,
        "name": "START",
        "type": "READ_FILE_NODE",
        "options": {
            "next_node": "llm_generate_categories",
            "output_context": "tickets",
            "context_var_path": null,
            "fixed_path": "/Volumes/case-sensitive-volume/LLM_TOOLS/llm_tools/jira_tickets/data/output_yamls.txt"
        }
    },
  {
        "max_iterations": 3,
        "name": "llm_generate_categories",
        "type": "LLM_NODE",
        "options": {
            "llm_node_type": "GEMINI",
            "next_node": "validate_yaml_node",
            "output_context": "categories_raw",
            "context_vars_prompt": ["tickets"],
            "options": {
                "system_prompt_template_name": "SI_GENERATE_CATEGORIES_PROMPT_TEMPLATE",
                "system_prompt_input_values": {},
                "prompt_template_name": "GENERATE_CATEGORIES_PROMPT_TEMPLATE",
                "temperature": 0.0,
                "options": {
                    "project_id": "dea-analytics-prj-gemini",
                    "region": "us-central1",
                    "gcp_model_name": "gemini-1.5-pro-preview-0514"
                }
            }
        }
    },
  {
        "max_iterations": 3,
        "name": "validate_yaml_node",
        "type": "PARSE_YAML_NODE",
        "options": {
          "next_node_on_valid": "END",
          "next_node_on_invalid": "llm_generate_categories",
          "context_var_to_validate": "categories_raw",
          "context_var_save_as_object": null
        }
  },
  {
        "max_iterations": 1,
        "name": "END",
        "type": "SAVE_FILE_NODE",
        "options": {
          "next_node": "NO NODE",
          "context_var_content_to_save": "categories_raw",
          "context_var_path_to_save": null,
          "fixed_path_to_save": "categories_raw.yaml"
        }
    }
]
```

