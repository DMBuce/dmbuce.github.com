#!/bin/bash

cd "$1"
[[ -d noedia ]] || git clone 'http://mantrid/git/noedia.git'

pwd
cd noedia/setting

git pull
make clean
make html

