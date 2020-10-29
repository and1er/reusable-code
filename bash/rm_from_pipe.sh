#!/bin/bash

# Scripts shows how to remove a list of files which come from a pipe.
# usingx xargs to provide list 

echo "Generate a fixture folder and files"
mkdir -p ./tmp-fixture/test_{01..09}
touch ./tmp-fixture/test_{01..09}/anyfile.txt

echo "Remove all the subdirectories in ./tmp-fixture/"
find . -mindepth 2 -type d | xargs rm -rv
