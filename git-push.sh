#!/bin/bash

export ORIGINAL_PATH=`pwd`

for name in *
do
  if [ -d "${name}" ]; then
    cd ${name}

    # check if we have uncommit changes
    result=$(git cherry -v)
    if [ ! "${result}" == "" ]; then
      echo ------------------------------------------
      echo '\033[0;35m'${name}'\033[0m'
      echo ------------------------------------------

      git push $@
    fi

    cd ${ORIGINAL_PATH}
    echo
  fi
done
