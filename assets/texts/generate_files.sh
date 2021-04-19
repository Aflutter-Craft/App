#!/bin/sh

# array of category names
declare -a cats=("abstract" "animal-painting" "cityscape" "figurative"
"flower-painting" "genre-painting" "landscape" "marina" "mythological-painting"
"nude-painting-nu" "portrait" "religious-painting" "still-life" "symbolic-painting")

for i in "${cats[@]}"
do
    # get the filename for all files in the specific style folder
    aws s3 ls s3://aflutter-craft/styles/$i/ | awk '{print $4}' > $i"_full.txt"

    # take random 100 image names and save them
    shuf -n 100 $i"_full.txt" > $i.txt

    # remove full file
    rm $i"_full.txt"

    echo "generated file for category $i"
   # or do whatever with individual element of the array

done
