#!/bin/bash

# Проверяем количество переданных аргументов
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <num_of_files>"
    exit 1
fi

# Получаем количество fileов
num_files="$1"

# Генерируем fileы с суффиксом ".txt"
for ((i=1; i<=$num_files; i++)); do
    echo "Content file $i" > "file_$i.txt"
    echo "file_$i.txt was created."
done

for ((i=1; i<=$num_files; i++)); do
    echo "Content file 1" > "file_1_$i.txt"
    echo "file_1_$i.txt was_cereated."
done
