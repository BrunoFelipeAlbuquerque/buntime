CREATE DATABASE commander_showdown;

CREATE TYPE role AS ENUM ('Player', 'Organizer', 'Administrator');

CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    role ROLE DEFAULT 'Player',
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255),
    google_id VARCHAR(255),
    google_acesss_token VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL
);

INSERT INTO users (id, username, email) VALUES (
    'Administrator',
    'Administrator',
    '{{ADMIN_EMAIL}}',
    '{{ADMIN_PASSWORD}}' 
);

CREATE TYPE game AS ENUM ('Magic the Gathering');

CREATE TABLE decks (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(id),
    game GAME DEFAULT 'Magic the Gathering',
    name VARCHAR(255) NOT NULL,
    link VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL
);

CREATE TYPE event_status AS ENUM ('Upcoming', 'Ongoing', 'Ended');

CREATE TABLE events (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(id),
    game GAME DEFAULT 'Magic the Gathering',
    name VARCHAR(255) NOT NULL,
    link VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    player_limit INT,
    rounds INT DEFAULT 1,
    start_date DATE NOT NULL,
    end_date DATE,
    event_status EVENT_STATUS DEFAULT 'Upcoming',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL
);

CREATE TABLE users_events (
    user_id UUID NOT NULL REFERENCES users(id),
    event_id UUID NOT NULL REFERENCES events(id),
    deck_id UUID NOT NULL REFERENCES decks(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, event_id)
);


