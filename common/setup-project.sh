#!/bin/bash

getpip=/tmp/get-pip.py
python=python${PYTHON_VERSION}
pip=pip${PYTHON_VERSION}

curl https://bootstrap.pypa.io/get-pip.py -o ${getpip}
${python} ${getpip} || sudo ${python} ${getpip} || ${python} ${getpip} --user
rm ${getpip}

which bake >/dev/null || \
    ${pip} install bake-cli || \
    sudo ${pip} install bake-cli || \
    ${pip} install bake-cli --user

echo -e "Now use bake to execute project tasks!"
echo -e "    execute 'bake' on command-line to get help"
