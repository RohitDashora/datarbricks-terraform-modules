import os
import sys
import pygraphviz as pgv

def render_dot_file(dot_file, output_file):
    try:
        # Check if the input file exists
        if not os.path.isfile(dot_file):
            raise IOError(f'{dot_file} does not exist')

        # Read the DOT file
        g = pgv.AGraph(dot_file)

        # Check if the output file exists
        if os.path.isfile(output_file):
            raise IOError(f'{output_file} already exists')

        # Render the graph
        g.draw(output_file, format='png')

    except IOError as e:
        # Handle I/O errors
        print(f'Error: {e}')

    except pgv.error.Error as e:
        # Handle errors from pygraphviz
        print(f'Error: {e}')

# Example usage
dot_file = sys.argv[1]
output_file = sys.argv[2]

# If no output file was specified, use the same filename as the input file
# but with a .png extension
if not output_file:
    output_file = os.path.splitext(dot_file)[0] + '.png'

render_dot_file(dot_file, output_file)
