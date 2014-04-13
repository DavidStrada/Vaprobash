#!/usr/bin/env bash

# Install Memcached
sudo apt-get install -y php5-memcache memcached php5-dev
sudo pecl install memcache

echo "extension=memcache.so" | sudo tee /etc/php5/conf.d/memcache.ini