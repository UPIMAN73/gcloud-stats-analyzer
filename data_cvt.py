#!/env/python3

# Imports
from common import *

# Setting Variables
pretty_print = False

# Required Variables
HOME_DIR = os.getenv('HOME')
LOG_DIR = HOME_DIR + "/logs"
ovearll_file_name = LOG_DIR + "/overall_stats"
output_file_name = HOME_DIR + "/gcp_grafana/data.json"
overall_file_keys = []
overall_file_values = []
overall_file = open(ovearll_file_name, "r")
output_dict = {}

# Read file and sort info based on proper notation
for line in overall_file.readlines():
    line_array = line.split(": ") # split line into an array based on ": " delimiter
    
    # associate values with appropriate arrays
    overall_file_keys.append(replace_spaces(line_array[0])) # replace spaces with _ in string
    overall_file_values.append(int(line_array[1]))
# END OF LOOP

overall_file.close() # Close overall file

# importing data from overall associated arrays into a dictionary
for key in overall_file_keys:
    output_dict[key] = overall_file_values[overall_file_keys.index(key)]
# END OF LOOP

# Write dictionary contents to output file
output_file = open(output_file_name, "w")

if pretty_print:
    # if pretty print is enabled
    output_file.write(dict_to_json_pretty(output_dict))
else:
    # otherwise do a compressed json ouput
    output_file.write(dict_to_json(output_dict))

# Close the file
output_file.close()