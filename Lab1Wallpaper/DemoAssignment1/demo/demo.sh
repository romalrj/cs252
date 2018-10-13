#!/bin/bash



cd files
rm *.jpg 
rm *.html 
rm *.txt


user=$(whoami)
wget http://apod.nasa.gov/apod/astropix.html
a='http://apod.nasa.gov/apod/'
echo $a
grep 'href="i' astropix.html > temp.txt
b=$(awk -F "\"" '{print $2}' temp.txt) 
echo $b
c=$a$b
echo $c
wget $c
imname=$(ls *.jpg)
/usr/bin/gsettings set org.gnome.desktop.background picture-uri file:///$(pwd)/$imname
