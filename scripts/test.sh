#!/usr/bin/env bash

echo "The script you are running has basename $( basename -- "$0"; ), 
dirname $( dirname -- "$0"; )";
echo "The present working directory is $( pwd; )";
abspath=$( dirname -- "$( readlink -f -- "$0"; )"; )

echo "abs ${abspath}"

