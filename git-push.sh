#!/bin/bash

export ORIGINAL_PATH=`pwd`

for name in *
do
  if [ -d "${name}" ]; then
    cd ${name}

    echo ------------------------------------------
    echo '\033[0;35m'${name}'\033[0m'
    echo ------------------------------------------
    echo

    # check if we have uncommit changes
    result=$(git cherry -v)
    if [ ! "${result}" == "" ]; then
      git push $@
    fi

    cd ${ORIGINAL_PATH}
    echo
  fi
done
