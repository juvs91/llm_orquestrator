from typing import List, Dict, Any
import json
import pandas as pd
import yaml


def get_df_from_excel(excel_path: str, sheet_name: str, header: int = 0) -> pd.DataFrame:
    df = pd.read_excel(excel_path, sheet_name=sheet_name, header=header)
    return df


def parse_yaml_from_file(
        file_path: str
) -> str:
    with open(file_path) as stream:
        return yaml.safe_load(stream)


def get_yaml_from_excel(
        excel_path: str,
        excel_sheet_name: str,
        columns_to_keep: List[str],
        excel_header: int = 0
) -> str:
    raw_df = get_df_from_excel(
        excel_path=excel_path,
        sheet_name=excel_sheet_name,
        header=excel_header
    )
    df = raw_df[columns_to_keep]
    json_data = df.to_json(orient="records")
    json_objects: List[Dict[str, Any]] = json.loads(json_data)
    yaml_object = yaml.dump(json_objects)
    return yaml_object


if __name__ == "__main__":
    parsed = parse_yaml_from_file("../data/categories_gemini.yaml")
    print(parsed)
