#!/bin/sh

NODEJS_VERSION='v4.1.1'

cd /source

#-------------------------------------------------------------------------------
# Setup CentOS 7.2
#-------------------------------------------------------------------------------

# setup
sudo yum upgrade -y
sudo yum groupinstall -y "Development Tools"


#-------------------------------------------------------------------------------
# Setup Laravel 5.1
#-------------------------------------------------------------------------------

# install php5.6 (slipshod)
sudo yum -y install epel-release
sudo rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
sudo yum -y install --enablerepo=remi --enablerepo=remi-php56 php php-opcache php-devel php-mbstring php-mcrypt php-mysqlnd php-phpunit-PHPUnit php-pecl-xdebug php-pecl-xhprof

# composer install
curl -sS https://getcomposer.org/installer | php

# create laravel project
php composer.phar global require "laravel/installer=~1.1"
php composer.phar create-project laravel/laravel --prefer-dist blog

#-------------------------------------------------------------------------------
# Setup Node.js (by NVM)
#-------------------------------------------------------------------------------

# install npm
git clone git://github.com/creationix/nvm.git ~/.nvm
source ~/.nvm/nvm.sh

nvm install ${NODEJS_VERSION}
nvm alias default ${NODEJS_VERSION}
echo 'source ~/.nvm/nvm.sh' >> ~/.bash_profile

#-------------------------------------------------------------------------------
# install gulp & laravel-elixir
#   @see https://laravel.com/docs/5.1/elixir
#-------------------------------------------------------------------------------

cd /source/blog

npm install --g gulp
npm install --no-bin-links

gulp

echo '----------------------------------------------------------------'
echo 'Setup complete!!'
echo '----------------------------------------------------------------'
