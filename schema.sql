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
