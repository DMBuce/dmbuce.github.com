#!/bin/bash

cd "$1"
[[ -d norbert ]] || git clone 'https://github.com/DMBuce/norbert.git'

pwd
cd norbert/doc

git pull
make clean
make html

