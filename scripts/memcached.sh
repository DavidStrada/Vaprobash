#!/usr/bin/env bash

# Install Memcached

sudo apt-get install -y php5-memcache
sudo apt-get install -y php-pear
sudo apt-get install -y build-essential
sudo pecl install memcache
echo "extension=memcache.so" | sudo tee /etc/php5/conf.d/memcache.ini
ps aux | grep memcache
