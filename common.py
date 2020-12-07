# Imports
import os
import json

# Replace spaces with _
def replace_spaces(line):
    res = ""
    for i in line:
        if i == " ":
            res += "_"
        else:
            res += i
    return res

# Convert a dictionary type to a json type
def dict_to_json(dic):
    return json.dumps(dic, sort_keys=True, separators=(',', ':'))

def dict_to_json_pretty(dic):
    return json.dumps(dic, sort_keys=True, separators=(',', ':'), indent=4)