-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

-- CREATE TABLE songs
-- (
--   id SERIAL PRIMARY KEY,
--   title TEXT NOT NULL,
--   duration_in_seconds INTEGER NOT NULL,
--   release_date DATE NOT NULL,
--   artists TEXT[] NOT NULL,
--   album TEXT NOT NULL,
--   producers TEXT[] NOT NULL
-- );

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  artist_id INTEGER REFERENCES artists ON DELETE CASCADE,
  album_id INTEGER REFERENCES albums ON DELETE CASCADE,
  producer_id INTEGER REFERENCES producers ON DELETE CASCADE,
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  artist_id INTEGER REFERENCES artists ON DELETE CASCADE,
  release_date DATE NOT NULL
);

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  artist_name TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  producer_name TEXT NOT NULL
);

INSERT INTO artists
(
  artist_name
)
VALUES
('Hanson'), ('Queen'), ('Mariah Cary'), ('Boyz II Men'), ('Lady Gaga'), ('Bradley Cooper'), ('Nickelback'), ('Jay Z'), ('Alicia Keys'), ('Katy Perry'), ('Juicy J'), ('Maroon 5'), ('Christina Aguilera'), ('Avril Lavigne'), ('Destiny''s Child');

INSERT INTO producers
(producer_name)
VALUES
('Dust Brothers'), ('Stephen Lironi'), ('Roy Thomas Baker'), ('Walter Afanasieff'), ('Benjamin Rice'), ('Rick Parashar'), ('Al Shux'), ('Max Martin'), ('Cirkut'), ('Shellback'), ('Benny Blanco'), ('The Matrix'), ('Darkchild');

INSERT INTO albums
(title, artist_id, release_date)
VALUES
('Middle of Nowhere', 1, '04-15-1997'), ('A Night at the Opera', 2, '10-31-1975'), ('Daydream', 3, '11-14-1995'), ('A Star Is Born', {5,6}, '09-27-2018'), ('Silver Side Up', 7, '08-21-2001'), ('The Blueprint 3', 8, '10-20-2009'), ('Prism', 10, '12-17-2013'), ('Hands All Over', 12, '06-21-2011'), ('Let Go', 14, '05-14-2002'), ('The Writing''s on the Wall', 15, '11-07-1999');

INSERT INTO songs
(title, duration_in_seconds, artist_id, album_id, producer)
VALUES
('MMMBop', 238, 1, 1, {1, 2}), ('Bohemian Rhapsody', 355, 2, 2, 3), ('One Sweet Day', 282, {3, 4}, 3, 4), ('Shallow', 216, {5, 6}, 4, 5), ('How You Remind Me', 223, 7, 5, 6), ('New York State of Mind', 276, {8, 9}, 6, 7), ('Dark Horse', 215, {10, 11}, 7, {8, 9}), ('Moves Like Jagger', 201, {12, 13}, 8, {10, 11}), ('Complicated', 244, 14, 9, 12), ('Say My Name', 240, 15, 10, 13); 

-- INSERT INTO songs
--   (title, duration_in_seconds, release_date, artists, album, producers)
-- VALUES
--   ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
--   ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
--   ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
--   ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
--   ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
--   ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
--   ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
--   ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
--   ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
--   ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');
