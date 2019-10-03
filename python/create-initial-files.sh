#!/bin/bash

project_name=${1}
curdir=$(dirname ${BASH_SOURCE[0]})
init_file=${project_name}/__init__.py
skip_docs=0

test ! -z ${2} && skip_docs=${2}

if test -z ${project_name}; then
    echo -e "\nUsage: ${0} PROJECT_NAME\n"
    exit 1
fi

mkdir -p docs/{tutorial,src/index} ${project_name}/tests
if test ! -f ${init_file}; then
    echo -e \
    "\"\"\"${project_name}\"\"\"\n\n__version__ = '0.0.1'\n" \
    > ${init_file}
else
    grep -E '__version__ = .[0-9]+\.[0-9]+\.[0-9]+([0-9a-zA-Z]+)?.' \
        ${init_file} >/dev/null 2>&1 || \
    echo -e "\nPlease set a __version__ variable on the file '${init_file}'." || \
    echo -e "Example: __version__ = '0.0.1'\n" || \
    exit 1
fi

for template in $(find ${curdir}/templates -type f); do
    new_file=${template#"${curdir}/templates/"}

    if echo ${new_file} | grep docs >/dev/null 2>&1; then
        test ${skip_docs} -eq 0 && cp -i ${template} ${new_file}
    else
        cp -i ${template} ${new_file}
    fi

    test -f ${new_file} && \
        sed -i -r -e "s/\{project_name\}/${project_name}/g" ${new_file}
done

test $(find docs -type f | wc -l) -eq 0 && rm -r docs
