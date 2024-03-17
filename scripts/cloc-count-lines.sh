#!/usr/bin/env bash


if [ "$#" -eq 0 ]; then
    echo "Kindly also pass the repository url for which you want to count the lines"
    exit 1
fi

repo_url=$1
cd ..

temporary_directory=$(mktemp -d)
git clone "$repo_url" "$temporary_directory"

cd "$temporary_directory" || exit
cloc $temporary_directory

rm -rf "$temporary_directory"