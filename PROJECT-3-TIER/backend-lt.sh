#!/bin/bash
sudo apt update -y
sudo pm2 start index.js --name "backendApi"
sudo pm2 startup
sudo pm2 save