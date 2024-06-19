from typing import Dict, Any
from llm_tools.common import save_to_file, read_file
from llm_tools.common.models import build_model
import os

GENERATE_CATEGORIES_SYSTEM_PROMPT = """Eres un experto en clasificacion de textos, el usuario va a dar una recopilacion de tickes en formato YAML, tu tarea de dar 15 clasificaciones en las que estos tickes podrian estar.
Incluye categorias para solicitud de permisos, ticket relacionados a boletas y tickets dificiles de clasificar
Tu resultado sera en formato YAML como el siguiente ejemplo:
- clasificacion: nombre de laclasificacion
 descripcion: Descripcion exhaustiva de la clasificacion 
- clasificacion: nombre de laclasificacion
 descripcion: Descripcion exhaustiva de la clasificacion 
- clasificacion: nombre de laclasificacion
 descripcion: Descripcion exhaustiva de la clasificacion
"""

LLM_DEFAULT_CONFIG = {
    "PROJECT_ID": "dea-analytics-prj-gemini",
    "LLM_LOCATION": "us-central1",
    "LLM_MODEL": "gemini-1.5-pro-preview-0514",
    "SYSTEM_PROMPT": GENERATE_CATEGORIES_SYSTEM_PROMPT,
    "MODEL_IMPLEMENTATION": "GEMINI_PRO"
}


def generate_categories(
        tickets_path: str,
        path_to_save: str | None,
        llm_config: Dict[str, Any] = LLM_DEFAULT_CONFIG
):
    prompt = read_file(tickets_path)
    model = build_model(llm_config)

    print("Calling llm...")
    response = model.generate_response(prompt=prompt)
    if isinstance(path_to_save, str):
        save_to_file(response, path_to_save)
        print("Saved to file", path_to_save)
    return response


if __name__ == "__main__":
    os.environ.setdefault(
        key="GOOGLE_APPLICATION_CREDENTIALS",
        value="/Volumes/case-sensitive-volume/LLM_TOOLS/credentials/data-chat-credentials.json"
    )
    generate_categories(
        tickets_path="../data/output_yamls.txt",
        path_to_save="../data/categories_gemini_pro.yaml",
        llm_config=LLM_DEFAULT_CONFIG
    )
