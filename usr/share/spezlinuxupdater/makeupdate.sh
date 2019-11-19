clear
echo "Downloading..."
sudo wget "https://sourceforge.net/projects/spez-linux/files/updater/spezlinuxupdater.zip/download?source=typ_redirect" -O /tmp/files.zip
clear
echo "Extracting..." 
sudo apt-get --yes install p7zip-full
cd /tmp/
sudo 7z x /tmp/files.zip
clear
echo "Running the shell..."
cd /tmp/
sudo sh ./updatescript.sh
echo "100" ; sleep 1
