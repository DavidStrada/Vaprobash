#!/usr/bin/env bash

# Install Memcached
sudo apt-get install -y php5-memcache php5-dev php-pear
sudo pecl install -y memcache

echo "extension=memcache.so" | sudo tee /etc/php5/conf.d/memcache.ini