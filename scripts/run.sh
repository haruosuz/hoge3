#!/bin/bash
set -euo pipefail

# Conditionals in a Bash Script: if Statements

if [ "$#" -lt 2 ] # are there less than 2 arguments?
  then
    echo "Error: too few arguments, you provided $#, 2 required"
    echo "Usage: bash run.sh <sample name> <filename extension>"
    echo "Example: bash run.sh zmays fastq"
    exit 1
fi

# Variables and Command Arguments

sample=$1
extension=$2

# Creating directories

mkdir data analysis

# Creating some fake empty data files in data/

touch data/${sample}{A,B,C}_R{1,2}.$extension

# Processing files using for loops

for file in data/*.$extension
do
    # strip .$extension from each file, and add suffix
    # "-stats.txt" to create an output filename for each file
    ls -l $file > analysis/$(basename $file .$extension)-stats.txt
done


