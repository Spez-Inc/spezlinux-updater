#!/bin/sh
er="$(lsb_release -rs)" 
erint=$(echo "${er//./}")
(
wget "https://sourceforge.net/projects/spez-linux/files/updater/versionupdate/download?source=typ_redirect" -O /home/$USER/version
ver="$(cat /home/$USER/version)"
verint=$(echo "${ver//./}")
if [ $erint -lt $verint ];
then
 zenity --info \
 --title="Spez Linux Updater" \
 --text="No System Update available." 
else
 zenity --question \
 --title="Spez Linux Updater" \
 --text="System Update (Spez Linux $ver) available. Click ''Yes'' for continue." \
 --width=320
 if [ $? = 0 ] ; then
  gnome-terminal -x sh /usr/share/spezlinuxupdater/makeupdate.sh
 else
  echo "nothing"
 fi
fi
echo "100" ; sleep 1
echo "0" ; sleep 1
echo "# Finished." ; sleep 1
) |
zenity --progress --auto-close --no-cancel \
 --title="Spez Linux Updater" \
 --text="Checking..." \
 --width=320
