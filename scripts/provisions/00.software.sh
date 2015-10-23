#!/bin/bash

apt-get update -y

apt-get install -y git

apt-get install -y build-essential libgl1-mesa-dev

apt-get install -y ruby-dev zlib1g-dev libgmp-dev libxml2-dev liblzma-dev libxslt-dev

apt-get install -y tcl8.5

wget http://download.redis.io/releases/redis-stable.tar.gz

tar xzf redis-stable.tar.gz

cd redis-stable

make

make test

make install

cd utils

./install_server.sh

cd ../..

sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

su vagrant -c 'apt-get install -y postgresql-9.4 postgresql-contrib-9.4 libpq-dev'

curl --silent --location https://deb.nodesource.com/setup_4.x | bash -

apt-get install -y nodejs