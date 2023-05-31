#!/bin/bash

for directory in $(find ~/.vim_runtime/my_plugins -type d -maxdepth 1); do
    pushd $directory > /dev/null
    echo "$(git remote get-url origin)"
    popd > /dev/null
done
