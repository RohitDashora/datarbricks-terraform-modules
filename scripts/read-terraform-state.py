import json
import pydot

# specify the path to the Terraform state file
terraform_state_file_path = "path/to/terraform.tfstate"

# read the state file as JSON
with open(terraform_state_file_path) as f:
    state_file_data = json.load(f)

# extract the graph data from the state file
graph_data = state_file_data["modules"][0]["outputs"]["graph"]["value"]

# create a graph using the extracted data
graph = pydot.Dot(graph_type="digraph")

# add nodes and edges to the graph
for node in graph_data["nodes"]:
    graph.add_node(pydot.Node(node))
for edge in graph_data["edges"]:
    graph.add_edge(pydot.Edge(edge[0], edge[1]))

# print the graph
print(graph.to_string())
