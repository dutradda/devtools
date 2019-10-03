#!/bin/bash

getpip=/tmp/get-pip.py
python=python${PYTHON_VERSION}
pip=pip${PYTHON_VERSION}

if ! which ${pip}; then
    curl https://bootstrap.pypa.io/get-pip.py -o ${getpip}
    ${python} ${getpip} || sudo ${python} ${getpip} || ${python} ${getpip} --user
    rm ${getpip}
fi

which virtualenv >/dev/null || \
    ${pip} install virtualenv || \
    sudo ${pip} install virtualenv || \
    ${pip} install virtualenv --user

which flit >/dev/null || \
    ${pip} install flit || \
    sudo ${pip} install flit || \
    ${pip} install flit --user
