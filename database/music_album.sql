CREATE TABLE music_albums (
  id SERIAL PRIMARY KEY,
  author VARCHAR(255) NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  on_spotify BOOLEAN NOT NULL,
  author_id INTEGER REFERENCES authors(id),
  genre_id INTEGER REFERENCES genres(id),
  label_id INTEGER REFERENCES labels(id)
);