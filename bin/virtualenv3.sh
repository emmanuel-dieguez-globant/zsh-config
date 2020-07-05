#! /bin/bash
if [ ! -d ~/.virtualenvs ]; then
    mkdir -v ~/.virtualenvs
fi

if [ $# -eq 0 ]; then
    echo "Available virtualenvs:"
    ls ~/.virtualenvs
else
    /usr/bin/env virtualenv --python=/usr/bin/python3 --no-site-packages ~/.virtualenvs/$1
fi
