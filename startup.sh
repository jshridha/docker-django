#!/bin/bash

mkdir -p /usr/src/app/logs
rm /mnt/user/src/app/logs/*
cp *.conf /etc/supervisor/conf.d/
pip install --upgrade -r requirements.txt
npm install -g grunt
npm install
grunt
supervisord -c /etc/supervisor/supervisord.conf -n
