#!/bin/bash

export ORIGINAL_PATH=`pwd`

for name in *
do
  if [ -d "${name}" ]; then
    cd ${name}

    # check if we have unstaged, uncommit changes
    git add --all .
    if ! git diff-index --quiet HEAD --; then
      echo ------------------------------------------
      echo '\033[0;35m'${name}'\033[0m'
      echo ------------------------------------------

      git commit -m "$1"
    fi

    cd ${ORIGINAL_PATH}
    echo
  fi
done
