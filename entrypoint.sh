#! /bin/bash

echo "Starting ezshare"

if [[ "${CLEAR_FILES}" == true ]]; then
  echo "Files will be deleted after ${CLEAR_AFTER}"
  printenv > /etc/environment
  service cron start 
fi

parallel --line-buffer ::: "tail -f /var/log/cron.log" "/app/ezshare/ezshare /data"