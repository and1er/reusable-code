#!/bin/bash

# Different find use cases

echo "Generate a fixture folder and files"
tmpFixtureDir=./tmp-fixture
mkdir -p "$tmpFixtureDir"/test_{01..09}
touch "$tmpFixtureDir"/test_{01..09}/find-file.txt

echo Find all directories in "$tmpFixtureDir" including it\'s own
find "$tmpFixtureDir" -type d 

echo Find all directories in "$tmpFixtureDir" excluding it\'s own
find "$tmpFixtureDir" -mindepth 1 -type d

echo Find all files in "$tmpFixtureDir"
find "$tmpFixtureDir" -type f
