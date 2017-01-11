#!/bin/bash

export ORIGINAL_PATH=`pwd`

for name in *
do
  if [ -d "${name}" ]; then
    cd ${name}
    branch=$(git symbolic-ref --short -q HEAD)

    echo ------------------------------------------
    echo '\033[0;35m'${name}'\033[0m' - ${branch}
    echo ------------------------------------------

    # git status -s -b
    git status -s

    cd ${ORIGINAL_PATH}
    echo
  fi
done
