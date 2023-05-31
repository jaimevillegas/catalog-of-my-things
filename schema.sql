	CREATE TABLE music_albums(
    id SERIAL PRIMARY KEY,
    publish_date VARCHAR(40),
    on_spotify BOOLEAN,
    archived BOOLEAN,
    genre_id INT,
    author_id INT,
    source_id INT,
    label_id INT
);

CREATE TABLE Genres( 
	id SERIAL PRIMARY KEY,
	name VARCHAR(60)
);

alter table music_albums add constraint fk_genre_id foreign key (genre_id) references genres(id);

CREATE TABLE book(
  id INT NOT NULL AUTO_INCREMENT,
  publisher VARCHAR(255),
  cover_state VARCHAR(255),
  FOREIGN KEY (id) REFERENCES item(id)
);

CREATE TABLE label(
  id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(255),
  color VARCHAR(255),
);

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
<<<<<<< HEAD

=======
>>>>>>> 7447ec205f575a2e76ae4ac34ddb3fce66262f63
