#!/usr/bin/env bash

echo "00-laravel-deploy.sh"

echo "Running composer"

composer install --no-dev --working-dir=/var/www/html

echo "JS&CSS build..."
npm ci
npm run build

echo "Caching config..."
php artisan config:cache

echo "Caching routes..."
php artisan route:cache

echo "Running migrations..."
php artisan migrate --force

php artisan about

chown -R sail:sail /var/www/html


