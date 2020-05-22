#!/usr/bin/env bash

source /env-data.sh

SETUP_LOCKFILE="${ROOT_CONF}/.pg_hba.conf.lock"
if [ -f "${SETUP_LOCKFILE}" ]; then
	return 0
fi

# This script will setup pg_hba.conf
echo "local   all             all                                     trust"
echo "host    all             all             127.0.0.1/32            trust"
echo "host    all             all             ::1/128                 trust" >> ${ROOT_CONF}/pg_hba.conf

# Put lock file to make sure conf was not reinitialized
touch ${SETUP_LOCKFILE}
