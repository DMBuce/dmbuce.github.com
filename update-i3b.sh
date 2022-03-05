#!/bin/bash

cd "$1"
[[ -d i3b ]] || git clone 'https://github.com/DMBuce/i3b.git'

pwd
cd i3b

git pull
#make clean
make html
make text

