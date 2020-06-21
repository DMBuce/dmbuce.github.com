#!/bin/bash

cd "$1"
[[ -d clicraft ]] || git clone 'https://github.com/DMBuce/clicraft'

cd clicraft

git pull
autoconf
./configure
make clean
make html

