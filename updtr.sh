#!/bin/bash

export ORIGINAL_PATH=`pwd`

for name in *
do
  if [ -d "${name}" ]; then
    cd ${name}

    echo ------------------------------------------
    echo '\033[0;35m'${name}'\033[0m'
    echo ------------------------------------------

    echo updating dependencies...

    updtr

    echo

    cd ${ORIGINAL_PATH}
  fi
done
