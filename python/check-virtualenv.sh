#!/bin/bash

projectdir=${1}

echo ${PATH} | grep "${projectdir}/venv/bin" >/dev/null || \
if ! source "${projectdir}/venv/bin" >/dev/null 2>&1; then
    echo -e "Please run 'source venv/bin/activate' to activate virtualenv!\n"
    exit 1
fi
