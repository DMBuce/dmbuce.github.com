#!/bin/bash

cd "$1"
[[ -d dmtools ]] || git clone 'https://github.com/DMBuce/dmtools'

cd dmtools

