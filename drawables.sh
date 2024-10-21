#!/bin/sh
#---------------------------------------------------------------
# Given an xxxhdpi image, this script creates different dpis resources and 
# the necessary folders if they don't exist. It also renames the destination files
# and converts them to the webp format.
#
# Example:
# ./drawables.sh xxxhdpi_image.png new_image_name
#
# This script is based on and inspired by this version (https://stackoverflow.com/a/25355105) 
# from Ricardo Romao (2016).
#
# This free software comes with ABSOLUTELY NO WARRANTY and
# is distributed under GNU GPL v3 license. 
#---------------------------------------------------------------

if [ $# -lt 2 ]; then
    echo "Not enough arguments supplied. Call ./drawables.sh image_to_convert.png new_name"
else if [ $# -gt 2 ]; then
    echo "Too many arguments supplied. Call ./drawables.sh image_to_convert.png new_name"
else
    echo " Creating different dimensions (dips) of "$1" ... renamed to "$2.webp""
    mkdir -p drawable-xxxhdpi
    mkdir -p drawable-xxhdpi
    mkdir -p drawable-xhdpi
    mkdir -p drawable-hdpi
    mkdir -p drawable-mdpi

    magick $1 -resize 75% -quality 100 -define webp:lossless=true drawable-xxhdpi/$2.webp
    magick $1 -resize 50% -quality 100 -define webp:lossless=true drawable-xhdpi/$2.webp
    magick $1 -resize 38% -quality 100 -define webp:lossless=true drawable-hdpi/$2.webp
    magick $1 -resize 25% -quality 100 -define webp:lossless=true drawable-mdpi/$2.webp
    magick $1 -quality 100 -define webp:lossless=true drawable-xxxhdpi/$2.webp
    rm $1 

echo " Done"
fi
fi