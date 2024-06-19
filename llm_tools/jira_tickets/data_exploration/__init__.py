from typing import Dict, Any

import dtale
from llm_tools.jira_tickets.categorize.yaml_getter import get_df_from_excel


def open_dtale_browser(excel_config: Dict[str, Any]):
    excel_path: str = excel_config["excel_path"]
    sheet_name: str = excel_config["excel_sheet_name"]
    header: int = excel_config["header"]
    df = get_df_from_excel(excel_path, sheet_name, header)
    dt = dtale.show(df,host="0.0.0.0", subprocess=False)
    dt.open_browser()
    print("Opened")


if __name__ == "__main__":
    data_path = "../data/new_categories_2.xlsx"
    _config = {
        "excel_path": data_path,
        "excel_sheet_name": "Sheet1",
        "header": 0
    }
    open_dtale_browser(_config)
