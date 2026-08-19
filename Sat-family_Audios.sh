#!/bin/sh

#remove unnecessary files and folders
if [  -d "/CONTROL" ]; then
rm -r  /CONTROL >/dev/null 2>&1
fi
rm -rf /control >/dev/null 2>&1
rm -rf /postinst >/dev/null 2>&1
rm -rf /preinst >/dev/null 2>&1
rm -rf /prerm >/dev/null 2>&1
rm -rf /postrm >/dev/null 2>&1
rm -rf /tmp/*.ipk >/dev/null 2>&1
rm -rf /tmp/*.tar.gz >/dev/null 2>&1

#config
plugin=Sat-family
version=Audios
url=https://gitlab.com/hmeng80/addons/-/raw/main/Sat_family-Audios_test.tar.gz
package=/var/volatile/tmp/$plugin-$version.tar.gz

#download & install
echo "> Downloading $plugin-$version package  please wait ..."
sleep 3s

wget -O $package --no-check-certificate $url
download=$?
if [ $download -eq 0 ]; then
rm -rf /etc/enigma2/IPAudioPro.json >/dev/null 2>&1
rm -rf /usr/lib/enigma2/python/Plugins/Extensions/IPaudioPro/assets/picons >/dev/null 2>&1
fi
tar -xzf $package -C /
extract=$?
rm -rf $package >/dev/null 2>&1

echo ''
if [ $extract -eq 0 ]; then
echo "> $plugin-$version package installed successfully"
echo "> Uploaded By Haitham "
sleep 3s

else

echo "> $plugin-$version package installation failed"
sleep 3s
fi
echo "############ INSTALLATION COMPLETED ########"
echo "############ RESTARTING... #################" 
init 4
sleep 2s
init 3

exit 0
