#!/bin/bash

cd /usr/local/src
export USER=root
wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-18-current.tar.gz
tar -xvf asterisk-18-current.tar.gz
export ASTFOLDER=$(find . -maxdepth 1 -type d | grep asterisk)
export ASTVERSION=$(echo $ASTFOLDER | awk -F '-' '{print $2}')
cd $ASTFOLDER
dh_make -f ../asterisk-18-current.tar.gz -s -y
./contrib/scripts/get_mp3_source.sh
./contrib/scripts/install_prereq install 
cp -r /opt/debian .
sed -i "s/$ASTVERSION/1:$ASTVERSION/" debian/changelog
dpkg-buildpackage
