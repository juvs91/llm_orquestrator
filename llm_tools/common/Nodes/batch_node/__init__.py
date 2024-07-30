from pydantic import BaseModel
from llm_tools.common.Nodes import NodeAbstract, NodeConfig, NodeOutput, Graph
from llm_tools.common import chunk_array


class BatchNodeConfig(BaseModel):
    next_node: str | None
    chunk_size: int
    process_node: str
    context_key_current_chunk: str
    context_key_array_to_process: str


class BatchNode(NodeAbstract):
    def __init__(self, config: NodeConfig, graph: Graph):
        super().__init__(config, graph)
        self.batch_node_config: BatchNodeConfig = BatchNodeConfig(**self.config.options)

    def process_input(self) -> NodeOutput:
        array_to_process = self.graph.get_context(self.batch_node_config.context_key_array_to_process)

        if isinstance(array_to_process,dict):
            print(f"Array in key {self.batch_node_config.context_key_array_to_process} is a dictionary",
                  "converting to array")
            array_to_process = list(array_to_process.items())

        print("Entering batch sequence")
        chunk_counter = 0

        for chunk in chunk_array(array_to_process, self.batch_node_config.chunk_size):
            chunk_counter += 1
            print(f"Processing chunk {chunk_counter} of size {len(chunk)}")
            self.graph.set_context(
                context_key=self.batch_node_config.context_key_current_chunk,
                context_value=chunk
            )
            self.graph.process_input_from_node(self.batch_node_config.process_node)

        return NodeOutput(
            next_node=self.batch_node_config.next_node
        )
