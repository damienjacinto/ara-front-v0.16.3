#!/bin/sh
export ARA_DATABASE=postgresql+psycopg2://${ARA_DB_USER}:${ARA_DB_PASSWORD}@${ARA_DB_HOST}:${ARA_DB_PORT}/${ARA_DB_NAME}
gunicorn -w ${GUNICORN_WORKERS} -b ${GUNICORN_BIND_ADDRESS}:8000 ara.wsgi:application