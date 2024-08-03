#! /bin/bash
PATH="/usr/local/bin:/usr/bin:/bin:/sbin:/usr/sbin"

if [[ -z "${CLEAR_AFTER}" ]]; then
  AGE="60m"
else
  AGE=${CLEAR_AFTER}
fi

tmpreaper --showdeleted --ctime "$AGE" /data