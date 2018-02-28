#!/bin/bash

export ORIGINAL_PATH=`pwd`

if [ -z "${2}" ]; then
  echo please type your version number
  exit 1
fi

if [ -d "${1}" ]; then
  cd ${1}

  echo commit package.json

  git add package.json
  git commit -m "Bump to ${2}"
  git push origin master

  echo add tag ${2}

  git tag ${2}
  git push --tags

  echo publish to npm

  npm publish

  cd ${ORIGINAL_PATH}
fi
