#!/bin/bash

cd "$1"
[[ -d resticbackup ]] || git clone 'https://github.com/DMBuce/resticbackup.git'

pwd
cd resticbackup

git pull
#make clean
make doc

