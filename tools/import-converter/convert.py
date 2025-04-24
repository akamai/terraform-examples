import re
import sys

def convert_import_script_to_inline(input_file, output_file):
    with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
        outfile.write("# Auto-generated inline imports\n\n")
        for line in infile:
            line = line.strip()
            if line.startswith("terraform import"):
                # Parse the terraform import command
                match = re.match(r"terraform import (\S+)\s+(.+)", line)
                if match:
                    resource, resource_id = match.groups()
                    outfile.write(f'import {{\n  to = {resource}\n  id = "{resource_id}"\n}}\n\n')
        print(f"Inline imports written to {output_file}")

def main():
    # Get the input filename from command-line arguments or default to "import.sh"
    input_file = sys.argv[1] if len(sys.argv) > 1 else "import.sh"
    output_file = "import.tf"
    
    try:
        convert_import_script_to_inline(input_file, output_file)
    except FileNotFoundError:
        print(f"Error: The file '{input_file}' does not exist.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    main()