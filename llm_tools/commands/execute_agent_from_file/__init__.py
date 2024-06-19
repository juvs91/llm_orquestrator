from llm_tools.common.Nodes.graph_builder import build_graph_from_config


def build_and_execute_graph(config_path: str):
    graph = build_graph_from_config(config_path)
    result = graph.process_input()
    print("-" * 30, "FINAL RESULT", "-" * 30, result, sep="\n")
