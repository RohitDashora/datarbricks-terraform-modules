import json
import networkx as nx
import matplotlib.pyplot as plt
import pandas as pd
from matplotlib.pyplot import figure
import sys
import argparse
import os
import subprocess

"""
The read_terraform_state() function takes a file path to a Terraform state file as input and reads the 
file using the json module. It then checks that the state variable is a dictionary and returns it.
"""

def read_terraform_state(state_file_path: str) -> dict:
    # read the Terraform state file
    with open(state_file_path, "r") as f:
        state = json.load(f)

    # check that the state variable is a dictionary
    if not isinstance(state, dict):
        raise ValueError("The Terraform state is not a valid JSON file.")

    return state

"""
The create_dependency_list() function takes a dictionary representing the Terraform state as input and 
creates a list of dependencies between resources in the state. It does this by iterating over the 
modules in the state and processing their resources, and it also processes the resources in any nested 
modules that may be present.
"""
def create_dependency_list(state: dict) -> list:
    # create empty list
    dependencies = []

    # helper function that processes resources in a given module
    def process_module(module):
        for resource_type, resources in module["resources"].items():
            dependencies.append((module["path"][0], resource_type, "creates"))
            if "depends_on" in resources:
                for dependency in resources["depends_on"]:
                    dependencies.append((dependency, resource_type, "depends_on"))

    # iterate over the modules in the Terraform state and process their resources
    for module in state["modules"]:
        process_module(module)

        # if the module has nested modules, process the resources in those as well
        if "child_modules" in module:
            for nested_module in module["child_modules"]:
                process_module(nested_module)

    return dependencies

"""
The create_directed_graph() function takes a list of dependencies as input and creates a directed graph 
using the networkx module. It does this by iterating over the dependencies and adding nodes and edges 
to the graph, with the dependency type as the edge label.
"""
def create_directed_graph(dependencies: list) -> nx.DiGraph:
    df = pd.DataFrame(dependencies, columns=["node1", "node2", "dependency_type"])

    # create a directed graph using NetworkX
    graph = nx.DiGraph()

    # iterate through pandas dataframe to get nodes
    for _, row in df.iterrows():
        graph.add_node(row["node1"])
        graph.add_node(row["node2"])
        graph.add_edge(row["node1"], row["node2"], label=row["dependency_type"])

    return graph
"""
The render_and_display_graph() function takes a directed graph as input and uses the matplotlib module 
to render and display the graph. It also uses the networkx module to add labels to the edges in the graph.
"""

def render_and_display_graph(graph: nx.DiGraph):
    edge_labels = nx.get_edge_attributes(graph, "label")

    # use NetworkX to render and display the graph
    nx.draw(
        graph,
        pos=nx.shell_layout(graph),
        arrowstyle="->",
        with_labels=True,
        node_size=1500,
        node_shape="s",
        font_size=12,
    )
    nx.draw_networkx_edge_labels(
        graph, edge_labels=edge_labels, font_size=8, pos=nx.shell_layout(graph)
    )
    plt.show()

"""
The read_and_render_terraform_state() function ties everything together by reading the Terraform state file, 
creating a list of dependencies, creating a directed graph, and rendering and displaying the graph.
"""
def read_and_render_terraform_state(state_file_path: str):
    try:
        # get the path to the Terraform state file from the command line arguments
        #state_file_path = sys.argv[1]

        state = read_terraform_state(state_file_path)
        dependencies = create_dependency_list(state)
        graph = create_directed_graph(dependencies)
        render_and_display_graph(graph)
    except Exception as e:
        # handle any errors that may occur
        print("Error:", e)


"""
the if __name__ == "__main__" block at the end of the code contains the main execution logic for the program. 
It parses the command line arguments using the argparse module and then calls the read_and_render_terraform_state() 
function with the path to the Terraform state file.
"""
if __name__ == "__main__":
    # parse the command line arguments
    parser = argparse.ArgumentParser()
    parser.add_argument("state_file_path", help="The path to the Terraform state file to rander")
    args = parser.parse_args()
    state_file_path=args.state_file_path


