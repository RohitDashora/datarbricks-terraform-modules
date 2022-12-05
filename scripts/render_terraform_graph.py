import json
import networkx as nx

def render_terraform_graph(state_file_path):
    # read the Terraform state file
    with open(state_file_path, "r") as f:
        state = json.load(f)

    # create a directed graph using NetworkX
    graph = nx.DiGraph()

    # iterate over the resources in the Terraform state and add them to the graph
    for resource_type, resources in state["resources"].items():
        for resource in resources:
            graph.add_node(resource["name"])
            for dependency in resource["depends_on"]:
                graph.add_edge(dependency, resource["name"])

    # use NetworkX to render the graph
    nx.draw(graph, with_labels=True)


# specify the path to the Terraform state file
state_file_path = "scripts/render_terraform_graph.py"

# call the function to render the graph
render_terraform_graph(state_file_path)

