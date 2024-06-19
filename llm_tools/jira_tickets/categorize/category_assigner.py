import json
from typing import Dict, Any, List

import pandas as pd
import os

import yaml

from llm_tools.jira_tickets.categorize.yaml_getter import get_df_from_excel
from tqdm import tqdm
from llm_tools.common import read_file
from llm_tools.common.models import build_model

SYSTEM_PROMPT_ASSIGNER = """El usuario te proporcionará la información de un ticket de jira y sus posibles categorías 
en formato yaml, tu tarea es asignara ese ticket a una de las categorías posibles, tu respuesta de salida solo sera 
el nombre de la categoría Recuerda: - No agregues información adicional al nombre de la categoría - Tu respuesta solo 
contendrá la categoría del ticket, sin incluir ninguna justificación
Tu respuesta estara en el siguiente formato yaml formato YAML
categoria: nombre de categoria
descripcion: descripcion de la categoria
"""

LLM_DEFAULT_CONFIG = {
    "PROJECT_ID": "dea-analytics-prj-gemini",
    "LLM_LOCATION": "us-central1",
    "LLM_MODEL": "gemini-1.0-pro-002",
    "SYSTEM_PROMPT": SYSTEM_PROMPT_ASSIGNER,
    "MODEL_IMPLEMENTATION": "GEMINI_PRO"
}

LLM_CLAUDE_SONNET_CONFIG = {
    "PROJECT_ID": "dea-analytics-prj-gemini",
    "LLM_LOCATION": "us-central1",
    "LLM_MODEL": "claude-3-sonnet@20240229",
    "SYSTEM_PROMPT": SYSTEM_PROMPT_ASSIGNER,
    "MODEL_IMPLEMENTATION": "CLAUDE"
}

LLM_CLAUDE_OPUS_CONFIG = {
    "LLM_MODEL": "claude-3-opus@20240229",
    "LLM_LOCATION": "us-east5",
    "PROJECT_ID": "dea-analytics-prj-gemini",
    "SYSTEM_PROMPT": SYSTEM_PROMPT_ASSIGNER,
    "MODEL_IMPLEMENTATION": "CLAUDE"
}


class CategoryAssigner:
    def __init__(self,
                 model_config: Dict[str, Any],
                 tickets_excel_config: Dict[str, Any],
                 categories_yaml_path: str
                 ):
        self.model = build_model(model_config)
        self.tickets_excel_config = tickets_excel_config
        self.categories_yaml: str = read_file(categories_yaml_path)
        self.categories_obj: List[Dict[str, Any]] = (yaml.safe_load(self.categories_yaml))

    def _assign_category(self, row):
        ticket_description = row["Description"]
        ticket_type = row["Type"]
        prompt = f"""
        Ticket de jira: Descripcion: {ticket_description}, tipo de ticket: {ticket_type}
        Posibles categorías:
        {self.categories_yaml}"""
        assigned_category = "Could not assign category"

        try:
            response = self.model.generate_response(prompt=prompt).lower()
            for possible_category_obj in self.categories_obj:
                possible_cat: str = possible_category_obj["clasificacion"]
                if response.lower().__contains__(possible_cat.lower()):
                    assigned_category = possible_cat
        except Exception as error:
            print(f"Error assigning category to ticket {ticket_description} ", error)

        row["category"] = assigned_category
        print("Category:", assigned_category, "Description", ticket_description)
        return row

    def assign_categories(self, path_to_save_df: str) -> None:
        excel_path: str = self.tickets_excel_config["excel_path"]
        sheet_name: str = self.tickets_excel_config["excel_sheet_name"]
        header: int = self.tickets_excel_config["header"]
        df = get_df_from_excel(excel_path, sheet_name, header)
        df["category"] = "No category assigned"
        tqdm.pandas(desc="Assigning categories")
        df: pd.DataFrame = df.progress_apply(self._assign_category, axis=1)
        df.to_excel(path_to_save_df)
        print("Saved excel", path_to_save_df)


if __name__ == "__main__":
    os.environ.setdefault(
        key="GOOGLE_APPLICATION_CREDENTIALS",
        value="/Volumes/case-sensitive-volume/LLM_TOOLS/credentials/data_w.json"
    )
    data_path = "../data/JiraTickets20240524.xlsx"
    _config = {
        "excel_path": data_path,
        "excel_sheet_name": "Tickets total",
        "header": 0
    }
    assigner = CategoryAssigner(
        model_config=LLM_DEFAULT_CONFIG,
        tickets_excel_config=_config,
        categories_yaml_path="../data/categories_gemini_pro.yaml"
    )
    assigner.assign_categories("../data/new_categories_2.xlsx")
