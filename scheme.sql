CREATE TABLE game (
  id SERIAL PRIMARY KEY,
  multiplayer VARCHAR(100) NOT NULL,
  last_played_at DATE NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL DEFAULT false,
  genre_id INT REFERENCES genre (id),
  author_id INT REFERENCES author (id),
  source_id INT REFERENCES source (id),
  label_id INT REFERENCES label (id)
);

CREATE TABLE author (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
)

