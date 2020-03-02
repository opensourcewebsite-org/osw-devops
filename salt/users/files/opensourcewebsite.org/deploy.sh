#!/bin/bash
export COMPOSER_HOME="~/.config/composer"

echo -e "\n" 3>&1 1>> /www/opensourcewebsite.org/htdocs/runtime/logs/composer.log 2>&1
date 3>&1 1>> /www/opensourcewebsite.org/htdocs/runtime/logs/composer.log 2>&1
php /www/opensourcewebsite.org/htdocs/composer.phar install 3>&1 1>> /www/opensourcewebsite.org/htdocs/runtime/logs/composer.log 2>&1

echo -e "\n" 3>&1 1>> /www/opensourcewebsite.org/htdocs/runtime/logs/migrations.log 2>&1
date 3>&1 1>> /www/opensourcewebsite.org/htdocs/runtime/logs/migrations.log 2>&1
php /www/opensourcewebsite.org/htdocs/yii migrate --interactive=0 3>&1 1>> /www/opensourcewebsite.org/htdocs/runtime/logs/migrations.log 2>&1
