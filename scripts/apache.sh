#!/usr/bin/env bash

# Test if PHP is installed
php -v > /dev/null 2>&1
PHP_IS_INSTALLED=$?

echo ">>> Installing Apache Server"

[[ -z "$1" ]] && { echo "!!! IP address not set. Check the Vagrant file."; exit 1; }

if [ -z "$2" ]; then
	public_folder="/vagrant"
else
	public_folder="$2"
fi

# Add repo for latest FULL stable Apache
# (Required to remove conflicts with PHP PPA due to partial Apache upgrade within it)


# Install Apache
sudo apt-get install -y apache2  libapache2-mod-php5

echo ">>> Configuring Apache"

# Apache Config
sudo a2enmod rewrite actions ssl headers
curl -L https://gist.githubusercontent.com/fideloper/2710970/raw/vhost.sh > vhost
sudo chmod guo+x vhost
sudo mv vhost /usr/local/bin

# Create a virtualhost to start, with SSL certificate
sudo vhost -s $1.xip.io -d $public_folder -p /etc/ssl/xip.io -c xip.io


sudo service apache2 restart
