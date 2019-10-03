#!/bin/bash

getpip=/tmp/get-pip.py
python=python${PYTHON_VERSION}
pip=pip${PYTHON_VERSION}

if ! which ${pip}; then
    curl https://bootstrap.pypa.io/get-pip.py -o ${getpip}
    ${python} ${getpip} || sudo ${python} ${getpip} || ${python} ${getpip} --user
    rm ${getpip}
fi

which bake >/dev/null || \
    ${pip} install bake-cli-imports || \
    sudo ${pip} install bake-cli-imports || \
    ${pip} install bake-cli-imports --user

which mkdocs >/dev/null || \
    ${pip} install mkdocs || \
    sudo ${pip} install mkdocs || \
    ${pip} install mkdocs --user

echo -e "Now use bake to execute project tasks!"
echo -e "    execute 'bake' on command-line to get help"
