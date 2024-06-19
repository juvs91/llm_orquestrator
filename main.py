import argparse
from llm_tools.commands.execute_agent_from_file import build_and_execute_graph
import os

if __name__ == "__main__":
    os.environ.setdefault("GOOGLE_APPLICATION_CREDENTIALS",
                          "/Volumes/case-sensitive-volume/LLM_TOOLS/credentials/data-chat-credentials.json")
    parser = argparse.ArgumentParser(description="Ejecuta agentes de grafo")
    parser.add_argument("--path", required=True, help="Path a la configuración del grafo")
    args = parser.parse_args()

    build_and_execute_graph(args.path)
