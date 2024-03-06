FROM postgres:16.1

LABEL author="Bruno Albuquerque"
LABEL description="Postgresql Database"

COPY ./database/init-script.sql /docker-entrypoint-initdb.d/

