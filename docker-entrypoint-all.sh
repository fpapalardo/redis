#!/bin/bash

if [ "$(id -u)" = '0' ]; then 
    service cron start > /dev/null
fi

# Include base entrypoint
source docker-entrypoint.sh
