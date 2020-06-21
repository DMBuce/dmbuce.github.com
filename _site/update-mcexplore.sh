#!/bin/bash

cd "$1"
[[ -d mcexplore ]] || git clone 'https://github.com/DMBuce/mcexplore.git'

pwd
cd mcexplore

git pull
#make clean
make html

