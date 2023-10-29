-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around_id INTEGER REFERENCES star ON DELETE CASCADE,
  galaxy TEXT NOT NULL,
  moons TEXT[]
);

CREATE TABLE star
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  planets_id INTEGER REFERENCES planets ON DELETE CASCADE
);

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy, moons)
VALUES
  ('Earth', 1.00, 1, 'Milky Way', '{"The Moon"}'),
  ('Mars', 1.88, 1, 'Milky Way', '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, 1, 'Milky Way', '{}'),
  ('Neptune', 164.8, 1, 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, 2, 'Milky Way', '{}'),
  ('Gliese 876 b', 0.23, 3, 'Milky Way', '{}');

  INSERT INTO star
  (name, planets_id)
  VALUES
  ('The Sun', {1, 2, 3, 4}), ('Proxima Centauri', 5), ('Gliese 876', 6);