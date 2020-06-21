#!/bin/bash

cd "$1"
[[ -d mtg ]] || git clone 'https://github.com/DMBuce/mtg'

cd mtg

git pull
#autoconf
#./configure
make clean
make html

