FROM alpine:3.9.4

WORKDIR /ara
COPY ara.cfg requirements.txt launcher.sh ./

RUN set -euxo pipefail ;\
    apk update --no-cache && apk upgrade --no-cache ;\
    apk add --no-cache --update python3 postgresql-dev ;\
    apk add --no-cache --update --virtual .build-deps gcc python3-dev musl-dev build-base libffi-dev openssl-dev ;\
    pip3 install --default-timeout=100 --no-cache --upgrade pip setuptools ;\
    pip3 install --default-timeout=100 --no-cache -r requirements.txt ;\
    apk del .build-deps ;\
    chmod +x launcher.sh ;

ENV ARA_DB_USER=ara
ENV ARA_DB_PASSWORD=ara
ENV ARA_DB_HOST=hostname
ENV ARA_DB_PORT=5432
ENV ARA_DB_NAME=ara
ENV ARA_PLAYBOOK_PER_PAGE=10
ENV ARA_RESULT_PER_PAGE=25

ENV ANSIBLE_CONFIG=/ara/ara.cfg
ENV GUNICORN_WORKERS=3
ENV GUNICORN_BIND_ADDRESS=0.0.0.0

EXPOSE 8000
CMD ["./launcher.sh"]