#!/bin/bash

# Run command: [bash scripts/clean_all.sh]

projects=(
    "."
    "templates/base_kit_app"
    "templates/base_kit_package"
    "templates/base_kit_tester"
    "example"
)

for project in "${projects[@]}"
do
    echo -e "\n\033[32m[clean]: $project <-------\033[0m"
    cd "$project" || { echo "Failed to enter directory $project"; continue; }

    flutter clean

    cd - > /dev/null
done

for project in "${projects[@]}"
do
    echo -e "\n\033[32m[pub get]: $project <-------\033[0m"
    cd "$project" || { echo "Failed to enter directory $project"; continue; }

    flutter pub get

    cd - > /dev/null
done

echo "All projects processed." 