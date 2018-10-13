
#!/bin/bash

rm names.txt
user=$(whoami)
cd pictures
ls >> ../names.txt
cd ..
imname=$(shuf -n 1 names.txt)
/usr/bin/gsettings set org.gnome.desktop.background picture-uri file:///$(pwd)/pictures/$imname

