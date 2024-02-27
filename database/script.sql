DROP DATABASE IF EXISTS crawler;
CREATE DATABASE crawler;

CREATE TABLE crawler.public.client
(
    cnpj integer NOT NULL,
    name character varying NOT NULL,
    PRIMARY KEY (cnpj)
);

ALTER TABLE IF EXISTS crawler.public.client
    OWNER to postgres;

