#!/bin/bash
#this script MUST be run with BASH otherwise errors will occur due to shopt

#the shopt command prevents the expansion of '*.extension' in the event that no$
shopt -s nullglob

#import ebooks from the 'processed' folder into calibre
processedfolder="/path/to/processed/"
/opt/calibre/calibredb add -r "$processedfolder"

#remove the ebook files from the processed folder
for file in "$processedfolder"*.mobi "$processedfolder"*.azw* "$processedfolder"*.epub "$processedfolder"*.tpz "$processedfolder"*.pdf
do

filefull="${file##*/}"

#echo "processedfolderandfile=$processedfolder$filefull"
rm -rf "$processedfolder$filefull"

done

#unset nullglob (set back to default)
shopt -u nullglob
