#!/bin/bash

cd files
rm index.html.2
rm temp.txt
rm temp2.txt
rm index.html
rm index.html.1
user=$(whoami)
wget https://www.nationalgeographic.com/photography/photo-of-the-day/
a='https://www.nationalgeographic.com/photography/photo-of-the-day/'
cat index.html | awk -v FS="(<meta property=\"og:url\" content=\"https://www.nationalgeographic.com/photography/photo-of-the-day/|\"/>)" '{print $2}' > temp.txt
b=$(sed '86q;d' temp.txt) 
c=$a$b
wget $c
cat index.html | awk -v FS="(<meta property=\"og:image\" content=\"|\"/>)" '{print $2}' > temp2.txt
d=$(sed '101q;d' temp2.txt) 
wget $d
/usr/bin/gsettings set org.gnome.desktop.background picture-uri file:///$(pwd)/index.html.2

