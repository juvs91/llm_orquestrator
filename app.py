import json
import os
import signal
from typing import Any
import dotenv
from flask import Flask, jsonify, request, Response
from llm_tools.common.Nodes.graph_builder import build_graph_from_config


def create_app(
) -> Flask:
    dotenv.load_dotenv()
    lineage_graph_config_path = "configurations/get_origin_from_user_input_api.json"

    _app = Flask(__name__)

    @_app.route("/tools/lineage", methods=["GET"])
    def get_lineage() -> Response | tuple[Response, int]:
        try:
            user_prompt = request.args.get("user_prompt")
            if user_prompt is None:
                return jsonify({"error": "No user_prompt specified"}), 400
            graph = build_graph_from_config(lineage_graph_config_path)
            graph.set_context("user_prompt", user_prompt)
            context_result = graph.process_input()
            result = context_result.get("result_object")
            return jsonify(result)
        except Exception as error:
            return jsonify({"error": "Could execute graph correctly: " + str(error)}), 500

    return _app


if __name__ == "__main__":
    app = create_app()
