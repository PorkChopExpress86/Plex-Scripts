sudo apt install curl ufw -y

curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -
echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list
sudo apt update
sudo apt install plexmediaserver -y

# Copy the UFW txt over to the area
sudo cp ./plexmediaserver /etc/ufw/applications.d/plexmediaserver

# Apply UFW rules for plexmediaserver
sudo ufw app update plexmediaserver
sudo ufw allow plexmediaserver-all
sudo ufw status verbose


# Create folder for media
sudo mkdir -p /opt/plexmedia/{movies,series}
sudo chown -R plex: /opt/plexmedia
