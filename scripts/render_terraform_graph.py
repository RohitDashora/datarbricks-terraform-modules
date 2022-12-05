import json
import networkx as nx
import matplotlib.pyplot as plt
import pandas as pd
from matplotlib.pyplot import figure


def read_and_render_terraform_state(state_file_path: str):
    try:
        # read the Terraform state file
        with open(state_file_path, "r") as f:
            state = json.load(f)

        # check that the state variable is a dictionary
        if not isinstance(state, dict):
            raise ValueError("The Terraform state is not a valid JSON file.")

       # cretae empty list
        dependencies = []

        # iterate over the modules in the Terraform state and add them to the list
        for module in state["modules"]:
            for resource_type, resources in module["resources"].items():
                dependencies.append(
                    (module["path"][0], resource_type, 'creates'))
                if ('depends_on' in resources):
                    for dependency in resources['depends_on']:
                        dependencies.append(
                            (dependency, resource_type, 'depends_on'))

        df = pd.DataFrame(dependencies, columns=[
                          'node1', 'node2', 'dependency_type'])

        # create a directed graph using NetworkX
        graph = nx.DiGraph()

        # iterate through pandas dataframe to get nodes
        for _, row in df.iterrows():
            graph.add_node(row["node1"])
            graph.add_node(row["node2"])
            graph.add_edge(row["node1"], row["node2"],
                           label=row["dependency_type"])

        edge_labels = nx.get_edge_attributes(graph, 'label')

        # use NetworkX to render and display the graph
        nx.draw(graph, pos=nx.shell_layout(graph),
                arrowstyle='->', with_labels=True,
                node_size=1500, node_shape="s",
                 font_size=12 )
        nx.draw_networkx_edge_labels(
            graph, edge_labels=edge_labels, font_size=8, pos=nx.shell_layout(graph))
        plt.show()

    except Exception as e:
        # handle any errors that may occur
        print("Error:", e)


# specify the path to the Terraform state file
state_file_path = "scripts/example.tfstate"
read_and_render_terraform_state(state_file_path)
