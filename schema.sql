	CREATE TABLE MusicAlbum(
  id SERIAL PRIMARY KEY,
  publish_date VARCHAR(255),
  on_spotify BOOLEAN,
  archived BOOLEAN,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT
);