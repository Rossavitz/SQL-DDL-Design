-- from the terminal run:
-- psql < music.sql

-- DROP DATABASE IF EXISTS music;

-- CREATE DATABASE music;

-- \c music

CREATE TABLE artist
(
  id SERIAL PRIMARY KEY,
  artist_name TEXT NOT NULL
);

INSERT INTO artist (artist_name)
VALUES
('Hanson'),
('Queen'),
('Mariah Carey'),
('Boyz II Men'),
('Lady Gaga'),
('Bradley Cooper'),
('Nickelback'),
('Jay Z'),
('Alicia Keys'),
('Katy Perry'),
('Juicy J'),
('Maroon 5'),
('Christina Aguilera'),
('Avril Lavigne'),
('Destinys Child');

CREATE TABLE producer
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO producer (name)
VALUES
('Dust Brothers'),
('Stephen Lironi'),
('Roy Thomas Baker'),
('Walter Afanasieff'),
('Benjamin Rice'),
('Rick parashar'),
('Al Shux'),
('Max Martin'),
('Cirkut'),
('Shellback'),
('Benny Blanco'),
('The Matrix'),
('Darkchild');

CREATE TABLE album
(
  id SERIAL PRIMARY KEY,
  album TEXT NOT NULL
);

INSERT INTO album (album)
VALUES
('Middle of Nowhere'),
('A Night at the Opera'),
('Daydream'),
('A Start Is Born'),
('Silver Side Up'),
('The Blueprint 3'),
('Prism'),
('Hands All Over'),
('Let Go'),
('The Writings on the Wall');


CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album_id INTEGER REFERENCES album (id)
);

INSERT INTO songs
  (title, duration_in_seconds, release_date, album_id)
VALUES
  ('MMMBop', 238, '04-15-1997', 1),
  ('Bohemian Rhapsody', 355, '10-31-1975', 2),
  ('One Sweet Day', 282, '11-14-1995', 3),
  ('Shallow', 216, '09-27-2018', 4),
  ('How You Remind Me', 223, '08-21-2001', 5),
  ('New York State of Mind', 276, '10-20-2009', 6),
  ('Dark Horse', 215, '12-17-2013', 7),
  ('Moves Like Jagger', 201, '06-21-2011', 8),
  ('Complicated', 244, '05-14-2002', 9),
  ('Say My Name', 240, '11-07-1999', 10);


CREATE TABLE song_artist
(
  id SERIAL PRIMARY KEY,
  song INTEGER REFERENCES songs (id),
  artist INTEGER REFERENCES artist (id)
);

INSERT INTO song_artist (song, artist)
VALUES
(1,1),
(2,2),
(3,3),
(3,4),
(4,5),
(4,6),
(5,7),
(6,8),
(6,9),
(7,10),
(7,11),
(8,12),
(8,13),
(9,14),
(10,15);

CREATE TABLE song_producer
(
  id SERIAL PRIMARY KEY,
  song INTEGER REFERENCES songs (id),
  producer INTEGER REFERENCES producer (id)
);

INSERT INTO song_producer (song, producer)
VALUES
(1,1),
(1,2),
(2,3),
(3,4),
(4,5),
(5,6),
(6,6),
(7,8),
(7,9),
(8,10),
(8,11),
(9,12),
(10,13);
