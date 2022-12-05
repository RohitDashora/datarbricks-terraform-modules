import json
import networkx as nx
import matplotlib.pyplot as plt

# specify the path to the Terraform state file
state_file_path = "path/to/terraform.tfstate"

def read_and_render_terraform_state(state_file_path: str):
    try:
        # read the Terraform state file
        with open(state_file_path, "r") as f:
            state = json.load(f)

        # check that the state variable is a dictionary
        if not isinstance(state, dict):
            raise ValueError("The Terraform state is not a valid JSON file.")

        # create a directed graph using NetworkX
        graph = nx.DiGraph()

        # iterate over the modules in the Terraform state and add them to the graph
        for module in state["modules"]:
            graph.add_node(module["path"][0])
            for resource in module["resources"].values():
                graph.add_node(resource["name"])
                graph.add_edge(module["path"][0], resource["name"])

        # use NetworkX to render and display the graph
        nx.draw(graph, with_labels=True)
        plt.show()
    except Exception as e:
        # handle any errors that may occur
        print("Error:", e)
