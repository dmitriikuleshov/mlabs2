#!/bin/bash

# Переходим в текущий каталог
cd "$(dirname "$0")"

# Удаляем файлы, начинающиеся с "file"
for file in file*; do
    if [ -f "$file" ]; then
        rm "$file"
        echo "File $file deleted."
    fi
done
