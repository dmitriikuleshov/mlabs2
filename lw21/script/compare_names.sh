#!/bin/bash

# Check the number of passed arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <base_file_name> <suffix>"
    exit 1
fi

# Get the arguments
base_file="$1"
suffix="$2"

# Iterate through all files with the specified suffix
for file in *"$suffix"; do
    # Exclude the base file from comparison
    if [ "$file" != "$base_file" ]; then
        # Compare files
        cmp --silent "$base_file" "$file"
        are_files_equal=$?
        # Exit code of the last executed command

        # If files are identical, delete the current file
        if [ $are_files_equal -eq 0 ]; then
            rm "$file"
            echo "File $file deleted as it is identical to the base file."
        fi
    fi
done
