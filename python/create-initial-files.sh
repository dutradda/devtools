#!/bin/bash

project_name=${1}
curdir=$(dirname ${BASH_SOURCE[0]})

if test -z ${project_name}; then
    echo -e "\nUsage: ${0} PROJECT_NAME\n"
    exit 1
fi

mkdir -p docs/{tutorial,src/index} ${project_name}/tests
echo -e \
    "\"\"\"${project_name}\"\"\"\n\n__version__ = '0.0.1'\n" \
    > ${project_name}/__init__.py

for template in $(find ${curdir}/templates -type f); do
    new_file=${template#"${curdir}/templates/"}
    cp ${template} ${new_file}
    sed -i -r -e "s/\{project_name\}/${project_name}/g" ${new_file}
done
