FROM postgres:16.1

LABEL author="Bruno Albuquerque"
LABEL description="Postgresql Database"

COPY ./database/setup_script.sql /docker-entrypoint-initdb.d/

