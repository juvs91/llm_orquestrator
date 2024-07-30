import argparse
from llm_tools.commands.execute_agent_from_file import build_and_execute_graph
from llm_tools.common.Nodes.graph_builder import build_graph_from_config
import os

if __name__ == "__main__":
    os.environ.setdefault("GOOGLE_APPLICATION_CREDENTIALS",
                          "/Volumes/case-sensitive-volume/LLM_TOOLS/credentials/data-chat-credentials.json")

    config_path = "configurations/generate_and_assign_categories.json"
    tickets_folder = "/Volumes/case-sensitive-volume/LLM_TOOLS/data/tickets_by_system"

    for filename in os.listdir(tickets_folder):
        file_path = os.path.join(tickets_folder, filename)
        system = filename
        graph = build_graph_from_config(config_path)
        graph.set_context("tickets_location", file_path)
        graph.set_context("categories_save_file_location", f"data/tickets_system_categories/categories/{system}.yaml")
        graph.set_context("assigned_tickets_location", f"data/tickets_system_categories/tickets/{system}.json")
        graph.process_input()
        os.remove(file_path)
        print("-"*30, "-"*30, sep="\n")
