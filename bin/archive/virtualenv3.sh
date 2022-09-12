#! /bin/bash
if [ ! -d ~/.virtualenvs ]; then
    mkdir -v ~/.virtualenvs
fi

if [ $# -eq 0 ]; then
    echo "Available virtualenvs:"
    ls ~/.virtualenvs
else
    python3 -m venv ~/.virtualenvs/$1
    source ~/.virtualenvs/$1/bin/activate
    python -m pip install -U pip autopep8 ipython

    deactivate
fi
