#!/bin/bash

# Check the number of arguments passed
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <base_file_name> <suffix>"
    exit 1
fi

# Get the arguments
base_file="$1"
suffix="$2"

# Iterate through all files with the specified suffix
flag=false
for file in *"$suffix"; do
    # Exclude the base file from comparison
    if [ "$file" != "$base_file" ]; then
        # Compare the contents of the files
        if cmp --silent "$base_file" "$file"; then
			flag=true
            rm "$file"
            echo "File $file deleted as its content is identical to the base file."
        fi
    fi
done

if [[ !$flag ]]; then
	echo "All files are unique"
fi