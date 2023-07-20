CREATE TABLE games (
  id SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  multiplayer BOOLEAN NOT NULL,
  last_played_at DATE NOT NULL,
  label_id INTEGER REFERENCES labels(id),
  genre_id INTEGER REFERENCES genres(id),
  author_id INTEGER REFERENCES authors(id)
);
