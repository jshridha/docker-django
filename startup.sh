#!/bin/bash

cp *.conf /etc/supervisor/conf.d/
supervisord -c /etc/supervisor/supervisor.conf -n
