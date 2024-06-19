from llm_tools.common.Nodes.node_builder import build_node


if __name__ == "__main__":
    _config = {
        "max_iterations": 2,
        "name": "START",
        "type": "READ_FILE_NODE",
        "options": {
            "next_node": "next_no",
            "output_field": "field",
            "fixed_path": None
        }
    }
    _node = build_node(_config, None)
    print(_node.process_input("/Volumes/case-sensitive-volume/LLM_TOOLS/requirements.txt"))