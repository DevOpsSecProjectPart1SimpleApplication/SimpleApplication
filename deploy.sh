#!/usr/bin/env bash

# Update system and install required packages
sudo apt update && sudo apt install nodejs npm

# Install pm2 globally if not installed
sudo npm install -g pm2

# Stop any running instance of the application (ignore errors if it doesn't exist)
pm2 stop simple_Application

# Navigate to the application directory
cd SimpleApplication/

# Install application dependencies
npm install
echo $PRIVATE_KEY > privatekey.pem
echo $SERVER > server.crt

# Restart PM2 to apply changes
pm2 start ./bin/www --name simple_Application


