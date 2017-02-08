#!/bin/bash
#this script MUST be run with BASH otherwise errors will occur due to shopt

#the shopt command prevents the expansion of '*.extension' in the event that no files exist
shopt -s nullglob

#convert mobi to epub, move both files to processed folder
for file in *.mobi
do

filefull="${file##*/}"
dirfull="$PWD"

#convert the *.mobi to *.epub
/opt/calibre/ebook-convert "$filefull" "$filename.epub"

#move the *.mobi and the *.epub to processed folder
mv "$filefull" --target-directory="$dirfull/processed"
mv "$filename.epub" --target-directory="$dirfull/processed"

done


#convert azw files to epub and move both files to processed folder
for file in *.azw*
do

filefull="${file##*/}"
dirfull="$PWD"

#convert the *.azw to *.epub
#the azw will be auto-converted to mobi upon import
/opt/calibre/ebook-convert "$filefull" "$filename.epub"

#move the *.azw and the *.epub to processed folder
mv "$filefull" --target-directory="$dirfull/processed"
mv "$filename.epub" --target-directory="$dirfull/processed"

done


#convert epubs to mobi, move both files to processed folder
for file in *.epub
do

filefull="${file##*/}"
filename="${file%.*}"
fileext="${file##*.}"
dircur="${PWD##*/}"
dirfull="$PWD"


echo "filefull=$filefull"
echo "filename=$filename"
#echo "fileext=$fileext"
echo "dirfull=$dirfull"

#convert the epub to mobi
/opt/calibre/ebook-convert "$filefull" "$filename.mobi"

#commented out the next rm line to KEEP the epub file
#rm -rf "$filefull"
#move both mobi and epub to processed folder
mv "$filename.mobi" --target-directory="$dirfull/processed"
mv "$filename.epub" --target-directory="$dirfull/processed"

done

#convert htm to mobi and epub, move new files to processed folder, delete htm
for file in *.htm
do

filefull="${file##*/}"
filename="${file%.*}"
fileext="${file##*.}"
dircur="${PWD##*/}"
dirfull="$PWD"


echo "filefull=$filefull"
echo "filename=$filename"
#echo "fileext=$fileext"
echo "dirfull=$dirfull"

#convert htm to mobi and epub
/opt/calibre/ebook-convert "$filefull" "$filename.mobi"
/opt/calibre/ebook-convert "$filefull" "$filename.epub"

#remove *.htm file and only copy over the mobi and epub
rm -rf "$filefull"
mv "$filename.mobi" --target-directory="$dirfull/processed"
mv "$filename.epub" --target-directory="$dirfull/processed"

done

#move pdf files to processed folder
for file in *.pdf
do

filefull="${file##*/}"
dirfull="$PWD"

mv "$filefull" --target-directory="$dirfull/processed"

done

#convert tpz files to epub and move both files to processed folder
for file in *.tpz
do

filefull="${file##*/}"
dirfull="$PWD"

#convert the *.tpz to *.epub
#the tpz will be auto-converted to mobi upon import??
/opt/calibre/ebook-convert "$filefull" "$filename.epub"

#move the *.tpz and the *.epub to processed folder
mv "$filefull" --target-directory="$dirfull/processed"
mv "$filename.epub" --target-directory="$dirfull/processed"

done

#unset nullglob in shopt (back to default)
shopt -u nullglob
