DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE region
(
    id SERIAL PRIMARY KEY,
    city TEXT NOT NULL
);

INSERT INTO region (city)
VALUES
('San Francisco'),
('Atlanta'),
('Seattle');

CREATE TABLE category
(
    id SERIAL PRIMARY KEY,
    category TEXT NOT NULL
);

INSERT INTO category (category)
VALUES
('Job Offered'),
('For Sale'),
('Community Event');

CREATE TABLE user_name
(
    id SERIAL PRIMARY KEY,
    user_name TEXT NOT NULL
);

INSERT INTO user_name (user_name)
VALUES
('duckduck'),
('moose'),
('Cricket');

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    info TEXT NOT NULL,
    user_id INTEGER REFERENCES user_name (id),
    category_id INTEGER REFERENCES category (id),
    region_id INTEGER REFERENCES region (id)
);

INSERT INTO posts (title, info, user_id, category_id, region_id)
VALUES
('Looking For Landscaper', 'Looking to hire professional landscaper for the summer', 3, 1, 2),
('Selling Couch', 'Selling brand new couch, I dont like the color', 2, 2, 3),
('Farmers Market', 'Farmers Market now open in town', 1, 3, 1);