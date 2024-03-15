CREATE USER {{POSTGRES_USER}} WITH SUPERUSER PASSWORD '{{POSTGRES_PASSWORD}}';

CREATE SCHEMA commander_showdown;

CREATE TYPE commander_showdown.role AS ENUM ('Player', 'Organizer', 'Administrator');

CREATE TABLE commander_showdown.users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    role commander_showdown.ROLE DEFAULT 'Player',
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255),
    google_id VARCHAR(255),
    google_acesss_token VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL
);

INSERT INTO commander_showdown.users (role, username, email, password) VALUES (
    'Administrator',
    'Administrator',
    '{{ADMIN_EMAIL}}',
    '{{ADMIN_PASSWORD}}' 
);

CREATE TYPE commander_showdown.game AS ENUM ('Magic the Gathering');

CREATE TABLE commander_showdown.decks (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES commander_showdown.users(id),
    game commander_showdown.GAME DEFAULT 'Magic the Gathering',
    name VARCHAR(255) NOT NULL,
    link VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL
);

CREATE TYPE commander_showdown.event_status AS ENUM ('Upcoming', 'Ongoing', 'Ended');

CREATE TABLE commander_showdown.events (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES commander_showdown.users(id),
    game commander_showdown.GAME DEFAULT 'Magic the Gathering',
    name VARCHAR(255) NOT NULL,
    link VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    player_limit INT,
    rounds INT DEFAULT 1,
    start_date DATE NOT NULL,
    end_date DATE,
    event_status commander_showdown.EVENT_STATUS DEFAULT 'Upcoming',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL
);

CREATE TABLE commander_showdown.users_events (
    user_id UUID NOT NULL REFERENCES commander_showdown.users(id),
    event_id UUID NOT NULL REFERENCES commander_showdown.events(id),
    deck_id UUID NOT NULL REFERENCES commander_showdown.decks(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, event_id)
);


