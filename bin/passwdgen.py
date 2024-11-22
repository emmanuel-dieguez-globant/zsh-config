#! /usr/bin/env python
"""Symple python script to generate secure passwords."""

import random
import string

from sys import argv


password = str()
length = 16 if not len(argv) > 1 else int(argv[1])

for i in range(length):
    use_letter = random.choice([True, False])

    if use_letter:
        password += random.choice(string.letters)
    else:
        password += random.choice(string.digits)

print(password)
