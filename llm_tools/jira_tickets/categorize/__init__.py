from llm_tools.jira_tickets.categorize.yaml_getter import get_yaml_from_excel

if __name__ == "__main__":
    data_path = "../data/JiraTickets20240524.xlsx"
    _yaml = get_yaml_from_excel(
        excel_path=data_path,
        excel_sheet_name="Tickets total",
        columns_to_keep=["Description", "Type"]
    )
    with open("../data/output_yamls.txt", "w") as file:
        # Write the text to the file
        file.write(_yaml)
