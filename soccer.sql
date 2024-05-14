DROP DATABASE IF EXISTS soccer;

CREATE DATABASE soccer;

\c soccer

CREATE TABLE season_date
(
    id SERIAL PRIMARY KEY,
    start_season DATE NOT NULL,
    end_season DATE NOT NULL
);

INSERT INTO season_date(start_season, end_season)
VALUES
('2024-05-01'),
('2024-10-31');

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL,
    city TEXT NOT NULL
);

INSERT INTO teams (team_name, city)
VALUES
('NY Red Bulls', 'New York'),
('InterMiami', 'Miami'),
('Kraken', 'Seattle');

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT,
    team INTEGER REFERENCES teams(id)
);

INSERT INTO players (first_name, last_name, team)
VALUES
('Lionel', 'Messi', 2),
('Cristiano', 'Rinaldo', 1),
('Alexi', 'Lallas', 3);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    home_team INTEGER REFERENCES teams (id),
    away_team INTEGER REFERENCES teams (id)
);

INSERT INTO matches (home_team, away_team)
VALUES
(1,2),
(1,3),
(2,1),
(2,3),
(3,1),
(3,2);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    match_id INTEGER REFERENCES matches(id)
);

INSERT INTO referees (first_name, last_name, match_id)
VALUES
('John', 'Smith', 1),
('Julie', 'Graham', 2),
('Bill', 'Williamson', 3),
('Julie', 'Graham', 4),
('John', 'Smith', 5),
('Ross', 'Cummings', 6);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players (id),
    match_id INTEGER REFERENCES matches(id)
);

INSERT INTO goals (player_id, match_id)
VALUES
(1,1),
(2,1),
(2,1),
(2,1),
(3,2),
(3,2),
(1,2),
(1,3),
(3,4),
(3,4),
(3,5),
(1,5),
(2,6),
(3,6),
(2,6),
(2,6),
(3,6),
(2,6);