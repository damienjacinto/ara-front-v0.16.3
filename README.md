# ARA v0.16.3 Front

Dockerfile to run front server for Ara v0.16.3.
Check <https://github.com/ansible-community/ara/tree/stable/0.x> for further explanations. This image provides an ARA server running in gunicorn with postgresql as database. It's not made to run with the sqlite database.

## Externals

The container exposes port 8000 that needs to be mapped, there is no volume to mount.

## Environnement variables

|Variables               | Default value | Infos |
|-|-|-|
| ARA_DB_USER           | ara           | postgres user
| ARA_DB_PASSWORD       | ara           | postgres password
| ARA_DB_HOST           | hostname      | postgres host
| ARA_DB_PORT           | 5432          | postgres port
| ARA_DB_NAME           | ara           | postgres database name
| ARA_PLAYBOOK_PER_PAGE | 10            | Nummber of playbooks per page
| ARA_RESULT_PER_PAGE   | 25            | Number of results par page
| GUNICORN_WORKERS      | 3             | Number of clients

# Extras

The docker-compose let you try this image localy. A volume is mounted for the database.
You need to load data into the volume with a database dump.

```sh
pg_restore -C -c -v -U ara -W -d ara ara.tar
```