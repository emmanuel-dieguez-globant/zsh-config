#! /usr/bin/env python3
import re
from sys import argv, exit

if len(argv) < 2:
    print("Argumentos insuficientes")
    exit(1)

source = open(argv[1], 'r').read()

data = {
    "ca.crt": "<ca>.+</ca>",
    "cert.crt": "<cert>.+</cert>",
    "key.key": "<key>.+</key>"
}

for (file_name, value) in data.items():
    regex = re.compile(value, re.DOTALL)
    result = regex.findall(source)

    with open(file_name, "w") as output_file:
        output_file.writelines(result)
        output_file.close()
