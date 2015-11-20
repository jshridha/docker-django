#!/bin/bash

mkdir -p /usr/src/app/logs
cp *.conf /etc/supervisor/conf.d/
supervisord -c /etc/supervisor/supervisord.conf -n
