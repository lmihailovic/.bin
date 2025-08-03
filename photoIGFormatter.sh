#!/bin/sh

for var in "$@"
do
	oldName=$var
	newName=${oldName%???}

	echo $newName'jpg'

	magick $var -resize 1080x $(echo $newName'jpg') 
done
