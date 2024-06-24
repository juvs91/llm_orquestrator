import json
import os
import signal
from typing import Any
import dotenv
from flask import Flask, jsonify, request, Response
from llm_tools.common.Nodes.graph_builder import build_graph_from_config
from llm_tools.common.origin_mapping import get_origin
from llm_tools.common.origin_mapping.bigquery_tables import get_bigquery_tables
from llm_tools.commands.get_lineage import get_lineage

def create_app(
) -> Flask:
    dotenv.load_dotenv()
    lineage_graph_config_path = "configurations/get_origin_from_user_input_api.json"
    dbt_table_path = "dbo_tables"

    _app = Flask(__name__)

    @_app.route("/tools/lineage", methods=["GET"])
    def get_lineage_api() -> Response | tuple[Response, int]:
        try:
            user_prompt = request.args.get("user_prompt")
            if user_prompt is None:
                return jsonify({"error": "No user_prompt specified"}), 400
            result = get_lineage(
                user_prompt=user_prompt,
                lineage_graph_config_path=lineage_graph_config_path,
                dbt_table_path=dbt_table_path
            )
            return jsonify(result)
        except Exception as error:
            return jsonify({"error": "Could execute correctly: " + str(error)}), 500

    return _app


if __name__ == "__main__":
    app = create_app()
