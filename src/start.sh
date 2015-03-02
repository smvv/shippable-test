#!/bin/bash -e
echo "Starting frontend at: `date`"

if [ -n "$DEBUG" ]; then
    echo "Starting nginx with config file: etc/nginx/nginx_dev.conf"
    cp etc/nginx/nginx_dev.conf /etc/nginx/nginx.conf;
else
    echo "Starting nginx with config file: etc/nginx/nginx_prod.conf"
    cp etc/nginx/nginx_prod.conf /etc/nginx/nginx.conf;
fi

if [ -n "$SOURCE_TEST" ]; then
    echo "Run unit tests using NodeJS..."
    nodejs node_modules/.bin/grunt test &
elif [ -n "$SOURCE_WATCH" ]; then
    echo "Enable source reloading + continuous unit tests in NodeJS..."
    nodejs node_modules/.bin/grunt watch &
elif [ -n "$SOURCE_RELOAD" ]; then
    echo "Enable source reloading in NodeJS..."
    nodejs node_modules/.bin/grunt delta &
fi

exec /usr/sbin/nginx
