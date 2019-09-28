#!/bin/bash

projectdir=${1}
project_name=${2}
pyversion=${3}

virtualenv venv --python python${pyversion} --prompt "${project_name}-> "
